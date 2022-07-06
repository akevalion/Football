Extension { #name : #Player }

{ #category : #'*Futbol-Roassal' }
Player >> inspectorStats [
	<inspectorPresentationOrder: 90 title: 'Stats'>
	^ RadarStatsVisualization new
		model: self;
		axisNames: PlayerAttributes axisNames;
		asPresenter
]

{ #category : #'*Futbol-Roassal' }
Player >> inspectorStatsContext: context [
	context withoutEvaluator
]
