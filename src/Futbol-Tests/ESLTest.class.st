"
An ESLTest is a test class for testing the behavior of ESL
"
Class {
	#name : #ESLTest,
	#superclass : #TestCase,
	#category : #'Futbol-Tests'
}

{ #category : #tests }
ESLTest >> testCSVFilesShouldExists [
	| root |
	root := '.' asFileReference.
	self assert: (root files anySatisfy: [ :file | '*.csv' match: file basename ]).
]

{ #category : #tests }
ESLTest >> testZipPath [
	| esl |
	esl := ESL new.
	self assert: esl zipPath isString
]
