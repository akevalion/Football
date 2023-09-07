Class {
	#name : #AnimatedRadarStatsVisualization,
	#superclass : #RadarStatsVisualization,
	#instVars : [
		'title',
		'animatedPolygon',
		'polygonAndDots'
	],
	#category : #'Football-Roassal'
}

{ #category : #hooks }
AnimatedRadarStatsVisualization >> addAnimationButtonIn: aCanvas [

	| button |
	button := self createButton.
	aCanvas when: RSExtentChangedEvent do: [ self updateButtonPosition: button ] for: self.
	aCanvas add: button
]

{ #category : #hooks }
AnimatedRadarStatsVisualization >> computePolygonAndDots [
	| canvas |
	canvas := kiviat container.
	polygonAndDots := OrderedCollection new.
	kiviat polygonShapes with: stats do: [ :polygon :stat | | dots |
		polygon pushFront.
		polygonAndDots add: polygon.
		dots := polygon points with: stat dataArray collect: [ :point :value |
			self newDot
				model: value;
				position: point + polygon position;
				yourself ].
		canvas addAll: dots.
		polygonAndDots addAll: dots ].
]

{ #category : #hooks }
AnimatedRadarStatsVisualization >> createButton [
	^ EvolutionButton new
		activeState: { 'label' -> 'Stop Evolution'. 'iconName' -> #'protocolPrivate' };
		stopState: { 'label' -> 'Play Evolution'. 'iconName' -> #'smallPrintIt' };
		activeAction: [ self playEvolutionAnimation ];
		stopAction: [ self stopEvolutionAnimation ];
		yourself
]

{ #category : #animation }
AnimatedRadarStatsVisualization >> newAnimationFor: fromShape index: index shapes: polygonShapes [

	| k toShape |
	k := index + 1.
	k > polygonShapes size ifTrue: [ k := 1 ].
	toShape := polygonShapes at: k.

	^ title canvas transitionAnimation
		  duration: 1 seconds;
		  easing: RSEasingInterpolator expIn;
		  when: RSAnimationEndEvent
		  do: [ :evt | title text: (stats at: k) dateAndTime asDate ]
		  for: self;
		  onStepDo: [ :t |
			  animatedPolygon
				  privatePoints:
					  (fromShape points with: toShape points
						   collect: [ :p1 :p2 | p1 interpolateTo: p2 at: t ]);
				  resetPath;
				  color: (fromShape color interpolateTo: toShape color at: t);
				  position: (fromShape position interpolateTo: toShape position at: t).
			  animatedPolygon border color:
				  (fromShape border color interpolateTo: toShape border color at: t).
			  animatedPolygon signalUpdate ]
]

{ #category : #hooks }
AnimatedRadarStatsVisualization >> newDot [
	^ RSEllipse new
		size: 5;
		color: Color black;
		popup;
		yourself
]

{ #category : #animation }
AnimatedRadarStatsVisualization >> playEvolutionAnimation [
	| canvas animations polygonShapes animation |
	canvas := kiviat canvas.
	polygonShapes := kiviat polygonShapes.
	animatedPolygon := RSPolygon new withBorder.
	title := RSLabel new
		color: Color black;
		text: stats first dateAndTime asDate;
		fontSize: 20;
		yourself.
	canvas add: title.
	canvas add: animatedPolygon.
	RSLocation new above; offset: 0@ -20; move: title on: canvas shapes.
	"because 2"
	polygonAndDots do: #remove.
	
	animations := kiviat polygonShapes collectWithIndex: [:fromShape :index |
		self newAnimationFor: fromShape index: index shapes: polygonShapes ].
	animation := canvas animationFrom: animations.
	animation repeat.
	canvas signalUpdate.
	
]

{ #category : #hooks }
AnimatedRadarStatsVisualization >> renderKiviatIn: aCanvas [
	super renderKiviatIn: aCanvas.
	self computePolygonAndDots.
	self addAnimationButtonIn: aCanvas.
]

{ #category : #animation }
AnimatedRadarStatsVisualization >> stopEvolutionAnimation [
	| c |
	c := kiviat canvas.
	c animations do: #stop.
	title remove.
	animatedPolygon remove.
	c addAll: polygonAndDots.
]

{ #category : #hooks }
AnimatedRadarStatsVisualization >> updateButtonPosition: button [
	RSLocation new 
		inner;
		bottom;
		right;
		offset: -10 asPoint;
		move: button on: (0@0 corner: button canvas extent) 
]
