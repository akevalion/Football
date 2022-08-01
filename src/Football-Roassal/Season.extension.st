Extension { #name : #Season }

{ #category : #'*Football-Roassal' }
Season >> inspectorTablePointsContext: context [

	context withoutEvaluator
]

{ #category : #'*Football-Roassal' }
Season >> inspectorTeamEvolutionLinePlot [
	<inspectorPresentationOrder: 3 title: 'Teams Evolution'>
	^ EvolutionLinePlotVisualization new
		season: self;
		asPresenter
]
