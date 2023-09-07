"
A LeagueTest is a test class for testing the behavior of League
"
Class {
	#name : #LeagueTest,
	#superclass : #TestCase,
	#instVars : [
		'league'
	],
	#category : #'Football-Tests-Entities'
}

{ #category : #running }
LeagueTest >> setUp [
	super setUp.
	league := EuropeanFootballLeagues databaseDo: [ League storedInstances asOrderedCollection ].
	league := league anyOne.
	
]

{ #category : #tests }
LeagueTest >> testBasic [
	| leagueName |
	leagueName := 'Belgium Jupiler League'.
	self assert: league country_id isNumber.
	self assert: league name equals: leagueName.
	self assert: league asString equals: leagueName
]

{ #category : #tests }
LeagueTest >> testTeamList [
	| presenter |
	presenter := league inspectorTeamList.
	self assert: presenter isPresenter
]

{ #category : #tests }
LeagueTest >> testTeamSeasonList [
	| presenter |
	presenter := league inspectorSeasonList.
	self assert: presenter isPresenter
]
