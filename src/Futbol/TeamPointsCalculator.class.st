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
		'againstGoals',
		'season'
	],
	#category : #'Futbol-Utilities'
}

{ #category : #private }
TeamPointsCalculator class >> computePointsForMatch: match teams: teams [

	| pointsForHome homeTeam awayGoals awayTeam homeGoals pointsForAway |
	
	homeGoals := match home_team_goal asInteger.
	awayGoals := match away_team_goal asInteger.
	pointsForHome := self matchPointsTeamA: homeGoals teamB: awayGoals.
	pointsForAway := self matchPointsTeamA: awayGoals teamB: homeGoals.

	homeTeam := self teamFor: match home_team_api_id in: teams.
	homeTeam addPoints: pointsForHome.
	homeTeam addGoalsInFavor: homeGoals.
	homeTeam addAgainstGoals: awayGoals.
	homeTeam season: match season.

	awayTeam := self teamFor: match away_team_api_id in: teams.
	awayTeam addGoalsInFavor: awayGoals.
	homeTeam addAgainstGoals: homeGoals.
	awayTeam addPoints: pointsForAway.
	awayTeam season: match season.
]

{ #category : #'instance creation' }
TeamPointsCalculator class >> fromAllMatches: matches teamId: teamId [

	| teams seasons result |
	result := OrderedCollection new.
	seasons := matches groupedBy: #season.
	(seasons keys sorted: #yourself ascending) do: [ :key |
		teams := Dictionary new.
		(seasons at: key) do: [ :match |
			self computePointsForMatch: match teams: teams.
			 ].
		result add: (teams at: teamId)
		 ].
	^ result
]

{ #category : #'instance creation' }
TeamPointsCalculator class >> fromMatches: matches [

	| teams |
	teams := Dictionary new.
	matches do: [ :match | self computePointsForMatch: match teams: teams ].
	^ teams asSortedCollection: #totalPoints descending
]

{ #category : #private }
TeamPointsCalculator class >> matchPointsTeamA: team1Goals teamB: team2Goals [

	^ team1Goals = team2Goals
		ifTrue: [ 1 ]
		ifFalse: [ team1Goals > team2Goals 
			ifTrue: [ 3 ]
			ifFalse: [ 0 ] ] 
]

{ #category : #private }
TeamPointsCalculator class >> teamFor: anInteger in: aCollection [

	^ aCollection at: anInteger ifAbsentPut: [ 
		self new
			id: anInteger;
			yourself ].
]

{ #category : #accessing }
TeamPointsCalculator >> accumulatePoints [
	| prev |
	prev := 0.
	^ points collect: [ :each | 
		prev := each + prev.
		 ].
]

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
	
	"points
		ifEmpty: [ points addLast: anInteger ]
		ifNotEmpty: [ points addLast: (points last + anInteger) ]."
	points add: anInteger.
	
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

{ #category : #'accessing - computed' }
TeamPointsCalculator >> last5MatchesIcon [
	| canvas |
	canvas := RSCanvas new.
	canvas addAll: (self last5Mathes collect: [:result | self resultIconFor: result] ).
	RSHorizontalLineLayout new gapSize: 0; on: canvas nodes.
	canvas camera position: canvas encompassingRectangle floatCenter.
	canvas extent: 100@25.
	^ canvas asForm.
]

{ #category : #'accessing - computed' }
TeamPointsCalculator >> last5Mathes [
	^ points last: 5
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

{ #category : #'accessing - computed' }
TeamPointsCalculator >> resultIconFor: result [
	| name icon label text |
	result=0 ifTrue: [ 
		name := #testRed.
		text := 'l'
		
	] ifFalse: [
		result = 1 ifTrue: [ 
			name := #testNotRun.
			text := '-'
		] ifFalse: [ 
			name := #testGreen.
			text := 'w' ] ].
	icon := RSBitmap new form: (self iconNamed: name).
	label := RSLabel new text: text; color: Color white.
	^ {icon. label} asShape
]

{ #category : #accessing }
TeamPointsCalculator >> season [
	^ season
]

{ #category : #accessing }
TeamPointsCalculator >> season: aString [ 

	season := aString
]

{ #category : #printing }
TeamPointsCalculator >> teamName [
	^ teamName ifNil: [ teamName := self queryTeamName ].
]

{ #category : #accessing }
TeamPointsCalculator >> totalPoints [
	^ self accumulatePoints last
]

{ #category : #accessing }
TeamPointsCalculator >> wins [
	^ matchesWon
]
