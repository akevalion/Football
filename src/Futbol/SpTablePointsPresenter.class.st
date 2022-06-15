"
Used by season
"
Class {
	#name : #SpTablePointsPresenter,
	#superclass : #SpTablePresenter,
	#instVars : [
		'season'
	],
	#category : #'Futbol-Spec'
}

{ #category : #initialization }
SpTablePointsPresenter >> buildTable [
	self 
		items: season teamEvolutionData;
		addColumn: (SpIndexTableColumn new 
			title: '#';
			beNotExpandable;
			width: 30
			yourself).
	self columnPairs pairsDo: [ :title :selector | 
		self addColumn: (SpStringTableColumn new  
			title: title;
			width: (title = #Team 
				ifTrue: [nil]
				ifFalse: [35]);
			evaluated: selector;
			yourself) ].
	self addColumn: (SpImageTableColumn new
		title: 'Last 5 matches';
		width: 120;
		evaluated: #last5MatchesIcon;
		yourself).
]

{ #category : #initialization }
SpTablePointsPresenter >> columnPairs [
	^ #(Team teamName
	MP matchesPlayed
	W wins
	D draws
	L losses
	GF goalsInFavor
	GA goalsAgainst
	GD goalsDifference
	PTS totalPoints)
]

{ #category : #initialization }
SpTablePointsPresenter >> season: aSeason [
	season := aSeason.
	self buildTable.
]
