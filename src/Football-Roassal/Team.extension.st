Extension { #name : #Team }

{ #category : #'*Football-Roassal' }
Team >> inspectorRadar [
	<inspectorPresentationOrder: 1 title: 'Stats'>
	^ AnimatedRadarStatsVisualization new
		model: self;
		axisNames: TeamAttributes axisNames;
		asPresenter
]

{ #category : #'*Football-Roassal' }
Team >> inspectorRadarContext: context [
	context withoutEvaluator
]
