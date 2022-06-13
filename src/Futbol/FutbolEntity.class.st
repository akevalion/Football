"
class for common methods
"
Class {
	#name : #FutbolEntity,
	#superclass : #Object,
	#category : #'Futbol-Entities'
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
	| content headers instance index |
	content := (NeoCSVReader on: self csvFile asFileReference readStream) upToEnd.
	headers :=  content first.
	index := 0.
	content allButFirst do: [ :line |
		instance := self new.
		instance readFrom: line headers: headers.
		instance store.
		index := index + 1.
	] displayingProgress: [ :line | 'Processing: ', index asString, '/', (content size - 1) asString ]
		every: 2000
]

{ #category : #public }
FutbolEntity class >> utilityScript [
	"
string := ' '.

string copyReplaceAll: ',' with: ' '.
String streamContents: [ :stream | 
	string splitOn: ',' do: [ :each |
		type := (each includesSubstring: '_id')
			ifTrue: [ 'Integer' ]
			ifFalse: [ '(String maxSize: 50)'].
			
		stream tab; tab; << 'define: #'; << each; space; << 'as: '; << type; << ';'; cr
		]. ].
"
]

{ #category : #initialize }
FutbolEntity >> readFrom: line headers: headers [
	| class |
	class := self class.
	[ 
	line with: headers do: [ :value :header |
		| selector |
		selector := header asSymbol.
		(class canUnderstand: selector)
			ifFalse: [ class compileGetMethod: selector ].
		selector := selector asMutator.
		(class canUnderstand: selector)
			ifFalse: [ class compileSetMethod: selector ].
		self perform: selector with: value.
	] ] onErrorDo: [ :ex | #halt value: self ]
]
