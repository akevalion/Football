"
Custom button created for this project
"
Class {
	#name : #EvolutionButton,
	#superclass : #RSComposite,
	#instVars : [
		'activeState',
		'stopState',
		'activeAction',
		'stopAction',
		'label',
		'icon',
		'isActive'
	],
	#category : #'Football-Roassal'
}

{ #category : #accessing }
EvolutionButton >> activeAction [
	^ activeAction
]

{ #category : #accessing }
EvolutionButton >> activeAction: aBlock [
	activeAction := aBlock
]

{ #category : #accessing }
EvolutionButton >> activeState [
	^ activeState
]

{ #category : #accessing }
EvolutionButton >> activeState: state [
	activeState := state
]

{ #category : #initialization }
EvolutionButton >> initialize [
	super initialize.
	isActive := false.
	self isFixed: true.
	label := RSLabel new.
	icon := RSBitmap new.
]

{ #category : #testing }
EvolutionButton >> isActive [
	^ isActive
]

{ #category : #accessing }
EvolutionButton >> isActive: aBoolean [
	isActive := aBoolean
]

{ #category : #events }
EvolutionButton >> mouseClick: event [
	self isActive ifTrue: [
		self state: self stopState.
		self stopAction value.
	] ifFalse: [
		self state: self activeState.
		self activeAction value.
	].
	self isActive: self isActive not.
]

{ #category : #rendering }
EvolutionButton >> renderOn: aCanvas [
	super renderOn: aCanvas.
	self state: self stopState.
	RSHorizontalLineLayout on: { icon. label }.
	self children: { icon. label }.
	self adjustToChildren.
	self addInteraction: (RSHighlightable color: Color lightGray translucent).
	self padding: 5.
	self when: RSMouseClick send: #mouseClick: to: self.
]

{ #category : #rendering }
EvolutionButton >> state: state [
	state asDictionary
		at: #label ifPresent: [ :value | label text: value  ];
		at: #iconName ifPresent: [:value | icon form: (self iconNamed: value )].
]

{ #category : #accessing }
EvolutionButton >> stopAction [
	^ stopAction
]

{ #category : #accessing }
EvolutionButton >> stopAction: aBlock [
	stopAction := aBlock
]

{ #category : #accessing }
EvolutionButton >> stopState [
	^ stopState
]

{ #category : #accessing }
EvolutionButton >> stopState: state [
	stopState := state
]
