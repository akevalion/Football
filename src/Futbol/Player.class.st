"
from player table
"
Class {
	#name : #Player,
	#superclass : #FutbolEntity,
	#instVars : [
		'id',
		'player_api_id',
		'player_name',
		'player_fifa_api_id',
		'birthday',
		'height',
		'weight'
	],
	#category : #Futbol
}

{ #category : #accessing }
Player class >> csvFile [
	^ 'Player_export_2022-04-14_145740.csv'
]

{ #category : #'instance creation' }
Player class >> nilPlayer [
	^ self new
		player_name: 'NO NAME';
		yourself
]

{ #category : #public }
Player class >> reStoreDefinition [
	^ super reStoreDefinition
		defineAsID: #id;
		define: #player_api_id as: Integer;
		define: #player_name as: (String maxSize: 100);
		define: #player_fifa_api_id as: Integer;
		define: #birthday as: (String maxSize: 100);
		define: #height as: (String maxSize: 100);
		define: #weight as: (String maxSize: 100);
		yourself.
]

{ #category : #accessing }
Player >> birthday [
	^ birthday
]

{ #category : #accessing }
Player >> birthday: anObject [
	birthday:= anObject
]

{ #category : #accessing }
Player >> height [
	^ height
]

{ #category : #accessing }
Player >> height: anObject [
	height:= anObject
]

{ #category : #accessing }
Player >> id [
	^ id
]

{ #category : #accessing }
Player >> id: anObject [
	id:= anObject
]

{ #category : #accessing }
Player >> player_api_id [
	^ player_api_id
]

{ #category : #accessing }
Player >> player_api_id: anObject [
	player_api_id:= anObject
]

{ #category : #accessing }
Player >> player_fifa_api_id [
	^ player_fifa_api_id
]

{ #category : #accessing }
Player >> player_fifa_api_id: anObject [
	player_fifa_api_id:= anObject
]

{ #category : #accessing }
Player >> player_name [
	^ player_name
]

{ #category : #accessing }
Player >> player_name: anObject [
	player_name:= anObject
]

{ #category : #printing }
Player >> printOn: stream [
	stream << player_name
]

{ #category : #accessing }
Player >> weight [
	^ weight
]

{ #category : #accessing }
Player >> weight: anObject [
	weight:= anObject
]
