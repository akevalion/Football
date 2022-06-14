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

{ #category : #accessing }
League >> country_id [
	^ country_id
]

{ #category : #accessing }
League >> country_id: anObject [
	country_id:= anObject
]

{ #category : #'as yet unclassified' }
League >> createSeasons [
	^ ESL databaseDo: [
		(Match storedInstances collect: [ :match | match season] ) asSet asSortedCollection
			collect: [ :str | 
				Season new
					season: str;
					league_id: id;
					yourself ] ]
]

{ #category : #'as yet unclassified' }
League >> createTeams [

	^ ESL databaseDo: [
		| teamIDs |
		teamIDs := (Match storedInstances 
			select: [ :match | match league_id = self id ]
			thenCollect: [ :match | match home_team_api_id ]) asSet.
		Team storedInstances select: [:team | teamIDs includes: team team_api_id ] ]
]

{ #category : #accessing }
League >> id [
	^ id
]

{ #category : #accessing }
League >> id: anObject [
	id:= anObject
]

{ #category : #'as yet unclassified' }
League >> inspectorSeasonList [
	
	<inspectorPresentationOrder: 1 title: 'Seasons'>
	^ SpListPresenter new 
		items: self seasons;
		yourself
]

{ #category : #'as yet unclassified' }
League >> inspectorTeamsList [
	
	<inspectorPresentationOrder: 2 title: 'Teams'>
	^ SpTablePresenter new
		addColumn: (SpIndexTableColumn new 
			title: '#';
			beNotExpandable;
			width: 30
			yourself);
		addColumn: (SpStringTableColumn new  
			title: 'Teams';
			evaluated: #yourself;
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

{ #category : #'as yet unclassified' }
League >> seasons [
	^ seasons ifNil: [ seasons := self createSeasons ]
]

{ #category : #'as yet unclassified' }
League >> teams [
	^ teams ifNil: [ teams := self createTeams ]
]
