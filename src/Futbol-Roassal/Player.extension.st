Extension { #name : #Player }

{ #category : #'*Futbol-Roassal' }
Player >> inspectorStats [
	<inspectorPresentationOrder: 90 title: 'Stats'>
	^ PlayerStatsBuilder new
		player: self;
		asPresenter
]
