Extension { #name : #ESL }

{ #category : #'*Futbol-Roassal' }
ESL >> inspectorLeaguesMap [
	<inspectorPresentationOrder: 2 title: 'Map'>
	^ ESLMap new
		leagues: self leagues;
		asPresenter
]

{ #category : #'*Futbol-Roassal' }
ESL >> inspectorLeaguesMapContext: context [
	context withoutEvaluator
]
