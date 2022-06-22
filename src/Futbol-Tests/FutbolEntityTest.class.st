"
A FutbolEntityTest is a test class for testing the behavior of FutbolEntity
"
Class {
	#name : #FutbolEntityTest,
	#superclass : #TestCase,
	#category : #'Futbol-Tests-Entities'
}

{ #category : #tests }
FutbolEntityTest >> testEntities [
	FutbolEntity allSubclassesDo: [ :cls |
		self assert: cls csvFile isString
		 ]
	
]
