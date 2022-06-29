Extension { #name : #Season }

{ #category : #'*Futbol-Spec' }
Season >> inspectorMatches [

	<inspectorPresentationOrder: 1 title: 'Matches'>
	^ SeasonMatchesTablePresenter on: self matches
]

{ #category : #'*Futbol-Spec' }
Season >> inspectorMatchesContext: context [
	context withoutEvaluator
]

{ #category : #'*Futbol-Spec' }
Season >> inspectorTablePoints [

	<inspectorPresentationOrder: 2 title: 'Table Points'>
	^ TablePointsOfSeasonPresenter on: self teamEvolutionData
]

{ #category : #'*Futbol-Spec' }
Season >> inspectorTablePointsContext: context [

	context withoutEvaluator
]

{ #category : #'*Futbol-Spec' }
Season >> inspectorTeamEvolutionLinePlotContext: context [
	context withoutEvaluator 
]
