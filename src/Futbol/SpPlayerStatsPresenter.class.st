"
This class uses a spider/radar/kiviat visualization
"
Class {
	#name : #SpPlayerStatsPresenter,
	#superclass : #SpRoassal3InspectorPresenter,
	#instVars : [
		'player',
		'title',
		'animatedPolygon'
	],
	#category : #'Futbol-Spec'
}

{ #category : #animation }
SpPlayerStatsPresenter >> addAnimationButtonIn: kiviat stats: list [
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
			ifTrue: [ self playEvolutionAnimation: kiviat stats: list ]
			ifFalse: [ self stopEvolutionAnimation: kiviat ].
		setValues value.
		evt signalUpdate ].
	button @ (RSHighlightable color: Color lightGray translucent).
	
	c when: RSExtentChangedEvent do: [ 
		RSLocation new inner; bottom; right; offset: -10 asPoint;
			move: button on: (0@0 corner: c extent) ].
	c addShape: button
]

{ #category : #animation }
SpPlayerStatsPresenter >> newAnimationFor: fromShape index: index shapes: shapes stats: list [
	| k toShape |
	k := index + 1.
	k > shapes size ifTrue: [ k := 1 ].
	toShape := shapes at: k.
	
	^ canvas transitionAnimation
		duration: 1 seconds;
		easing: RSEasingInterpolator expIn;
		when: RSAnimationEndEvent do: [ :evt | title text: (list at: k) dateAndTime asDate ];
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

{ #category : #building }
SpPlayerStatsPresenter >> newCanvas [
	| list kiviat c |
	c := RSCanvas new.
	list := player stats.
	list ifEmpty: [ 
		c add: (RSLabel text: 'No player information').
		^ c ].
	kiviat := RSKiviat new.
	list do: [ :stat | kiviat addRow: stat dataArray ].
	kiviat
		axisNames: PlayerAttributes axisNames;
		usePolygonBorder;
		container: c;
		maxValue: 100;
		minValue: 0;
		build.
	kiviat labels do: [ :lbl | lbl color: Color black ].
	self addAnimationButtonIn: kiviat stats: list.
	c @ RSCanvasController.
	^ c
]

{ #category : #animation }
SpPlayerStatsPresenter >> playEvolutionAnimation: kiviat stats: list [
	| c animations shapes animation |
	c := kiviat canvas.
	shapes := kiviat polygonShapes.
	animatedPolygon := RSPolygon new withBorder.
	title := RSLabel new
		color: Color black;
		text: list first dateAndTime asDate;
		fontSize: 20;
		yourself.
	c add: title.
	c add: animatedPolygon.
	RSLocation new above; offset: 0@ -20; move: title on: canvas shapes.
	
	animations := shapes collectWithIndex: [:fromShape :index |
		fromShape remove.
		self newAnimationFor: fromShape index: index shapes: shapes stats: list ].
	animation := canvas animationFrom: animations.
	animation repeat.
	c signalUpdate.
	
]

{ #category : #accessing }
SpPlayerStatsPresenter >> player: aPlayer [
	player := aPlayer.
	self canvas: self newCanvas
]

{ #category : #animation }
SpPlayerStatsPresenter >> stopEvolutionAnimation: kiviat [
	| c |
	c := kiviat canvas.
	c animations do: #stop.
	title remove.
	animatedPolygon remove.
	c addAll: kiviat polygonShapes.
]
