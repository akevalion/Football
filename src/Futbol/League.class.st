"
league object
"
Class {
	#name : #League,
	#superclass : #FutbolEntity,
	#instVars : [
		'id',
		'country_id',
		'name',
		'seasons',
		'teams'
	],
	#category : #'Futbol-Entities'
}

{ #category : #accessing }
League class >> csvFile [
	^ 'League_export_2022-04-14_145204.csv'
]

{ #category : #public }
League class >> reStoreDefinition [
	^ super reStoreDefinition
		defineAsID: #id;
		define: #country_id as: Integer;
		define: #name as: (String maxSize: 100);
		yourself.
]

{ #category : #'accessing - computed' }
League >> computeSeasons [
	^ ESL databaseDo: [
		(Match storedInstances project: [ :match | match season ]) asSortedCollection
			collect: [ :str | 
				Season new
					season: str;
					league_id: id;
					yourself ] ]
]

{ #category : #'accessing - computed' }
League >> computeTeams [
	^ ESL databaseDo: [
		| teamIDs |
		teamIDs := (Match storedInstances 
			satisfying: [ :match | match league_id = self id ])
			project: [ :match | match home_team_api_id ].
		Team storedInstances select: [:team | teamIDs includes: team team_api_id ] ]
]

{ #category : #accessing }
League >> country_id [
	^ country_id
]

{ #category : #accessing }
League >> country_id: anObject [
	country_id:= anObject
]

{ #category : #accessing }
League >> id [
	^ id
]

{ #category : #accessing }
League >> id: anObject [
	id:= anObject
]

{ #category : #inspector }
League >> inspectorSeasonList [
	
	<inspectorPresentationOrder: 1 title: 'Seasons'>
	^ SpListPresenter new 
		items: self seasons;
		yourself
]

{ #category : #inspector }
League >> inspectorTeamList [
	
	<inspectorPresentationOrder: 2 title: 'Teams'>
	^ SpTablePresenter new
		addColumn: (SpIndexTableColumn new 
			title: '#';
			beNotExpandable;
			width: 30
			yourself);
		addColumn: (SpStringTableColumn new  
			title: 'Teams';
			evaluated: #asString;
			yourself);
		items: self teams;
		sortingBlock: #team_long_name ascending;
		yourself
]

{ #category : #accessing }
League >> name [
	^ name
]

{ #category : #accessing }
League >> name: anObject [
	name:= anObject
]

{ #category : #printing }
League >> printOn: stream [
	stream << name
]

{ #category : #accessing }
League >> seasons [
	^ seasons ifNil: [ seasons := self computeSeasons ]
]

{ #category : #accessing }
League >> teams [
	^ teams ifNil: [ teams := self computeTeams ]
]
