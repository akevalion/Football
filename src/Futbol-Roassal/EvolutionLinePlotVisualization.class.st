"
Used to create a custom chart 
"
Class {
	#name : #EvolutionLinePlotVisualization,
	#superclass : #RSAbstractContainerBuilder,
	#instVars : [
		'season',
		'teams'
	],
	#category : #'Futbol-Roassal'
}

{ #category : #hooks }
EvolutionLinePlotVisualization >> addLegendInteractions: lb plots: plots [
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

{ #category : #hooks }
EvolutionLinePlotVisualization >> chartExtent [
	^ 380@(380*9/16)
]

{ #category : #'accessing - defaults' }
EvolutionLinePlotVisualization >> defaultContainer [
	^ RSCanvas new @ RSGradientBackground
]

{ #category : #hooks }
EvolutionLinePlotVisualization >> labelsColorInBlack: aCanvas [
	aCanvas shapes 
		select: [ :shape | shape isLabel ]
		thenDo: [ :shape | shape color: Color black ]
]

{ #category : #'private - layout' }
EvolutionLinePlotVisualization >> layout: lb [

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

{ #category : #hooks }
EvolutionLinePlotVisualization >> newEvolutionLineChart [
	| chart x popup |
	chart := RSChart new.
	popup := RSPopupDecoration new.
	chart addDecoration: popup.
	
	chart
		extent: self chartExtent;
		addDecoration: self newHorizontalTick;
		addDecoration: self newVerticalTick;
		title: 'Points Evolution During Season: ', season season;
		xlabel: 'Matches Played'.
	(chart ylabel: 'Points') right.
	
	teams do: [ :team | | plot points y |
		points := team accumulatePoints.
		x := OrderedCollection withAll: (1 to: points size).
		y := OrderedCollection withAll: points.
		x addFirst: 0.
		y addFirst: 0.
		chart addPlot: (plot := RSLinePlot new x: x y: y).
		popup chartPopupBuilder
			for: plot text: team teamName color: plot computeColor.
	].
	
	^ chart
	
]

{ #category : #hooks }
EvolutionLinePlotVisualization >> newHorizontalTick [
	^ RSHorizontalTick new
		in: [ :tick | 
			tick shape width: 0.5.
			tick configuration tickSize: self chartExtent y negated ];
		color: Color veryVeryLightGray;
		numberOfTicks: 20;
		integer;
		yourself
]

{ #category : #hooks }
EvolutionLinePlotVisualization >> newVerticalTick [
	^ RSVerticalTick new 
		in: [ :tick | 
			tick shape width: 0.5.
			tick configuration tickSize: self chartExtent x negated.
			tick labelLocation right offset: 5@0 ];
		color: Color veryVeryLightGray;
		numberOfTicks: 10;
		integer;
		yourself
]

{ #category : #hooks }
EvolutionLinePlotVisualization >> renderIn: aCanvas [
	| chart |
	chart := self newEvolutionLineChart.
	chart container: aCanvas.
	chart build.
	self labelsColorInBlack: aCanvas.
	self renderLegendWith: chart
]

{ #category : #hooks }
EvolutionLinePlotVisualization >> renderLegendWith: chart [
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
	self layout: lb.
	lb location offset: 0 @ 30.
	self addLegendInteractions: lb plots: chart plots.
	lb build
]

{ #category : #accessing }
EvolutionLinePlotVisualization >> season: aSeason [
	season := aSeason.
	teams := season teamEvolutionData
]

{ #category : #accessing }
EvolutionLinePlotVisualization >> theme [
	^ Smalltalk ui theme
]
