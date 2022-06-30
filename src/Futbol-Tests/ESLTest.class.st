"
An ESLTest is a test class for testing the behavior of ESL
"
Class {
	#name : #ESLTest,
	#superclass : #TestCase,
	#category : #'Futbol-Tests-Core'
}

{ #category : #accessing }
ESLTest >> defaultTimeLimit [
	^ 30 minutes
]

{ #category : #tests }
ESLTest >> testCSVFilesShouldExists [
	
	self 
		assert: ESL csvFilesExists
		description: 'Baseline should created the csv files'.
]

{ #category : #tests }
ESLTest >> testCreateDatabase [
	ESL createDatabase
]

{ #category : #tests }
ESLTest >> testDatabaseDo [
	| list |
	list := ESL databaseDo: [ 
		(Country storedInstances select: [ :each | true ])
		 ].
	self assert: list notEmpty.
	self assert: list size > 5
]

{ #category : #tests }
ESLTest >> testDatabaseShouldExists [
	
	self 
		assert: ESL databaseFileExists
		description: 'Baseline should created the database'.
]

{ #category : #tests }
ESLTest >> testHomeDirectory [
	self assert: ESL csvDirectory isString
]

{ #category : #tests }
ESLTest >> testZipPath [
	self assert: ESL zipPath isString
]
