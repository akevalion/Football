"
An ESLTest is a test class for testing the behavior of ESL
"
Class {
	#name : #ESLTest,
	#superclass : #TestCase,
	#category : #'Football-Tests-Core'
}

{ #category : #accessing }
ESLTest >> defaultTimeLimit [
	^ 30 minutes
]

{ #category : #tests }
ESLTest >> testCSVFilesShouldExists [
	
	self 
		assert: [ EuropeanFootballLeagues databaseFileExists or:  [EuropeanFootballLeagues csvFilesExists] ]
		description: 'Baseline should created the csv files'.
]

{ #category : #tests }
ESLTest >> testCreateDatabase [
	EuropeanFootballLeagues createDatabase
]

{ #category : #tests }
ESLTest >> testDatabaseDo [
	| list |
	list := EuropeanFootballLeagues databaseDo: [ 
		(Country storedInstances select: [ :each | true ])
		 ].
	self assert: list notEmpty.
	self assert: list size > 5
]

{ #category : #tests }
ESLTest >> testDatabaseShouldExists [
	
	self 
		assert: EuropeanFootballLeagues databaseFileExists
		description: 'Baseline should created the database'.
]

{ #category : #tests }
ESLTest >> testHomeDirectory [
	self assert: EuropeanFootballLeagues csvDirectory isString
]

{ #category : #tests }
ESLTest >> testLeaguesMap [
	self assert: EuropeanFootballLeagues new inspectorLeaguesMap isPresenter
]

{ #category : #tests }
ESLTest >> testZipPathSoccerCSV [
	"self assert: ESL zipPathSoccerCSV exists."
	self assert: EuropeanFootballLeagues zipPathSoccer exists.
]
