"
league object
"
Class {
	#name : #League,
	#superclass : #FootballEntity,
	#instVars : [
		'id',
		'country_id',
		'name',
		'seasons',
		'teams',
		'countryName'
	],
	#category : #'Football-Entities'
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
League >> computeCountryName [
	^ EuropeanFootballLeagues databaseDo: [ (Country storedInstances detect: [ :country | country id = country_id ]) name ]
]

{ #category : #'accessing - computed' }
League >> computeSeasons [
	^ EuropeanFootballLeagues databaseDo: [
		(Match storedInstances project: [ :match | match season ]) asSortedCollection
			collect: [ :str | 
				Season new
					season: str;
					league_id: id;
					yourself ] ]
]

{ #category : #'accessing - computed' }
League >> computeTeams [
	^ EuropeanFootballLeagues databaseDo: [
		| teamIDs |
		teamIDs := (Match storedInstances 
			satisfying: [ :match | match league_id = self id ])
			project: [ :match | match home_team_api_id ].
		Team storedInstances select: [:team | teamIDs includes: team team_api_id ] ]
]

{ #category : #'accessing - computed' }
League >> countryName [
	^ countryName ifNil: [ countryName := self computeCountryName ]
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

{ #category : #'accessing - computed' }
League >> seasons [
	^ seasons ifNil: [ seasons := self computeSeasons ]
]

{ #category : #'accessing - computed' }
League >> teams [
	^ teams ifNil: [ teams := self computeTeams ]
]
