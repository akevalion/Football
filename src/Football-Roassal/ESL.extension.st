Extension { #name : #ESL }

{ #category : #'*Football-Roassal' }
ESL >> inspectorLeaguesMap [
	<inspectorPresentationOrder: 2 title: 'Map'>
	^ ESLMapVisualization new
		leagues: self leagues;
		asPresenter
	
]

{ #category : #'*Football-Roassal' }
ESL >> inspectorLeaguesMapContext: aContext [
	aContext withoutEvaluator
	
]
