Extension { #name : #ESL }

{ #category : #'*Futbol-Roassal' }
ESL >> inspectorLeaguesMap [
	<inspectorPresentationOrder: 1 title: 'Map'>
	^ ESLMapVisualization new
		leagues: self leagues;
		asPresenter
]

{ #category : #'*Futbol-Roassal' }
ESL >> inspectorLeaguesMapContext: context [
	context withoutEvaluator
]
