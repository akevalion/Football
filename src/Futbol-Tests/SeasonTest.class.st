"
A SeasonTest is a test class for testing the behavior of Season
"
Class {
	#name : #SeasonTest,
	#superclass : #TestCase,
	#category : #'Futbol-Tests'
}

{ #category : #tests }
SeasonTest >> testTeamsEvolution [
	| league |
	league := ESL databaseDo: [
		league := League storedInstances asOrderedCollection first.
		 ].
	league seasons first inspectorTeamEvolutionLinePlot
	
]
