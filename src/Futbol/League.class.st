"
league object
"
Class {
	#name : #League,
	#superclass : #FutbolEntity,
	#instVars : [
		'id',
		'country_id',
		'name'
	],
	#category : #Futbol
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
