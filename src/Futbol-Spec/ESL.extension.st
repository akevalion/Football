Extension { #name : #ESL }

{ #category : #'*Futbol-Spec' }
ESL >> inspectorLeagueList [
	<inspectorPresentationOrder: 1 title: 'Leagues'>
	^ SpListPresenter new
		items: self leagues;
		yourself
	
]
