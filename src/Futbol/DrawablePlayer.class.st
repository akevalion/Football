Class {
	#name : #DrawablePlayer,
	#superclass : #Object,
	#instVars : [
		'id',
		'x',
		'y'
	],
	#category : #Futbol
}

{ #category : #'as yet unclassified' }
DrawablePlayer class >> id: id x: x y: y [

	^ self new
		id: id;
		x: x;
		y: y;
		yourself
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
DrawablePlayer >> x [

	^ x
]

{ #category : #accessing }
DrawablePlayer >> x: anObject [

	x := anObject
]

{ #category : #accessing }
DrawablePlayer >> y [

	^ y
]

{ #category : #accessing }
DrawablePlayer >> y: anObject [

	y := anObject
]
