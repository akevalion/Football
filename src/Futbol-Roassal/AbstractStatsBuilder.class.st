"
I am an abstract class to create a radar visualization
"
Class {
	#name : #AbstractStatsBuilder,
	#superclass : #RSAbstractContainerBuilder,
	#instVars : [
		'stats',
		'title',
		'animatedPolygon',
		'polygonAndDots',
		'model'
	],
	#category : #'Futbol-Roassal'
}

{ #category : #animation }
AbstractStatsBuilder >> addAnimationButtonIn: kiviat [
	| icon label button setValues c |
	c := kiviat canvas.
	icon := RSBitmap new.
	label := RSLabel new color: Color black.
	
	setValues := [ 
		label text = 'Play Evolution' ifTrue: [ 
			label text: 'Stop Evolution'.
			icon form: (self iconNamed: #protocolPrivate)
		] ifFalse: [
			label text: 'Play Evolution'.
			icon form: (self iconNamed: #smallPrintIt) ] 
	].
	setValues value.
	RSHorizontalLineLayout on: { icon. label }.
	button := { icon. label } asShape.
	button isFixed: true.
	button padding: 5.
	button when: RSMouseClick do: [ :evt |
		label text = 'Play Evolution' 
			ifTrue: [ self playEvolutionAnimation: kiviat ]
			ifFalse: [ self stopEvolutionAnimation: kiviat ].
		setValues value.
		evt signalUpdate ].
	button @ (RSHighlightable color: Color lightGray translucent).
	
	c when: RSExtentChangedEvent do: [ 
		RSLocation new inner; bottom; right; offset: -10 asPoint;
			move: button on: (0@0 corner: c extent) ].
	c addShape: button
]

{ #category : #accessing }
AbstractStatsBuilder >> axisNames [
	^ self subclassResponsibility
]

{ #category : #hooks }
AbstractStatsBuilder >> computePolygonDots: kiviat [
	| c |
	c := kiviat container.
	polygonAndDots := OrderedCollection new.
	kiviat polygonShapes with: stats do: [ :polygon :stat | | dots |
		polygon pushFront.
		polygonAndDots add: polygon.
		dots := polygon points with: stat dataArray collect: [ :point :value |
			RSEllipse new
				size: 5;
				color: Color black;
				model: value;
				popup;
				position: point+polygon position;
				yourself ].
		c addAll: dots.
		polygonAndDots addAll: dots ].
]

{ #category : #'accessing - defaults' }
AbstractStatsBuilder >> defaultContainer [
	^ RSCanvas new @ RSCanvasController
]

{ #category : #accessing }
AbstractStatsBuilder >> model: anObject [
	model := anObject.
	stats := model stats.
]

{ #category : #animation }
AbstractStatsBuilder >> newAnimationFor: fromShape index: index shapes: polygonShapes [
		| k toShape |
	k := index + 1.
	k > polygonShapes size ifTrue: [ k := 1 ].
	toShape := polygonShapes at: k.
	
	^ title canvas transitionAnimation
		duration: 1 seconds;
		easing: RSEasingInterpolator expIn;
		when: RSAnimationEndEvent do: [ :evt | title text: (stats at: k) dateAndTime asDate ];
		onStepDo: [ :t |
			animatedPolygon 
				privatePoints: (fromShape points with: toShape points 
					collect: [ :p1 :p2 | p1 interpolateTo: p2 at: t ]);
				resetPath;
				color: (fromShape color interpolateTo: toShape color at: t);
				position: (fromShape position interpolateTo: toShape position at: t).
			animatedPolygon border 
				color: (fromShape border color interpolateTo: toShape border color at: t).
			animatedPolygon signalUpdate ]
]

{ #category : #hooks }
AbstractStatsBuilder >> newKiviat [
	^ RSKiviat new
		in: [ :kiviat | stats do: [ :stat | kiviat addRow: stat dataArray ] ];
		axisNames: self axisNames;
		usePolygonBorder;
		maxValue: 100;
		minValue: 0;
		yourself
]

{ #category : #animation }
AbstractStatsBuilder >> playEvolutionAnimation: kiviat [
	| c animations polygonShapes animation |
	c := kiviat canvas.
	polygonShapes := kiviat polygonShapes.
	animatedPolygon := RSPolygon new withBorder.
	title := RSLabel new
		color: Color black;
		text: stats first dateAndTime asDate;
		fontSize: 20;
		yourself.
	c add: title.
	c add: animatedPolygon.
	RSLocation new above; offset: 0@ -20; move: title on: c shapes.
	"because 2"
	polygonAndDots do: #remove.
	
	animations := kiviat polygonShapes collectWithIndex: [:fromShape :index |
		self newAnimationFor: fromShape index: index shapes: polygonShapes ].
	animation := c animationFrom: animations.
	animation repeat.
	c signalUpdate.
	
]

{ #category : #hooks }
AbstractStatsBuilder >> renderIn: aCanvas [
	| kiviat |
	stats ifEmpty: [ 
		aCanvas add: (RSLabel text: 'No information').
		^ self.
	].
	kiviat := self newKiviat.
	kiviat container: aCanvas.
	kiviat build.
	kiviat labels do: [ :lbl | lbl color: Color black ].
	self computePolygonDots: kiviat.
	self addAnimationButtonIn: kiviat.
	
	
]

{ #category : #animation }
AbstractStatsBuilder >> stopEvolutionAnimation: kiviat [
	| c |
	c := kiviat canvas.
	c animations do: #stop.
	title remove.
	animatedPolygon remove.
	c addAll: polygonAndDots.
]
