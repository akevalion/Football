"
The european soccer league
"
Class {
	#name : #ESL,
	#superclass : #Object,
	#instVars : [
		'leagues'
	],
	#category : #'Football-Core'
}

{ #category : #database }
ESL class >> connectDB [
	ReStore
		connection: (SSWSQLite3Connection 
			on: (Smalltalk imageDirectory / self databaseName) fullName);
		connect;
		in: [ :base | base connection sqlDialect instVarNameTransformation: [ :value | value ] ];
		addClasses: FootballEntity subclasses.

		
 
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
	^ ('./', self databaseName) asFileReference exists
]

{ #category : #database }
ESL class >> databaseName [
	^ 'football.db'
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

{ #category : #accessing }
ESL class >> projectDirectory [
	^ (IceRepository repositories detect: [ :each | each name = 'Football' ]) repositoryDirectory
]

{ #category : #public }
ESL class >> unZipFile [
	"first we try to unzip soccer.zip"
	self unZipFileFromDatabase.
	
	self databaseFileExists ifTrue: [ ^ self ].
	self csvFilesExists ifTrue: [ ^  self ].
	ZipArchive new
		readFrom: self zipPathSoccerCSV;
		extractAllTo: self csvDirectory asFileReference.
	
	
]

{ #category : #public }
ESL class >> unZipFileFromDatabase [
	self databaseFileExists ifTrue: [ ^ self ].
	ZipArchive new
		readFrom: self zipPathSoccer;
		extractAllTo: self csvDirectory asFileReference.
]

{ #category : #accessing }
ESL class >> zipPathSoccer [
	^ self projectDirectory / 'data/soccer.zip'
]

{ #category : #accessing }
ESL class >> zipPathSoccerCSV [
	^ self projectDirectory / 'data/soccer-csv.zip'
]

{ #category : #accessing }
ESL >> computeLeagues [
	^ self class databaseDo: [ League storedInstances asOrderedCollection ]
]

{ #category : #accessing }
ESL >> leagues [
	^ leagues ifNil: [ leagues := self computeLeagues ]
]
