Extension { #name : #Match }

{ #category : #'*Football-Roassal' }
Match >> inspectorMatchField [
	<inspectorPresentationOrder: 90 title: 'Players'>
	
	^ MatchFieldVisualization new
		match: self;
		asPresenter
]

{ #category : #'*Football-Roassal' }
Match >> inspectorMatchFieldContext: aContext [

	aContext withoutEvaluator
]
