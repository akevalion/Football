"
A TeamTest is a test class for testing the behavior of Team
"
Class {
	#name : #TeamTest,
	#superclass : #TestCase,
	#category : #'Football-Tests-Entities'
}

{ #category : #tests }
TeamTest >> testMatches [
	| team |
	team := EuropeanFootballLeagues databaseDo: [ Team storedInstances detect: [ :obj | 
			obj team_short_name = 'BAR' ] ].
	self assert: team inspectorMatches isPresenter
]

{ #category : #tests }
TeamTest >> testPerformanceAllTime [
	| team |
	team := EuropeanFootballLeagues databaseDo: [ Team storedInstances detect: [ :obj | 
			obj team_short_name = 'BAR' ] ].
	self assert: team inspectorTablePerformance isPresenter 
]
