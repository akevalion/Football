"
A TeamTest is a test class for testing the behavior of Team
"
Class {
	#name : #TeamTest,
	#superclass : #TestCase,
	#category : #'Futbol-Tests-Entities'
}

{ #category : #tests }
TeamTest >> testMatches [
	| team |
	team := ESL databaseDo: [ Team storedInstances detect: [ :obj | 
			obj team_short_name = 'BAR' ] ].
	self assert: team inspectorMatches isPresenter
]

{ #category : #tests }
TeamTest >> testPerformanceAllTime [
	| team |
	team := ESL databaseDo: [ Team storedInstances detect: [ :obj | 
			obj team_short_name = 'BAR' ] ].
	self assert: team inspectorTablePerformance isPresenter 
]
