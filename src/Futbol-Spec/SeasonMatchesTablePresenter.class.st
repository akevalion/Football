Class {
	#name : #SeasonMatchesTablePresenter,
	#superclass : #StInspection,
	#instVars : [
		'table',
		'matches',
		'searchTextInput',
		'filteredMatches'
	],
	#category : #'Futbol-Spec-Core'
}

{ #category : #initialization }
SeasonMatchesTablePresenter >> connectPresenters [

	searchTextInput whenTextChangedDo: [ :text | 
		filteredMatches := self filterMatches: text.
		table items: filteredMatches ]
]

{ #category : #layout }
SeasonMatchesTablePresenter >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		spacing: 5;
		add: table;
		add: searchTextInput expand: false;
		yourself
]

{ #category : #initialization }
SeasonMatchesTablePresenter >> filterMatches: text [

	| andStrings |
	andStrings := (text trim asLowercase removeLowercaseAccents substrings: '&') collect: #trim.
	
	^ matches select: [ :aMatch | 
		| searchingMatch |
		searchingMatch := aMatch asString asLowercase removeLowercaseAccents.
		andStrings allSatisfy: [ :each | searchingMatch includesSubstring: each ] ]
]

{ #category : #testing }
SeasonMatchesTablePresenter >> hasOutputActivationPort [

	^ true
]

{ #category : #initialization }
SeasonMatchesTablePresenter >> initializePresenters [

	self initializeTable.
	self initializeSearchTextInput
]

{ #category : #initialization }
SeasonMatchesTablePresenter >> initializeSearchTextInput [

	searchTextInput := self newTextInput.
	searchTextInput placeholder: 'Match1 & Match2'
]

{ #category : #initialization }
SeasonMatchesTablePresenter >> initializeTable [

	table := SpTablePresenter new.
	table
		alternateRowsColor;
		activateOnSingleClick.
	table
		addColumn: (SpIndexTableColumn new
				 title: '#';
				 beNotExpandable;
				 width: 30 yourself);
		addColumn: (SpStringTableColumn new
				 title: 'Matches';
				 evaluated: #yourself;
				 yourself);
		addColumn: (SpStringTableColumn new
				 title: 'Date';
				 width: 80;
				 evaluated: [ :each | each dateAndTime asDate mmddyyyy ];
				 yourself);
		items: matches
]

{ #category : #testing }
SeasonMatchesTablePresenter >> outputActivationPort [

	^ table outputActivationPort
		transform: [ :selection | SpWrappedItem new 
			selectedItem: selection selectedItem;
			yourself ];
		yourself
]

{ #category : #'accessing - model' }
SeasonMatchesTablePresenter >> setModelBeforeInitialization: aMatchesArray [

	matches := aMatchesArray.
	filteredMatches := matches
]
