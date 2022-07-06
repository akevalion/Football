Extension { #name : #Season }

{ #category : #'*Futbol-Roassal' }
Season >> inspectorTablePointsContext: context [

	context withoutEvaluator
]

{ #category : #'*Futbol-Roassal' }
Season >> inspectorTeamEvolutionLinePlot [
	<inspectorPresentationOrder: 3 title: 'Teams Evolution'>
	^ EvolutionLinePlotVisualization new
		season: self;
		asPresenter
]
