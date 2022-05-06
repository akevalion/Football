"
class for common methods
"
Class {
	#name : #FutbolEntity,
	#superclass : #Object,
	#category : #Futbol
}

{ #category : #compiler }
FutbolEntity class >> compileGetMethod: aString [ 
	self compile: aString, String cr, String tab, '^ ', aString classified: 'accessing' 
]

{ #category : #compiler }
FutbolEntity class >> compileSetMethod: aString [ 
	self compile: aString, ' anObject', String cr, String tab, aString, '= anObject' classified: 'accessing' 
]

{ #category : #accessing }
FutbolEntity class >> csvFile [
	^ self subclassResponsibility
]

{ #category : #public }
FutbolEntity class >> importFromCSV [
	| content lines headers values instance |
	content := self csvFile asFileReference contents.
	lines := content lines.
	headers :=  lines first substrings: ','.
	instance := self new.
	lines allButFirstDo: [ :line |
		values := line substrings: ','.
		values with: headers do: [ :value :header |
			| selector |
			selector := header asSymbol.
			(self canUnderstand: selector)
				ifFalse: [ self compileGetMethod: selector ].
			selector := selector asMutator.
			(self canUnderstand: selector)
				ifFalse: [ self compileSetMethod: selector ].
			instance perform: selector with: value.
			].
		 ].
	instance store.
]
