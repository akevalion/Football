Extension { #name : #Match }

{ #category : #'*Futbol-Roassal' }
Match >> inspectorMatchField [
	<inspectorPresentationOrder: 90 title: 'Players'>
	
	^ MatchFieldVisualization new
		match: self;
		asPresenter
]

{ #category : #'*Futbol-Roassal' }
Match >> inspectorMatchFieldContext: aContext [

	aContext withoutEvaluator
]
