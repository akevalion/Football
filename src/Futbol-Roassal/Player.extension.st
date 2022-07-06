Extension { #name : #Player }

{ #category : #'*Futbol-Roassal' }
Player >> inspectorStats [
	<inspectorPresentationOrder: 90 title: 'Stats'>
	^ PlayerStatsBuilder new
		model: self;
		asPresenter
]

{ #category : #'*Futbol-Roassal' }
Player >> inspectorStatsContext: context [
	context withoutEvaluator
]
