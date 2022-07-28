"
I am an abstract class for creating a table of points. You need to extend me to use me
"
Class {
	#name : #TablePointsPresenter,
	#superclass : #SpPresenter,
	#traits : 'SpTActivable',
	#classTraits : 'SpTActivable classTrait',
	#instVars : [
		'table',
		'teamEvolutionData'
	],
	#category : #'Futbol-Spec-Core'
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

{ #category : #initialization }
TablePointsPresenter >> initializeColumnPairsColumns [

	self columnPairs pairsDo: [ :title :selector | 
		table addColumn: (SpStringTableColumn new
			title: title;
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

{ #category : #'accessing - model' }
TablePointsPresenter >> setModelBeforeInitialization: aTeamEvolutionData [

	teamEvolutionData := aTeamEvolutionData
]
