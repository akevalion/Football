"
soccer team
"
Class {
	#name : #Team,
	#superclass : #FutbolEntity,
	#instVars : [
		'id',
		'team_api_id',
		'team_fifa_api_id',
		'team_long_name',
		'team_short_name'
	],
	#category : #Futbol
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

{ #category : #accessing }
Team >> id [
	^ id
]

{ #category : #accessing }
Team >> id: anObject [
	id:= anObject
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
