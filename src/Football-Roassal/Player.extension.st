Extension { #name : #Player }

{ #category : #'*Football-Roassal' }
Player >> inspectorStats [
	<inspectorPresentationOrder: 90 title: 'Stats'>
	^ AnimatedRadarStatsVisualization new
		model: self;
		axisNames: PlayerAttributes axisNames;
		asPresenter
]

{ #category : #'*Football-Roassal' }
Player >> inspectorStatsContext: context [
	context withoutEvaluator
]
