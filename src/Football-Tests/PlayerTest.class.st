"
A PlayerTest is a test class for testing the behavior of Player
"
Class {
	#name : #PlayerTest,
	#superclass : #TestCase,
	#category : #'Football-Tests-Entities'
}

{ #category : #tests }
PlayerTest >> testPlayerStats [
	| player presenter |
	player := EuropeanFootballLeagues databaseDo: [ 
		Player storedInstances 
			detect: [ :each | each player_api_id = 30981 "Messi" ] ].
	presenter := player inspectorStats.
	self assert: presenter isPresenter
]
