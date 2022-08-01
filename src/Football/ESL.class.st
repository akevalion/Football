"
The european soccer league
"
Class {
	#name : #ESL,
	#superclass : #Object,
	#category : #'Football-Core'
}

{ #category : #database }
ESL class >> connectDB [
	ReStore
		connection: (SSWSQLite3Connection 
			on: (Smalltalk imageDirectory / 'futbol.db') fullName);
		connect;
		addClasses: FootballEntity subclasses;
		synchronizeAllClasses.
]

{ #category : #public }
ESL class >> createDatabase [
	self unZipFile.
	self generateDB.
]

{ #category : #accessing }
ESL class >> csvDirectory [
	^ '.'
]

{ #category : #testing }
ESL class >> csvFilesExists [
	| root |
	root := '.' asFileReference.
	^ (root files anySatisfy: [ :file | '*.csv' match: file basename ])
]

{ #category : #public }
ESL class >> databaseDo: aFullBlockClosure [ 
	self connectDB.
	^ aFullBlockClosure ensure: [ self disconnectDB ]
	
]

{ #category : #testing }
ESL class >> databaseFileExists [
	^ '.' asFileReference files anySatisfy: [ :file | '*.db' match: file basename ]
]

{ #category : #database }
ESL class >> disconnectDB [
	ReStore disconnect
]

{ #category : #public }
ESL class >> generateDB [
	self databaseFileExists ifTrue: [ ^ self ].
	self databaseDo: [ self importFromCSV ]
]

{ #category : #public }
ESL class >> importFromCSV [
	FootballEntity subclasses 
		do: [ :cls | cls importFromCSV ]
		displayingProgress: [ :cls | 
			('importing: ', cls name) traceCr.
			 ]
]

{ #category : #public }
ESL class >> unZipFile [
	self csvFilesExists ifTrue: [ ^  self ].
	ZipArchive new
		readFrom: self zipPath;
		extractAllTo: self csvDirectory asFileReference.
	
	
]

{ #category : #accessing }
ESL class >> zipPath [
	^ './pharo-local/iceberg/akevalion/Football/data/soccer-csv.zip'
]

{ #category : #accessing }
ESL >> leagues [
	
	^ self class databaseDo: [ League storedInstances asOrderedCollection ]
]
