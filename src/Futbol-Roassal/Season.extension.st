Extension { #name : #Season }

{ #category : #'*Futbol-Roassal' }
Season >> inspectorTeamEvolutionLinePlot [
	<inspectorPresentationOrder: 3 title: 'Teams Evolution'>
	^ EvolutionLinePlotBuilder new
		season: self;
		asPresenter
]
