Extension { #name : #Season }

{ #category : #'*Football-Spec' }
Season >> inspectorMatches [

	<inspectorPresentationOrder: 1 title: 'Matches'>
	^ SeasonMatchesTablePresenter on: self matches
]

{ #category : #'*Football-Spec' }
Season >> inspectorMatchesContext: context [
	context withoutEvaluator
]

{ #category : #'*Football-Spec' }
Season >> inspectorTablePoints [

	<inspectorPresentationOrder: 2 title: 'Table Points'>
	^ TablePointsOfSeasonPresenter on: self teamEvolutionData
]

{ #category : #'*Football-Spec' }
Season >> inspectorTeamEvolutionLinePlotContext: context [
	context withoutEvaluator 
]
