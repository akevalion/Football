Extension { #name : #TeamStatsCalculator }

{ #category : #'*Football-Spec' }
TeamStatsCalculator >> last5MatchesIcon [

	| canvas |
	canvas := RSCanvas new.
	canvas color: Color transparent.
	canvas addAll: (self last5Mathes collect: [ :result | self resultIconFor: result ]).
	RSHorizontalLineLayout new
		gapSize: 0;
		on: canvas nodes.
	
	canvas extent: 120 @ 25.
	canvas zoomToFit.
	^ canvas asForm
]
