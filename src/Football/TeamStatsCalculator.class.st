"
I am an utility class to calculate the team stats:

	- Won Matches
	- Lost Matches
	- Points
	- Goals in favor
	- Goals agains
	- Goals difference
	- and other stats

"
Class {
	#name : #TeamStatsCalculator,
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
		'season',
		'league_id'
	],
	#category : #'Football-Utilities'
}

{ #category : #private }
TeamStatsCalculator class >> computePointsForMatch: match teams: teams [

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
TeamStatsCalculator class >> fromMatches: matches [

	| teams |
	teams := Dictionary new.
	matches do: [ :match | self computePointsForMatch: match teams: teams ].
	
	^ teams asSortedCollection: #totalPoints descending
]

{ #category : #'instance creation' }
TeamStatsCalculator class >> fromMatches: matches ofTeam: teamId [

	| teams seasons result  |
	
	seasons := matches groupedBy: #season.
	result := (seasons keys sorted: #yourself ascending) collect: [ :key | | teamCalculator |
		teams := Dictionary new.
		(seasons at: key) do: [ :match | self computePointsForMatch: match teams: teams ].
		teamCalculator := teams at: teamId.
		teamCalculator league_id: (seasons at: key) anyOne league_id.
		teamCalculator ] as: OrderedCollection.
	^ result
]

{ #category : #private }
TeamStatsCalculator class >> matchPointsTeamA: team1Goals teamB: team2Goals [

	^ team1Goals = team2Goals
		ifTrue: [ 1 ]
		ifFalse: [ team1Goals > team2Goals 
			ifTrue: [ 3 ]
			ifFalse: [ 0 ] ] 
]

{ #category : #private }
TeamStatsCalculator class >> teamFor: anInteger in: aDictionary [

	^ aDictionary at: anInteger ifAbsentPut: [ 
		self new
			id: anInteger;
			yourself ].
]

{ #category : #accessing }
TeamStatsCalculator >> accumulatePoints [
	| prev |
	prev := 0.
	^ points collect: [ :each | 
		prev := each + prev.
		 ].
]

{ #category : #accessing }
TeamStatsCalculator >> addAgainstGoals: goals [

	againstGoals := againstGoals + goals
]

{ #category : #accessing }
TeamStatsCalculator >> addGoalsInFavor: goals [

	goalsInFavor := goalsInFavor + goals
]

{ #category : #adding }
TeamStatsCalculator >> addPoints: anInteger [
	
	"points
		ifEmpty: [ points addLast: anInteger ]
		ifNotEmpty: [ points addLast: (points last + anInteger) ]."
	points add: anInteger.
	
	anInteger = 1 ifTrue: [ matchesDrawn := matchesDrawn + 1 ].
	anInteger = 0 ifTrue: [ matchesLost := matchesDrawn + 1 ].
	anInteger = 3 ifTrue: [ matchesWon := matchesWon + 1 ]
]

{ #category : #converting }
TeamStatsCalculator >> asSeason [
	^ Season new
		season: season;
		league_id: league_id;
		yourself
]

{ #category : #converting }
TeamStatsCalculator >> asTeam [

	^ ESL databaseDo: [ Team storedInstances detect: [ :team | team team_api_id = id ] ]
]

{ #category : #accessing }
TeamStatsCalculator >> draws [
	^ matchesDrawn
]

{ #category : #accessing }
TeamStatsCalculator >> goalsAgainst [
	^ againstGoals
]

{ #category : #initialization }
TeamStatsCalculator >> goalsDifference [

	^ goalsInFavor - againstGoals
]

{ #category : #accessing }
TeamStatsCalculator >> goalsInFavor [
	^ goalsInFavor
]

{ #category : #accessing }
TeamStatsCalculator >> id [

	^ id
]

{ #category : #accessing }
TeamStatsCalculator >> id: anInteger [

	id := anInteger
]

{ #category : #initialization }
TeamStatsCalculator >> initialize [

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
TeamStatsCalculator >> last5Mathes [
	^ points last: 5
]

{ #category : #accessing }
TeamStatsCalculator >> league_id: aNumber [
	league_id := aNumber
]

{ #category : #accessing }
TeamStatsCalculator >> losses [

	^ matchesLost
]

{ #category : #accessing }
TeamStatsCalculator >> matchesPlayed [

	^ points size
]

{ #category : #accessing }
TeamStatsCalculator >> points [
	^ points
]

{ #category : #accessing }
TeamStatsCalculator >> points: anObject [

	points := anObject
]

{ #category : #printing }
TeamStatsCalculator >> printOn: stream [

	stream << self teamName
]

{ #category : #printing }
TeamStatsCalculator >> queryTeamName [

	^ ESL databaseDo: [ 
		  (Team storedInstances detect: [ :team | team team_api_id = id ]) team_long_name ]
]

{ #category : #'accessing - computed' }
TeamStatsCalculator >> resultIconFor: result [
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
TeamStatsCalculator >> season [
	^ season
]

{ #category : #accessing }
TeamStatsCalculator >> season: aString [ 

	season := aString
]

{ #category : #printing }
TeamStatsCalculator >> teamName [

	^ teamName ifNil: [ teamName := self queryTeamName ]
]

{ #category : #accessing }
TeamStatsCalculator >> totalPoints [

	^ self accumulatePoints last
]

{ #category : #accessing }
TeamStatsCalculator >> wins [

	^ matchesWon
]
