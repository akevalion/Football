Class {
	#name : #SpTeamTablePerformancePresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'team',
		'table',
		'teamEvolutionData'
	],
	#category : #'Futbol-Spec'
}

{ #category : #accessing }
SpTeamTablePerformancePresenter >> columnPairs [
	^ #( MP matchesPlayed
	W wins
	D draws
	L losses
	GF goalsInFavor
	GA goalsAgainst
	GD goalsDifference
	PTS totalPoints)
]

{ #category : #accessing }
SpTeamTablePerformancePresenter >> createIndexColumn [

	^ SpStringTableColumn new 
		title: 'Season';
		"width: 70;"
		evaluated: [ :item | item season ];
		yourself
]

{ #category : #layout }
SpTeamTablePerformancePresenter >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		add: table;
		yourself
]

{ #category : #initialization }
SpTeamTablePerformancePresenter >> initializePresenters [

	self initializeTable
	
]

{ #category : #initialization }
SpTeamTablePerformancePresenter >> initializeTable [

	table := self newTable.
	
	table 
		items: teamEvolutionData;
		addColumn: self createIndexColumn.
			
	self columnPairs pairsDo: [ :title :selector | 
		table addColumn: (SpStringTableColumn new  
			title: title;
			width: 50;
			evaluated: selector;
			yourself) ]
]

{ #category : #accessing }
SpTeamTablePerformancePresenter >> setModelBeforeInitialization: aTeamEvolutionData [

	teamEvolutionData := aTeamEvolutionData 
]
