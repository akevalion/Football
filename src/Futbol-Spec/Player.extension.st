Extension { #name : #Player }

{ #category : #'*Futbol-Spec' }
Player >> inspectorStats [
	<inspectorPresentationOrder: 90 title: 'Stats'>
	^ SpPlayerStatsPresenter new
		player: self;
		yourself
]

{ #category : #'*Futbol-Spec' }
Player >> inspectorStatsContext: context [
	context withoutEvaluator
]
