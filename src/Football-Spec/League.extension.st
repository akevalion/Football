Extension { #name : #League }

{ #category : #'*Football-Spec' }
League >> inspectorSeasonList [
	
	<inspectorPresentationOrder: 1 title: 'Seasons'>
	^ SpListPresenter new 
		items: self seasons;
		yourself
]

{ #category : #'*Football-Spec' }
League >> inspectorTeamList [
	
	<inspectorPresentationOrder: 2 title: 'Teams'>
	^ SpTablePresenter new
		addColumn: (SpIndexTableColumn new 
			title: '#';
			beNotExpandable;
			width: 30
			yourself);
		addColumn: (SpStringTableColumn new  
			title: 'Teams';
			evaluated: #asString;
			yourself);
		items: self teams;
		sortingBlock: #team_long_name ascending;
		yourself
]
