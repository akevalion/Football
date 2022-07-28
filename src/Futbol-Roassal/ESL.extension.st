Extension { #name : #ESL }

{ #category : #'*Futbol-Roassal' }
ESL >> inspectorLeaguesMap [
	<inspectorPresentationOrder: 2 title: 'Map'>
	^ ESLMapVisualization new
		leagues: self leagues;
		asPresenter
	
]

{ #category : #'*Futbol-Roassal' }
ESL >> inspectorLeaguesMapContext: aContext [
	aContext withoutEvaluator
	
]
