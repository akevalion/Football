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
Season >> computeMatches [
	^ ESL databaseDo: [
		| list ids names |
		list := Match storedInstances 
			select: [ :match | 
				(match league_id = self league_id ) & 
				(match season = self season) ].
		ids := Set new.
		list do: [ :match | ids add: match home_team_api_id; add: match away_team_api_id ].
		ids := ids asArray.
		names := ids collect: [ :tid | 
			((Team storedInstances satisfying: [ :team | team team_api_id = tid ])
				collect: [ :team | team team_long_name ]) first ].
		ids := Dictionary newFromKeys: ids andValues: names.
		list do: [ :match | 
			match 
				awayName: (ids at: match away_team_api_id);
				homeName: (ids at: match home_team_api_id)
			 ].
		list asSortedCollection: [ :a :b | a dateAndTime < b dateAndTime ] ]
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
	^ matches ifNil: [ matches := self computeMatches ]
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
	^ TeamStatsCalculator fromMatches: self matches
]

{ #category : #'accessing - computed' }
Season >> teamFor: anInteger in: aCollection [ 
	^ aCollection at: anInteger ifAbsentPut: [ 
		TeamStatsCalculator new
			id: anInteger;
			yourself
		 ].
]
