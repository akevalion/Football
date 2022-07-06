Extension { #name : #ESL }

{ #category : #'*Futbol-Spec' }
ESL >> inspectorLeagueList [
	<inspectorPresentationOrder: 2 title: 'Leagues'>
	^ SpListPresenter new
		items: self leagues;
		yourself
	
]
