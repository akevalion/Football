"
Simple class to handle all matches from a season of a league
"
Class {
	#name : #Season,
	#superclass : #Object,
	#instVars : [
		'season',
		'league_id',
		'matches'
	],
	#category : #'Futbol-Utilities'
}

{ #category : #'accessing - computed' }
Season >> createMatches [
	^ ESL databaseDo: [ 
		(Match storedInstances 
			select: [ :match | 
				(match season = self season) 
				& (match league_id = self league_id ) ])
		asSortedCollection: [ :a :b | 
			(DateAndTime fromString: a date) < (DateAndTime fromString: b date) ]
			 ]
]

{ #category : #inspector }
Season >> inspectorMatches [
	<inspectorPresentationOrder: 1 title: 'Matches'>
	
	^ SpTablePresenter new
		addColumn: (SpIndexTableColumn new 
			title: '#';
			beNotExpandable;
			width: 30
			yourself);
		addColumn: (SpStringTableColumn new  
			title: 'Matches';
			evaluated: #yourself;
			yourself);
		items: self matches

]

{ #category : #inspector }
Season >> inspectorMatchesContext: context [
	context withoutEvaluator
]

{ #category : #inspector }
Season >> inspectorTablePoints [

	<inspectorPresentationOrder: 3 title: 'Table Points'>
	^ SpTablePointsPresenter on: self
]

{ #category : #inspector }
Season >> inspectorTablePointsContext: context [
	context withoutEvaluator
]

{ #category : #inspector }
Season >> inspectorTeamEvolutionLinePlot [
	<inspectorPresentationOrder: 2 title: 'Teams Evolution'>
	^ SpEvolutionLinePlotPresenter new
		season: self;
		yourself
]

{ #category : #inspector }
Season >> inspectorTeamEvolutionLinePlotContext: context [
	context withoutEvaluator 
]

{ #category : #accessing }
Season >> league_id [
	^ league_id
]

{ #category : #accessing }
Season >> league_id: id [
	league_id := id
]

{ #category : #accessing }
Season >> matches [
	^ matches ifNil: [ matches := self createMatches ]
]

{ #category : #'accessing - computed' }
Season >> pointsFor: team1Goals and: team2Goals [ 
	^ team1Goals = team2Goals
		ifTrue: [ 1 ]
		ifFalse: [ team1Goals > team2Goals 
			ifTrue: [ 3 ]
			ifFalse: [ 0 ] ] 
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

{ #category : #accessing }
Season >> seasonTeams [
	^ self matches collect: [ :match | match home_team_api_id ] as: Set.
	
]

{ #category : #'accessing - computed' }
Season >> teamEvolutionData [
	^ TeamPointsCalculator fromMatches: self matches
]

{ #category : #'accessing - computed' }
Season >> teamFor: anInteger in: aCollection [ 
	^ aCollection at: anInteger ifAbsentPut: [ 
		TeamPointsCalculator new
			id: anInteger;
			yourself
		 ].
]
