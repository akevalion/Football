Extension { #name : #TeamStatsCalculator }

{ #category : #'*Futbol-Spec' }
TeamStatsCalculator >> last5MatchesIcon [

	| canvas |
	canvas := RSCanvas new.
	canvas color: Color transparent.
	canvas addAll: (self last5Mathes collect: [ :result | self resultIconFor: result ]).
	RSHorizontalLineLayout new
		gapSize: 0;
		on: canvas nodes.
	canvas camera position: canvas encompassingRectangle floatCenter.
	canvas extent: 100 @ 25.
	^ canvas asForm
]
