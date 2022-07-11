"
used  to create a map
"
Class {
	#name : #ESLMapVisualization,
	#superclass : #RSAbstractContainerBuilder,
	#instVars : [
		'leagues'
	],
	#category : #'Futbol-Roassal'
}

{ #category : #hooks }
ESLMapVisualization >> createEuropeanCountry: name [
	| league path |
	path := RSSVGPath new.
	path border: (RSBorder new color: Color white; width: 1).
	league := self leagueByCountryName: name.
	
	path svgPath: (name asSymbol value: ESLMapIcons).
	path extent: path extent * 10.
	path position: path position * 10.
	
	path color: (Color veryLightGray alpha:0.7).
	
	league ifNil: [ 
		path @ (RSPopup themeText: name).
	] ifNotNil: [
		path @ RSPopup theme.
		path border color: Color black.
		path model: league.
		path paint: (self flagPaintFor: path) ].
	
	^ path
]

{ #category : #'accessing - defaults' }
ESLMapVisualization >> defaultContainer [
	^ RSCanvas new @ RSCanvasController
]

{ #category : #hooks }
ESLMapVisualization >> downloadAndSaveIcon: name [
	| url form contents selector |
	url := 'https://countryflagsapi.com/png/', name.
	contents := (ZnEasy get: url) contents.
	selector := (name, 'Icon').
	ESLMapIcons class compile: (String streamContents: [ :s |
		s << selector; cr; tab ; << '^ PNGReadWriter formFromStream: '.
		contents printOn: s.
		s << ' readStream.' ] ) classified: 'icons'.
	form := PNGReadWriter formFromStream: contents readStream.
]

{ #category : #hooks }
ESLMapVisualization >> europeShape [
	^ (ESLMapIcons europe collect: [ :name | self createEuropeanCountry: name ]) asShape.
]

{ #category : #hooks }
ESLMapVisualization >> flagPaintFor: path [

	| form paint name selector point newScale |
	name := path model countryName asLowercase.
	selector := (name, 'Icon') asSymbol.
	(ESLMapIcons class canUnderstand: selector)
		ifFalse: [ self downloadAndSaveIcon: name ].
	form := selector value: ESLMapIcons.
	point := form extent / path extent.
	newScale := point x < point y 
		ifTrue: [ path extent x @ (form extent y * form extent y) ]
		ifFalse: [ form extent x * form extent x @ path extent y].
	form := form scaledToSize: newScale.
	paint := (AthensCairoPatternSurfacePaint 
		createForSurface: (AthensCairoSurface fromForm: form)).
	paint origin: (form extent / 2) negated.
	
	^ paint
]

{ #category : #hooks }
ESLMapVisualization >> leagueByCountryName: name [
	^ self leagues detect: [ :league | league countryName = name ] ifNone: [ nil ]
]

{ #category : #accessing }
ESLMapVisualization >> leagues [
	^ leagues
]

{ #category : #accessing }
ESLMapVisualization >> leagues: aCollection [ 
	leagues := aCollection
]

{ #category : #hooks }
ESLMapVisualization >> renderIn: aCanvas [
	aCanvas add: self europeShape
	
	
]
