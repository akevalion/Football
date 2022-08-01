Class {
	#name : #ESLMapVisualization,
	#superclass : #RSAbstractContainerBuilder,
	#instVars : [
		'leagues'
	],
	#category : #'Football-Roassal'
}

{ #category : #rendering }
ESLMapVisualization >> createEuropeanCountry: countryName [
	| league path |
	path := RSSVGPath new.
	path border: (RSBorder new color: Color white; width: 1; yourself).
	league := self leagueByCountryName: countryName.
	path svgPath: (countryName asSymbol value: ESLMapIcons).
	path extent: path extent * 10.
	path position: path position * 10.
	
	path color: (Color veryVeryLightGray alpha: 0.7).
	league ifNil: [ 
		path @ (RSPopup themeText: countryName) ]
	ifNotNil: [ 
		path @ RSPopup theme.
		path model: league.
		path border color: Color black.
		path paint: (self flagPaintFor: path)
		 ].
	^ path
]

{ #category : #'accessing - defaults' }
ESLMapVisualization >> defaultContainer [
	^ RSCanvas new @ RSCanvasController
]

{ #category : #rendering }
ESLMapVisualization >> europeShape [
	^ (ESLMapIcons europe collect: [ :countryName| self createEuropeanCountry: countryName ]) asShape
]

{ #category : #rendering }
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
		ifFalse: [ form extent x * form extent x @ path extent y ].
	form := form scaledToSize: newScale.
	paint := AthensCairoPatternSurfacePaint
		createForSurface: (AthensCairoSurface fromForm: form).
	paint origin: (form extent / -2).
	^ paint.
]

{ #category : #rendering }
ESLMapVisualization >> leagueByCountryName: countryName [
	^ self leagues detect: [ :league | league countryName = countryName ] ifNone: [ nil ]
]

{ #category : #accessing }
ESLMapVisualization >> leagues [

	^ leagues
]

{ #category : #accessing }
ESLMapVisualization >> leagues: anObject [

	leagues := anObject
]

{ #category : #rendering }
ESLMapVisualization >> renderIn: aCanvas [
	aCanvas add: self europeShape
]
