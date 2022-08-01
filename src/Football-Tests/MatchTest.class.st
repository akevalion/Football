"
A MatchTest is a test class for testing the behavior of Match
"
Class {
	#name : #MatchTest,
	#superclass : #TestCase,
	#instVars : [
		'match'
	],
	#category : #'Football-Tests-Entities'
}

{ #category : #running }
MatchTest >> setUp [
	super setUp.
	
	match := ESL databaseDo: [ Match storedInstances detect: [ :each | each id = 24420 ] ].
]

{ #category : #tests }
MatchTest >> testOpenMatchField [
	| field |
	field := match inspectorMatchField.
	self assert: field isPresenter.
]
