Class {
	#name : #TeamTablePerformancePresenter,
	#superclass : #StInspection,
	#instVars : [
		'team',
		'table',
		'teamEvolutionData'
	],
	#category : #'Futbol-Spec'
}

{ #category : #accessing }
TeamTablePerformancePresenter >> columnPairs [
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
TeamTablePerformancePresenter >> createIndexColumn [

	^ SpStringTableColumn new 
		title: 'Season';
		"width: 70;"
		evaluated: [ :item | item season ];
		yourself
]

{ #category : #layout }
TeamTablePerformancePresenter >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		add: table;
		yourself
]

{ #category : #testing }
TeamTablePerformancePresenter >> hasOutputActivationPort [

	^ true
]

{ #category : #initialization }
TeamTablePerformancePresenter >> initializePresenters [

	self initializeTable
	
]

{ #category : #initialization }
TeamTablePerformancePresenter >> initializeTable [

	table := self newTable.
	
	table
		activateOnSingleClick;
		items: teamEvolutionData;
		addColumn: self createIndexColumn.
			
	self columnPairs pairsDo: [ :title :selector | 
		table addColumn: (SpStringTableColumn new  
			title: title;
			width: 50;
			evaluated: selector;
			yourself) ]
]

{ #category : #ports }
TeamTablePerformancePresenter >> outputActivationPort [

    ^ table outputActivationPort
        transform: [ :aValue |  5 "para probar" ];
        yourself.
]

{ #category : #'accessing - model' }
TeamTablePerformancePresenter >> setModelBeforeInitialization: aTeamEvolutionData [

	teamEvolutionData := aTeamEvolutionData 
]
