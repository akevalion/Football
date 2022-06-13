"
Utility class used to calculate points
"
Class {
	#name : #TeamPointsCalculator,
	#superclass : #Object,
	#instVars : [
		'id',
		'points',
		'teamName',
		'matchesWon',
		'matchesLost',
		'matchesDrawn',
		'goalsInFavor',
		'againstGoals'
	],
	#category : #'Futbol-Utilities'
}

{ #category : #accessing }
TeamPointsCalculator >> addAgainstGoals: goals [

	againstGoals := againstGoals + goals
]

{ #category : #accessing }
TeamPointsCalculator >> addGoalsInFavor: goals [

	goalsInFavor := goalsInFavor + goals
]

{ #category : #adding }
TeamPointsCalculator >> addPoints: anInteger [

	points
		ifEmpty: [ points addLast: anInteger ]
		ifNotEmpty: [ points addLast: (points last + anInteger) ].
	"points addLast: (points last + anInteger)"
	
	anInteger = 1 ifTrue: [ matchesDrawn := matchesDrawn + 1 ].
	anInteger = 0 ifTrue: [ matchesLost := matchesDrawn + 1 ].
	anInteger = 3 ifTrue: [ matchesWon := matchesWon + 1 ]
]

{ #category : #converting }
TeamPointsCalculator >> asTeam [
	^ ESL databaseDo: [ Team storedInstances detect: [ :team | team team_api_id = id ] ].
]

{ #category : #accessing }
TeamPointsCalculator >> draws [
	^ matchesDrawn
]

{ #category : #accessing }
TeamPointsCalculator >> goalsAgainst [
	^ againstGoals
]

{ #category : #initialization }
TeamPointsCalculator >> goalsDifference [

	^ goalsInFavor - againstGoals
]

{ #category : #accessing }
TeamPointsCalculator >> goalsInFavor [
	^ goalsInFavor
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
	points := OrderedCollection empty.
	matchesWon := 0.
	matchesLost := 0.
	matchesDrawn := 0.
	againstGoals := 0.
	goalsInFavor := 0
]

{ #category : #accessing }
TeamPointsCalculator >> losses [
	^ matchesLost
]

{ #category : #accessing }
TeamPointsCalculator >> matchesPlayed [
	^ points size
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

{ #category : #accessing }
TeamPointsCalculator >> totalPoints [
	^ points last
]

{ #category : #accessing }
TeamPointsCalculator >> wins [
	^ matchesWon
]
