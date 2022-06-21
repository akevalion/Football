"
I am an abstract class for creating a table of points. You need to extend me to use me
"
Class {
	#name : #TablePointsPresenter,
	#superclass : #StInspection,
	#instVars : [
		'table',
		'teamEvolutionData'
	],
	#category : #'Futbol-Spec'
}

{ #category : #initialization }
TablePointsPresenter >> columnPairs [

	^ self subclassResponsibility
]

{ #category : #layout }
TablePointsPresenter >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		add: table;
		yourself
]

{ #category : #testing }
TablePointsPresenter >> hasOutputActivationPort [

	^ true
]

{ #category : #initialization }
TablePointsPresenter >> initializeColumnPairsColumns [

	self columnPairs pairsDo: [ :title :selector | 
		table addColumn: (SpStringTableColumn new
			title: title;
			"width: 50;"
			evaluated: selector;
			yourself) ]
]

{ #category : #initialization }
TablePointsPresenter >> initializeIndexColumn [

	self subclassResponsibility
]

{ #category : #initialization }
TablePointsPresenter >> initializeLastMatchesColumn [

	table addColumn: (SpImageTableColumn new
		title: 'Last 5 matches';
		width: 120;
		evaluated: #last5MatchesIcon;
		yourself).
]

{ #category : #initialization }
TablePointsPresenter >> initializeNameColumn [

	self subclassResponsibility
]

{ #category : #initialization }
TablePointsPresenter >> initializePresenters [

	table := self newTable.
	table
		alternateRowsColor;
		activateOnSingleClick;
		items: teamEvolutionData.
	
	self initializeIndexColumn.
	self initializeNameColumn.
	self initializeColumnPairsColumns.
	self initializeLastMatchesColumn
]

{ #category : #testing }
TablePointsPresenter >> outputActivationPort [
    "^ SpActivationPort newPresenter: self"
	^ table outputActivationPort
		transform: [ :selection | SpWrappedItem new 
			selectedItem: selection selectedItem asTeam;
			yourself ];
		yourself
]

{ #category : #'accessing - model' }
TablePointsPresenter >> setModelBeforeInitialization: aTeamEvolutionData [

	teamEvolutionData := aTeamEvolutionData
]
