Extension { #name : #Team }

{ #category : #'*Football-Spec' }
Team >> inspectorMatches [
	<inspectorPresentationOrder: 3 title: 'Matches of Team'>
	^ SpTablePresenter new
		addColumn: (SpIndexTableColumn new 
			title: '#';
			beNotExpandable;
			width: 30
			yourself);
		addColumn: (SpStringTableColumn new  
			title: 'Matches';
			evaluated: #yourself;
			yourself);
		items: self matches;
		yourself

]

{ #category : #'*Football-Spec' }
Team >> inspectorTablePerformance [

	<inspectorPresentationOrder: 2 title: 'Performance All Time'>
	^ TeamTablePerformancePresenter on: self teamEvolutionData
]

{ #category : #'*Football-Spec' }
Team >> inspectorTablePerformanceContext: aContext [

	aContext withoutEvaluator
]
