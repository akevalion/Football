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
	#category : #Futbol
}

{ #category : #accessing }
Country class >> csvFile [
	^ 'Country_export_2022-04-14_145153.csv'
]

{ #category : #public }
Country class >> reStoreDefinition [
	^ super reStoreDefinition
		define: #id as: Integer;
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
