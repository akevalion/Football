Class {
	#name : #TeamPointsCalculator,
	#superclass : #Object,
	#instVars : [
		'id',
		'points',
		'teamName'
	],
	#category : #Futbol
}

{ #category : #adding }
TeamPointsCalculator >> addPoints: anInteger [

	points
		ifEmpty: [ points addLast: anInteger ]
		ifNotEmpty: [ points addLast: (points last + anInteger) ]
	"points addLast: (points last + anInteger)"
]

{ #category : #accessing }
TeamPointsCalculator >> id [

	^ id
]

{ #category : #accessing }
TeamPointsCalculator >> id: anInteger [ 
	id := anInteger
]

{ #category : #initialization }
TeamPointsCalculator >> initialize [
	super initialize.
	"points := OrderedCollection with: 0."
	points := OrderedCollection empty
]

{ #category : #accessing }
TeamPointsCalculator >> points [

	^ points
]

{ #category : #accessing }
TeamPointsCalculator >> points: anObject [

	points := anObject
]

{ #category : #printing }
TeamPointsCalculator >> printOn: stream [
	stream << self teamName.
]

{ #category : #printing }
TeamPointsCalculator >> queryTeamName [
	^ ESL databaseDo: [ 
		(Team storedInstances detect: [ :team | 
			team team_api_id = id ]) team_long_name ]
]

{ #category : #printing }
TeamPointsCalculator >> teamName [
	^ teamName ifNil: [ teamName := self queryTeamName ].
]
