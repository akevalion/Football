"
A FutbolEntityTest is a test class for testing the behavior of FutbolEntity
"
Class {
	#name : #FutbolEntityTest,
	#superclass : #ParametrizedTestCase,
	#instVars : [
		'entityClass'
	],
	#category : #'Futbol-Tests-Entities'
}

{ #category : #'building suites' }
FutbolEntityTest class >> testParameters [
	| matrix |
	matrix := ParametrizedTestMatrix new.
	FutbolEntity withAllSubclasses 
		reject: [ :cls | cls hasAbstractMethods ]
		thenDo: [ :cls | matrix addCase: { (#entityClass -> cls ) } ].
	^ matrix
		
]

{ #category : #accessing }
FutbolEntityTest >> entityClass [
	^ entityClass
]

{ #category : #accessing }
FutbolEntityTest >> entityClass: aClass [ 
	entityClass := aClass
]

{ #category : #tests }
FutbolEntityTest >> testBasicAccessors [
	| entity |
	entity := self entityClass new.
	self entityClass methods
		select: [ :met | met category = 'accessing' ]
		thenDo: [ :met |
			(met selector includes: $:) 
				ifTrue: [ entity perform: met selector with: nil ]
				ifFalse: [ met selector value: entity ] ].
]

{ #category : #tests }
FutbolEntityTest >> testEntities [
	self entityClass csvFile isString

	
]
