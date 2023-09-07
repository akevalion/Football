"
Used to display some custom buttons
"
Class {
	#name : #SeasonsPresenter,
	#superclass : #RSAbstractContainerBuilder,
	#instVars : [
		'seasons'
	],
	#category : #'Football-Spec-Core'
}

{ #category : #'accessing - defaults' }
SeasonsPresenter >> defaultContainer [

	^ RSCanvas new
		  when: RSExtentChangedEvent do: [ :evt | evt canvas zoomToFit ] for: self;
		  yourself
]

{ #category : #highlighting }
SeasonsPresenter >> highlight: evt [
	evt shape children first border: (RSBorder new
		width: 1;
		color: 'blue';
		yourself)
]

{ #category : #highlighting }
SeasonsPresenter >> highlightable [
	^ RSHighlightable new
		when: RSHighlightEvent send: #highlight: to: self;
		when: RSUnHighlightEvent send: #unhighlight: to: self;
		yourself
]

{ #category : #layout }
SeasonsPresenter >> layout: boxes [
	RSGridLayout new lineItemsCount: 2; gapSize: 10; on: boxes.
]

{ #category : #factory }
SeasonsPresenter >> newBox: each [
	| box text color paint |
	text := RSLabel new
		fontSize: 15;
		color: Color white;
		text: each asString;
		yourself.
	color := Color r: 41 g: 128 b: 185 range: 255.
	paint := LinearGradientPaint fromArray: { 
		0 -> color.
		0.5 -> color lighter.
		1 -> color }.
	paint start: 0@ -15; stop: 0@ 15.
	box := RSBox new
		extent: 200@30;
		paint: paint;
		cornerRadius: 4;
		yourself.
	^ { box. text } asShape
		model: each;
		yourself
]

{ #category : #hooks }
SeasonsPresenter >> renderIn: aCanvas [
	| boxes |
	boxes := seasons collect: [ :each | self newBox: each ] as: RSGroup.
	boxes @ self highlightable.
	self layout: boxes.
	aCanvas addAll: boxes.
]

{ #category : #accessing }
SeasonsPresenter >> seasons [
	^ seasons
]

{ #category : #accessing }
SeasonsPresenter >> seasons: aCollection [
	seasons := aCollection
]

{ #category : #highlighting }
SeasonsPresenter >> unhighlight: evt [
	evt shape children first noBorder.
]
