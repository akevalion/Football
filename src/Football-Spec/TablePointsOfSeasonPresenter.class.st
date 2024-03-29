"
Used by season
"
Class {
	#name : #TablePointsOfSeasonPresenter,
	#superclass : #TablePointsPresenter,
	#category : #'Football-Spec-Core'
}

{ #category : #initialization }
TablePointsOfSeasonPresenter >> columnPairs [
	^ #(MP matchesPlayed
	W wins
	D draws
	L losses
	GF goalsInFavor
	GA goalsAgainst
	GD goalsDifference
	PTS totalPoints)
]

{ #category : #utilities }
TablePointsOfSeasonPresenter >> doesTeamHasARelevantposition: teamStatsCalculator [

	| size tableItems |
	tableItems := table items.
	size := table items size.

	(tableItems indexOf: teamStatsCalculator) < 6 ifTrue: [ ^ true ].
	(tableItems indexOf: teamStatsCalculator) > (size - 3) ifTrue: [ ^ true ].

	^ false
]

{ #category : #initialization }
TablePointsOfSeasonPresenter >> initializeIndexColumn [

	table
		addColumn: (SpStringTableColumn new 
			title: '#';
			beNotExpandable;
			evaluated: [ :e | (table items indexOf: e) asString ];
			displayColor: [ :teamStatsCalculator |
				self teamStringTableColor: teamStatsCalculator ];
			displayBold: [ :teamStatsCalculator |
				self doesTeamHasARelevantposition: teamStatsCalculator];
			width: 20;
			yourself)
]

{ #category : #initialization }
TablePointsOfSeasonPresenter >> initializeNameColumn [

	table
		addColumn: (SpStringTableColumn new
			title: 'Team';
			evaluated: #teamName;
			displayColor: [ :teamStatsCalculator | self teamStringTableColor: teamStatsCalculator ];
			displayBold: [ :teamStatsCalculator |self doesTeamHasARelevantposition: teamStatsCalculator ];
			yourself)
]

{ #category : #transmission }
TablePointsOfSeasonPresenter >> outputActivationPort [

	^ table outputActivationPort
		transform: [ :aMatch | aMatch asTeam ];
		yourself
]

{ #category : #utilities }
TablePointsOfSeasonPresenter >> teamStringTableColor: teamStatsCalculator [

	| size tableItems |
	tableItems := table items.
	size := table items size.

	(tableItems indexOf: teamStatsCalculator) < 6 ifTrue: [ ^ Color fromString: '008000' ].
	(tableItems indexOf: teamStatsCalculator) > (size - 3) ifTrue: [ ^ Color fromString: 'ee6055' ].

	^ Smalltalk ui theme textColor
]
