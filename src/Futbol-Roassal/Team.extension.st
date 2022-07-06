Extension { #name : #Team }

{ #category : #'*Futbol-Roassal' }
Team >> inspectorRadar [
	<inspectorPresentationOrder: 1 title: 'Stats'>
	^ TeamStatsBuilder new
		model: self;
		asPresenter
]

{ #category : #'*Futbol-Roassal' }
Team >> inspectorRadarContext: context [
	context withoutEvaluator
]
