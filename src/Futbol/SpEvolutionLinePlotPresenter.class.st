Class {
	#name : #SpEvolutionLinePlotPresenter,
	#superclass : #SpRoassal3InspectorPresenter,
	#instVars : [
		'season'
	],
	#category : #'Futbol-Spec'
}

{ #category : #building }
SpEvolutionLinePlotPresenter >> addLegend: chart teams: teams [
	| lb index |
	lb := RSLegend new.
	lb container: chart container.
	lb defaultCircle size: 10.
	lb defaultLabel color: Color black.
	index := 0.
	chart plots with: teams do: [ :plot :team | | realTeam |
		realTeam := team asTeam.
		index := index + 1.
		(lb
			text: index asString , '. ' , team teamName
			withCircleColor: plot line color)
			model: realTeam;
			padding: 5.
		plot line
			model: realTeam;
			addInteraction: RSMorphicPopupInteraction new ].
	self layout: lb with: teams.
	lb location offset: 0 @ 30.
	self addLegendInteractions: lb plots: chart plots.
	lb build
]

{ #category : #building }
SpEvolutionLinePlotPresenter >> addLegendInteractions: lb plots: plots [
	| highlight |
	"highlight := RSHighlightable color: Smalltalk ui theme selectionColor."
	highlight := RSHighlightable new.
	highlight 
		when: RSHighlightEvent do: [ :evt | 
			| plot |
			highlight record: evt shape selector: #color value: self theme selectionColor.
			plot := plots detect: [:each | each line model = evt shape model ].
			plots do: [ :each | each line color: (each line color alpha: 0.1) ].
			plot line
				color: (plot line color alpha: 1);
				width: 2;
				pushFront.
			 ];
		when: RSUnHighlightEvent do: [ :evt | 
			highlight restore: evt shape selector: #color.
			plots do: [ :plot |
				plot line 
					color: (plot line color alpha: 1);
					width: 1 ]. ].
	lb shapes addInteraction: highlight.
	
	
]

{ #category : #building }
SpEvolutionLinePlotPresenter >> layout: lb with: teams [

	lb legendDo: [ :shape | 
		| delta groups |
		delta := teams size sqrt asInteger.
		groups := OrderedCollection new.
		1 to: teams size by: delta do: [ :i | 
			groups add:
				(shape nodes copyFrom: i to: (i + delta - 1 min: teams size)) ].
		groups do: [ :list | 
			RSVerticalLineLayout new
				alignLeft;
				gapSize: 0;
				on: list ].
		RSHorizontalLineLayout new on: groups.
		shape adjustToChildren.
		shape
			border: (RSBorder new color: 'black');
			padding: 10;
			scaleBy: 0.5 ]
]

{ #category : #building }
SpEvolutionLinePlotPresenter >> newCanvas [
	| c chart teams |
	c := RSCanvas new.
	
	teams := season teamEvolutionData.
	chart := self newEvolutionLineChart: teams.
	chart container: c.
	chart build.
	chart shapes 
		select: [ :shape | shape isLabel ]
		thenDo: [ :shape | shape color: Color black ].
	
	self addLegend: chart teams: teams.
	c @ RSGradientBackground.
	
	^ c
]

{ #category : #building }
SpEvolutionLinePlotPresenter >> newEvolutionLineChart: teams [
	| chart x popup |
	chart := RSChart new.
	popup := RSPopupDecoration new.
	chart addDecoration: popup.
	teams do: [ :team | | plot |
		x := 1 to: team points size.
		chart addPlot: (plot := RSLinePlot new x: {0},x y: {0},team points).
		popup chartPopupBuilder
			for: plot text: team teamName color: plot computeColor.
	].
	chart
		extent: 380@(380*9/16);
		addDecoration: (RSHorizontalTick new
			in: [ :tick |tick configuration tickSize: chart extent y negated ];
			color: Color veryVeryLightGray;
			numberOfTicks: 20;
			integer);
		addDecoration: (RSVerticalTick new 
			in: [ :tick | tick configuration tickSize: chart extent x negated ];
			color: Color veryVeryLightGray;
			numberOfTicks: 10;
			integer);
		title: 'Points Evolutions during Season: ', season season;
		xlabel: 'Matches Played';
		ylabel: 'Points'.
	^ chart
	
]

{ #category : #accessing }
SpEvolutionLinePlotPresenter >> season: aSeason [
	season := aSeason.
	self canvas: self newCanvas.
]
