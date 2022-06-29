"
A MatchTest is a test class for testing the behavior of Match
"
Class {
	#name : #MatchTest,
	#superclass : #TestCase,
	#category : #'Futbol-Tests-Entities'
}

{ #category : #tests }
MatchTest >> testOpenMatchField [
	| match field |
	match := ESL databaseDo: [ Match storedInstances detect: [ :each | each id = 24420 ] ].
	field := match inspectorMatchField.
	self assert: field isPresenter.
]
