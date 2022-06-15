"
Used by season
"
Class {
	#name : #TablePointsOfSeasonPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'season',
		'table'
	],
	#category : #'Futbol-Spec'
}

{ #category : #initialization }
TablePointsOfSeasonPresenter >> columnPairs [
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

{ #category : #layout }
TablePointsOfSeasonPresenter >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		add: table;
		yourself
]

{ #category : #initialization }
TablePointsOfSeasonPresenter >> initializePresenters [

	table := self newTable.

	table alternateRowsColor.
	table 
		items: season teamEvolutionData;
		addColumn: (SpIndexTableColumn new 
			title: '#';
			beNotExpandable;
			width: 30
			yourself).
	self columnPairs pairsDo: [ :title :selector | 
		table addColumn: (SpStringTableColumn new  
			title: title;
			width: (title = #Team 
				ifTrue: [nil]
				ifFalse: [35]);
			evaluated: selector;
			yourself) ].
	table addColumn: (SpImageTableColumn new
		title: 'Last 5 matches';
		width: 120;
		evaluated: #last5MatchesIcon;
		yourself).
]

{ #category : #'accessing - model' }
TablePointsOfSeasonPresenter >> setModelBeforeInitialization: aSeason [

	season := aSeason
]
