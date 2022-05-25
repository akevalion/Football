"
Simple class to handle all matches from a season of a league
"
Class {
	#name : #Season,
	#superclass : #Object,
	#instVars : [
		'season',
		'league_id'
	],
	#category : #Futbol
}

{ #category : #'as yet unclassified' }
Season >> inspectorMatches [
	<inspectorPresentationOrder: 1 title: 'Matches'>
	
	^ SpListPresenter new 
		items: self matches;
		yourself
]

{ #category : #accessing }
Season >> league_id [
	^ league_id
]

{ #category : #accessing }
Season >> league_id: id [
	league_id := id
]

{ #category : #'as yet unclassified' }
Season >> matches [
	^ ESL databaseDo: [ 
		Match storedInstances select: [ :match | (match season = self season) & (match league_id = self league_id ) ] ]
]

{ #category : #printing }
Season >> printOn: stream [
	stream << self season
]

{ #category : #accessing }
Season >> season [
	^ season
]

{ #category : #accessing }
Season >> season: aString [ 
	season := aString
]
