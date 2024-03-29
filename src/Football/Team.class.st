"
soccer team
"
Class {
	#name : #Team,
	#superclass : #FootballEntity,
	#instVars : [
		'id',
		'team_api_id',
		'team_fifa_api_id',
		'team_long_name',
		'team_short_name',
		'matches',
		'stats'
	],
	#category : #'Football-Entities'
}

{ #category : #accessing }
Team class >> csvFile [
	^ 'Team_export_2022-04-14_145800.csv'
]

{ #category : #public }
Team class >> reStoreDefinition [
	^ super reStoreDefinition
		defineAsID: #id;
		define: #team_api_id as: Integer;
		define: #team_fifa_api_id as: Integer;
		define: #team_long_name as: (String maxSize: 150);
		define: #team_short_name as: (String maxSize: 50);
		yourself.
]

{ #category : #private }
Team >> computeMatches [
	^ EuropeanFootballLeagues databaseDo: [ Match storedInstances 
		select: [ :match | 
			(match home_team_api_id = team_api_id) 
				| (match away_team_api_id = team_api_id) ] ]
]

{ #category : #'accessing - computed' }
Team >> computeStats [
	^ (EuropeanFootballLeagues databaseDo: [ TeamAttributes storedInstances
		select: [ :each | each team_api_id = team_api_id ] ]) asSortedCollection: #dateAndTime ascending.
]

{ #category : #accessing }
Team >> id [
	^ id
]

{ #category : #accessing }
Team >> id: anObject [
	id:= anObject
]

{ #category : #'accessing - decorators' }
Team >> matches [
	^ matches ifNil: [ matches := self computeMatches ]
]

{ #category : #printing }
Team >> printOn: stream [
	stream << team_long_name
]

{ #category : #'accessing - computed' }
Team >> stats [
	^ stats ifNil: [ stats := self computeStats ]
]

{ #category : #'accessing - computed' }
Team >> teamEvolutionData [

	^ TeamStatsCalculator fromMatches: self matches ofTeam: self team_api_id
]

{ #category : #accessing }
Team >> team_api_id [
	^ team_api_id
]

{ #category : #accessing }
Team >> team_api_id: anObject [
	team_api_id:= anObject
]

{ #category : #accessing }
Team >> team_fifa_api_id [
	^ team_fifa_api_id
]

{ #category : #accessing }
Team >> team_fifa_api_id: anObject [
	team_fifa_api_id:= anObject
]

{ #category : #accessing }
Team >> team_long_name [
	^ team_long_name
]

{ #category : #accessing }
Team >> team_long_name: anObject [
	team_long_name:= anObject
]

{ #category : #accessing }
Team >> team_short_name [
	^ team_short_name
]

{ #category : #accessing }
Team >> team_short_name: anObject [
	team_short_name:= anObject
]
