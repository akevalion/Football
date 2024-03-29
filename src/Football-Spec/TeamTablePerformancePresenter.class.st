Class {
	#name : #TeamTablePerformancePresenter,
	#superclass : #TablePointsPresenter,
	#category : #'Football-Spec-Core'
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
		evaluated: [ :item | item season ];
		yourself)
]

{ #category : #initialization }
TeamTablePerformancePresenter >> initializeNameColumn [

]

{ #category : #transmission }
TeamTablePerformancePresenter >> outputActivationPort [

	^ table outputActivationPort
		transform: [ :teamCalculator | teamCalculator asSeason ];
		yourself
]
