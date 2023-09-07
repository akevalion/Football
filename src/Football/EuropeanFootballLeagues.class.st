"
The european soccer league
"
Class {
	#name : #EuropeanFootballLeagues,
	#superclass : #Object,
	#instVars : [
		'leagues'
	],
	#category : #'Football-Core'
}

{ #category : #database }
EuropeanFootballLeagues class >> connectDB [
	ReStore
		connection: (SSWSQLite3Connection 
			on: (Smalltalk imageDirectory / self databaseName) fullName);
		connect;
		in: [ :base | base connection sqlDialect instVarNameTransformation: [ :value | value ] ];
		addClasses: FootballEntity subclasses.

		
 
]

{ #category : #public }
EuropeanFootballLeagues class >> createDatabase [
	self unZipFile.
	self generateDB.
]

{ #category : #accessing }
EuropeanFootballLeagues class >> csvDirectory [
	^ '.'
]

{ #category : #testing }
EuropeanFootballLeagues class >> csvFilesExists [
	| root |
	root := '.' asFileReference.
	^ (root files anySatisfy: [ :file | '*.csv' match: file basename ])
]

{ #category : #public }
EuropeanFootballLeagues class >> databaseDo: aFullBlockClosure [ 
	self connectDB.
	^ aFullBlockClosure ensure: [ self disconnectDB ]
	
]

{ #category : #testing }
EuropeanFootballLeagues class >> databaseFileExists [
	^ ('./', self databaseName) asFileReference exists
]

{ #category : #database }
EuropeanFootballLeagues class >> databaseName [
	^ 'football.db'
]

{ #category : #database }
EuropeanFootballLeagues class >> disconnectDB [
	ReStore disconnect
]

{ #category : #public }
EuropeanFootballLeagues class >> generateDB [
	self databaseFileExists ifTrue: [ ^ self ].
	self databaseDo: [ self importFromCSV ]
]

{ #category : #public }
EuropeanFootballLeagues class >> importFromCSV [
	FootballEntity subclasses 
		do: [ :cls | cls importFromCSV ]
		displayingProgress: [ :cls | 
			('importing: ', cls name) traceCr.
			 ]
]

{ #category : #accessing }
EuropeanFootballLeagues class >> projectDirectory [
	^ (IceRepository repositories detect: [ :each | each name = 'Football' ]) repositoryDirectory
]

{ #category : #public }
EuropeanFootballLeagues class >> unZipFile [
	"first we try to unzip soccer.zip"
	self unZipFileFromDatabase.
	
	self databaseFileExists ifTrue: [ ^ self ].
	self csvFilesExists ifTrue: [ ^  self ].
	ZipArchive new
		readFrom: self zipPathSoccerCSV;
		extractAllTo: self csvDirectory asFileReference.
	
	
]

{ #category : #public }
EuropeanFootballLeagues class >> unZipFileFromDatabase [
	self databaseFileExists ifTrue: [ ^ self ].
	ZipArchive new
		readFrom: self zipPathSoccer;
		extractAllTo: self csvDirectory asFileReference.
]

{ #category : #accessing }
EuropeanFootballLeagues class >> zipPathSoccer [
	^ self projectDirectory / 'data/soccer.zip'
]

{ #category : #accessing }
EuropeanFootballLeagues class >> zipPathSoccerCSV [
	^ self projectDirectory / 'data/soccer-csv.zip'
]

{ #category : #accessing }
EuropeanFootballLeagues >> computeLeagues [
	^ self class databaseDo: [ League storedInstances asOrderedCollection ]
]

{ #category : #accessing }
EuropeanFootballLeagues >> leagues [
	^ leagues ifNil: [ leagues := self computeLeagues ]
]
