Extension { #name : #EuropeanFootballLeagues }

{ #category : #'*Football-Roassal' }
EuropeanFootballLeagues >> inspectorLeaguesMap [
	<inspectorPresentationOrder: 1 title: 'Map'>
	^ ESLMapVisualization new
		leagues: self leagues;
		asPresenter
	
]

{ #category : #'*Football-Roassal' }
EuropeanFootballLeagues >> inspectorLeaguesMapContext: aContext [
	aContext withoutEvaluator
	
]
