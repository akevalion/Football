Extension { #name : #Team }

{ #category : #'*Futbol-Roassal' }
Team >> inspectorRadar [
	<inspectorPresentationOrder: 1 title: 'Stats'>
	^ RadarStatsVisualization new
		model: self;
		axisNames: TeamAttributes axisNames;
		asPresenter
]

{ #category : #'*Futbol-Roassal' }
Team >> inspectorRadarContext: context [
	context withoutEvaluator
]
