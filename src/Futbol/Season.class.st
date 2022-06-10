"
Simple class to handle all matches from a season of a league
"
Class {
	#name : #Season,
	#superclass : #Object,
	#instVars : [
		'season',
		'league_id',
		'matches'
	],
	#category : #Futbol
}

{ #category : #inspector }
Season >> addLegend: chart teams: teams [

	| lb index |
	lb := RSLegend new.
	lb container: chart container.
	lb defaultCircle size: 5.
	index := 0.
	chart plots with: teams do: [ :plot :team | | realTeam |
		realTeam := team asTeam.
		index := index + 1.
		(lb
			text: index asString , '. ' , team teamName
			withCircleColor: plot line color)
			model: realTeam.
		
		plot line
			model: realTeam;
			addInteraction: RSMorphicPopupInteraction new ].
	self layout: lb with: teams.
	lb location offset: 0 @ 30.
	self addLegendInteractions: lb plots: chart plots.
	lb build
]

{ #category : #inspector }
Season >> addLegendInteractions: lb plots: plots [
	| highlight |
	"highlight := RSHighlightable color: Smalltalk ui theme selectionColor."
	highlight := RSHighlightable new.
	highlight 
		when: RSHighlightEvent do: [ :evt | 
			| plot |
			highlight record: evt shape selector: #color value: Smalltalk ui theme selectionColor.
			plot := plots detect: [:each | each line model = evt shape model ].
			plots do: [ :each | each line color: (each line color alpha: 0.1) ].
			plot line
				color: (plot line color alpha: 1);
				width: 2;
				pushFront.
			 ];
		when: RSUnHighlightEvent do: [ :evt | 
			highlight restore: evt shape selector: #color.
			plots do: [ :plot |
				plot line 
					color: (plot line color alpha: 1);
					width: 1 ]. ].
	lb shapes addInteraction: highlight.
	
	
]

{ #category : #'as yet unclassified' }
Season >> createMatches [
	^ ESL databaseDo: [ 
		(Match storedInstances 
			select: [ :match | 
				(match season = self season) 
				& (match league_id = self league_id ) ])
		asSortedCollection: [ :a :b | (DateAndTime fromString: a date) < (DateAndTime fromString: b date) ]
			 ]
]

{ #category : #inspector }
Season >> createTeamEvolution [
	| canvas chart teams |
	canvas := RSCanvas new.
	
	teams := self teamEvolutionData.
	chart := self newEvolutionLineChart: teams.
	chart container: canvas.
	chart build.
	self addLegend: chart teams: teams.
	canvas @ RSCanvasController.
	^ canvas
]

{ #category : #inspector }
Season >> inspectorMatches [
	<inspectorPresentationOrder: 1 title: 'Matches'>
	
	^ SpTablePresenter new
		addColumn: (SpIndexTableColumn new 
			title: '#';
			beNotExpandable;
			width: 30
			yourself);
		addColumn: (SpStringTableColumn new  
			title: 'Matches';
			evaluated: #yourself;
			yourself);
		items: self matches

]

{ #category : #inspector }
Season >> inspectorMatchesContext: context [

	context withoutEvaluator
]

{ #category : #inspector }
Season >> inspectorTablePoints [
	<inspectorPresentationOrder: 3 title: 'Table Points'>
	
	| table |
	table := SpTablePresenter new
		items: self teamEvolutionData;
		addColumn: (SpIndexTableColumn new 
			title: '#';
			beNotExpandable;
			width: 30
			yourself);
		yourself.
	#(Team teamName
	MP matchesPlayed
	W wins
	D draws
	L losses
	GF goalsInFavor
	GA goalsAgainst
	GD goalsDifference
	PTS totalPoints) pairsDo: [ :title :selector | 
		table addColumn: (SpStringTableColumn new  
			title: title;
			evaluated: selector;
			yourself) ].
	
	^ table
]

{ #category : #inspector }
Season >> inspectorTablePointsContext: context [

	context withoutEvaluator
]

{ #category : #inspector }
Season >> inspectorTeamEvolutionLinePlot [
	<inspectorPresentationOrder: 2 title: 'Teams Evolution'>
	
	^ SpRoassal3InspectorPresenter new
		canvas: self createTeamEvolution;
		yourself
]

{ #category : #inspector }
Season >> inspectorTeamEvolutionLinePlotContext: context [

	context withoutEvaluator 
]

{ #category : #inspector }
Season >> layout: lb with: teams [

	lb legendDo: [ :shape | 
		| delta groups |
		delta := teams size sqrt asInteger.
		groups := OrderedCollection new.
		1 to: teams size by: delta do: [ :i | 
			groups add:
				(shape nodes copyFrom: i to: (i + delta - 1 min: teams size)) ].
		groups do: [ :list | 
			RSVerticalLineLayout new
				alignLeft;
				on: list ].
		RSHorizontalLineLayout new on: groups.
		shape adjustToChildren.
		shape
			withBorder;
			padding: 10;
			scaleBy: 0.7 ]
]

{ #category : #accessing }
Season >> league_id [
	^ league_id
]

{ #category : #accessing }
Season >> league_id: id [
	league_id := id
]

{ #category : #'as yet unclassified' }
Season >> matches [
	^ matches ifNil: [ matches := self createMatches ]
]

{ #category : #chart }
Season >> newEvolutionLineChart: teams [
	| chart x |
	chart := RSChart new.
	
	teams do: [ :team | 
		x := 1 to: team points size.
		chart addPlot: (RSLinePlot new x: x y: team points).
	].
	chart 
		addDecoration: (RSHorizontalTick new 
			numberOfTicks: 10;
			integer);
		addDecoration: (RSVerticalTick new numberOfTicks: 10; integer);
		extent: 300@200;
		title: 'Points Evolutions during Season: ', self season;
		xlabel: 'Matches Played';
		ylabel: 'Points'.
	^ chart
	
]

{ #category : #public }
Season >> pointsFor: team1Goals and: team2Goals [ 
	^ team1Goals = team2Goals
		ifTrue: [ 1 ]
		ifFalse: [ team1Goals > team2Goals 
			ifTrue: [ 3 ]
			ifFalse: [ 0 ] ] 
]

{ #category : #printing }
Season >> printOn: stream [
	stream << self season
]

{ #category : #accessing }
Season >> season [
	^ season
]

{ #category : #accessing }
Season >> season: aString [ 
	season := aString
]

{ #category : #accessing }
Season >> seasonTeams [
	^ self matches collect: [ :match | match home_team_api_id ] as: Set.
	
]

{ #category : #'as yet unclassified' }
Season >> teamEvolutionData [
	
	| teams |
	teams := Dictionary new.
	
	self matches do: [ :match |
		| homeGoals awayGoals pointsForHome pointsForAway homeTeam awayTeam |
		
		homeGoals := match home_team_goal asInteger.
		awayGoals := match away_team_goal asInteger.
		pointsForHome := self pointsFor: homeGoals and: awayGoals.
		pointsForAway := self pointsFor: awayGoals and: homeGoals.
		
		homeTeam := self teamFor: match home_team_api_id in: teams.
		homeTeam addPoints: pointsForHome.
		homeTeam addGoalsInFavor: homeGoals.
		homeTeam addAgainstGoals: awayGoals.
		
		awayTeam := self teamFor: match away_team_api_id in: teams.
		awayTeam addGoalsInFavor: awayGoals.
		homeTeam addAgainstGoals: homeGoals.
		awayTeam addPoints: pointsForAway.
		].
	^ teams asSortedCollection: #totalPoints descending
	
]

{ #category : #public }
Season >> teamFor: anInteger in: aCollection [ 
	^ aCollection at: anInteger ifAbsentPut: [ 
		TeamPointsCalculator new
			id: anInteger;
			yourself
		 ].
]
