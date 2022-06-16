Class {
	#name : #TeamTablePerformancePresenter,
	#superclass : #TablePointsPresenter,
	#instVars : [
		'team'
	],
	#category : #'Futbol-Spec'
}

{ #category : #initialization }
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

{ #category : #initialization }
TeamTablePerformancePresenter >> initializeIndexColumn [

	table addColumn: (SpStringTableColumn new 
		title: 'Season';
		width: 70;
		evaluated: [ :item | item season ];
		yourself)
]

{ #category : #initialization }
TeamTablePerformancePresenter >> initializeNameColumn [

]
