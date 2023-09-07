Extension { #name : #EuropeanFootballLeagues }

{ #category : #'*Football-Spec' }
EuropeanFootballLeagues >> inspectorLeagueList [
	<inspectorPresentationOrder: 2 title: 'Leagues'>
	^ SpListPresenter new
		items: self leagues;
		yourself
	
]
