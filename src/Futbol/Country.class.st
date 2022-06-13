"
used by countries
"
Class {
	#name : #Country,
	#superclass : #FutbolEntity,
	#instVars : [
		'id',
		'name'
	],
	#category : #'Futbol-Entities'
}

{ #category : #accessing }
Country class >> csvFile [
	^ 'Country_export_2022-04-14_145153.csv'
]

{ #category : #public }
Country class >> reStoreDefinition [
	^ super reStoreDefinition
		defineAsID: #id;
		define: #name as: (String maxSize: 100);
		yourself.
]

{ #category : #accessing }
Country >> id [
	^ id
]

{ #category : #accessing }
Country >> id: anObject [
	id:= anObject
]

{ #category : #accessing }
Country >> name [
	^ name
]

{ #category : #accessing }
Country >> name: anObject [
	name:= anObject
]

{ #category : #printing }
Country >> printOn: stream [
	stream << name
]
