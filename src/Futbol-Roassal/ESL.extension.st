Extension { #name : #ESL }

{ #category : #'*Futbol-Roassal' }
ESL >> inspectorLeaguesMap [
	<inspectorPresentationOrder: 2 title: 'Map'>
	^ ESLMap new
		leagues: self leagues;
		asPresenter
]
