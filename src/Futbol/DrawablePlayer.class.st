"
Used by Season to represent a player in soccer field
"
Class {
	#name : #DrawablePlayer,
	#superclass : #Object,
	#instVars : [
		'id',
		'x',
		'y',
		'playerName'
	],
	#category : #'Futbol-Utilities'
}

{ #category : #'as yet unclassified' }
DrawablePlayer class >> id: id x: x y: y [

	^ self new
		id: id;
		x: x;
		y: y;
		yourself
]

{ #category : #converting }
DrawablePlayer >> asPlayer [
	id ifNil: [ ^ Player nilPlayer ].
	^ ESL databaseDo: [ Player storedInstances detect: [ :player | player player_api_id = id ] ]
]

{ #category : #accessing }
DrawablePlayer >> computePlayerName [
	id ifNil: [ ^ 'NO_NAME' ].
	^ ESL databaseDo: [ 
		(Player storedInstances detect: [ :player | player player_api_id = id ]) player_name
		 ]
]

{ #category : #accessing }
DrawablePlayer >> id [

	^ id
]

{ #category : #accessing }
DrawablePlayer >> id: anObject [

	id := anObject
]

{ #category : #accessing }
DrawablePlayer >> lastName [

	| substrings |
	substrings := (self playerName substrings: ' ').
	^ substrings last asString
]

{ #category : #accessing }
DrawablePlayer >> playerName [
	^ playerName ifNil: [ playerName := self computePlayerName ]
]

{ #category : #accessing }
DrawablePlayer >> x [

	^ x
]

{ #category : #accessing }
DrawablePlayer >> x: anObject [

	"x := anObject "

	x := anObject = 1
		     ifTrue: [ 5 ]
		     ifFalse: [ anObject ]
]

{ #category : #accessing }
DrawablePlayer >> y [

	^ y
]

{ #category : #accessing }
DrawablePlayer >> y: anObject [

	y := anObject
]
