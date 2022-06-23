Class {
	#name : #SeasonMatchesTablePresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'table',
		'matches',
		'searchTextInput',
		'filteredMatches'
	],
	#category : #'Futbol-Spec'
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
	andStrings := (text trim asLowercase substrings: '&') collect: #trim.
	^ matches select: [ :aMatch |
		| searchingMatch |
		searchingMatch := aMatch asString asLowercase.
		andStrings allSatisfy: [ :each | searchingMatch includesSubstring: each  ] ]
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
		addColumn: (SpIndexTableColumn new
				 title: '#';
				 beNotExpandable;
				 width: 30 yourself);
		addColumn: (SpStringTableColumn new
				 title: 'Matches';
				 evaluated: #asString;
				 yourself);
		addColumn: (SpStringTableColumn new
				 title: 'Date';
				 width: 80;
				 evaluated: [ :each | each dateAndTime asDate mmddyyyy ];
				 yourself);
		items: matches
]

{ #category : #'accessing - model' }
SeasonMatchesTablePresenter >> setModelBeforeInitialization: aMatchesArray [

	matches := aMatchesArray.
	filteredMatches := matches
]
