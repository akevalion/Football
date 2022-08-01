Extension { #name : #ESL }

{ #category : #'*Football-Spec' }
ESL >> inspectorLeagueList [
	<inspectorPresentationOrder: 1 title: 'Leagues'>
	^ SpListPresenter new
		items: self leagues;
		yourself
	
]
