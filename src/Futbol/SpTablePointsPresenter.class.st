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
				ifFalse: [40]);
			evaluated: selector;
			yourself) ].
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
