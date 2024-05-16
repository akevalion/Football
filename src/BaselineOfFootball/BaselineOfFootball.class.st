"
baseline for futbol project
"
Class {
	#name : 'BaselineOfFootball',
	#superclass : 'BaselineOf',
	#classVars : [
		'LaunchButton'
	],
	#category : 'BaselineOfFootball-Baseline',
	#package : 'BaselineOfFootball',
	#tag : 'Baseline'
}

{ #category : 'demo' }
BaselineOfFootball class >> createButton [
	| canvas  playIcon background text group w h paint high paint2 |
	canvas := RSCanvas new.
	canvas color: Color transparent.
	playIcon := self playIcon.
	playIcon scaleBy: 0.5.
	
	paint := MeshGradientPaint new
		addTriangleWithPoints: { -75@ -75 . 75@ -75 . 0@ 125 }
			colors: { Color green . Color red . Color blue}.
	text := RSLabel new
		text: 'Launch';
		fontName: 'Impact';
		paint: paint;
		yourself.
	playIcon paint: paint.
	group := { playIcon. text } asGroup.
	RSHorizontalLineLayout new alignMiddle; gapSize: 2; on: group.
	w := group width.
	h := group height.
	
	paint := RSGradientPalette winterNeva.
	paint start: 0@ -0.5 * h; stop: 0@0.5 * h.
	background := RSPolygon new 
		points: {
			0@0. 
			1.2 @ 0.
			1.2 @ 0.6  .
			0.95@ 1.2 . 
			0@ 1.2 } * (w @ h);
		cornerRadii: 5;
		position: group position;
		paint: paint;
		yourself.
	
	canvas addAll: { background. playIcon. text }.
	canvas when: RSExtentChangedEvent send: #zoomToFit to: canvas.
	paint2 := RSGradientPalette deepBlue.
	paint2 start: 0@ -0.5 * h; stop: 0@0.5 * h.
	high := RSHighlightable new
		when: RSHighlightEvent do: [ :evt | background paint: paint2; signalUpdate ];
		when: RSUnHighlightEvent do: [ :evt | background paint: paint; signalUpdate ].
		
	{ background. playIcon. text } asGroup
		addInteraction: high;
		when: RSMouseClick do: [ :evt | EuropeanFootballLeagues new inspect ].
	
	^ canvas createMorph.
	
	
]

{ #category : 'demo' }
BaselineOfFootball class >> handIcon [
	^ RSSVGPath new
		svgPath: self handSVGString;
		yourself 
]

{ #category : 'demo' }
BaselineOfFootball class >> handSVGString [
	^ 'M69.334,81.609c1.646,0,2.982-1.338,2.982-2.984v-7.459c0-1.646-1.337-2.984-2.982-2.984h-0.52
		c0.273-3.088,0.873-4.131,1.785-5.709c0.676-1.17,1.518-2.625,2.452-5.17c2.501-6.805,1.478-18.619,1.433-19.117l-0.021-0.145
		c-1.147-6.113-5.253-7.006-7.97-7.596c-1.008-0.219-1.961-0.429-2.504-0.82c-2.678-2.612-5.649-3.755-8.047-4.234
		c-1.545,0.009-3.143-0.137-4.816-0.474c-1.565-0.479-6.207-1.545-10.106,0.96c-0.015-6.588-0.04-18.274-0.04-19.701
		c0-2.474-2.951-4.751-2.951-4.751C36.816,0.533,35.325,0,33.705,0c-4.038,0-7.324,3.285-7.324,7.322v32.062
		c0,1.305-0.161,2.286-0.342,2.973c-7.436-3.933-12.877-4.944-16.189-3.005c-2.936,1.719-2.971,4.986-2.971,5.125
		c0.001,5.4,6.351,7.822,7.227,8.132C26.13,58.188,27.41,64.741,27.09,68.182h-0.523c-1.649,0.002-2.984,1.338-2.984,2.984v7.459
		c0,1.648,1.335,2.983,2.984,2.983L69.334,81.609z '
]

{ #category : 'demo' }
BaselineOfFootball class >> launchButton [
	^ LaunchButton ifNil: [ LaunchButton := self createButton ]
]

{ #category : 'demo' }
BaselineOfFootball class >> launchButton: anObject [
	LaunchButton := anObject
]

{ #category : 'demo' }
BaselineOfFootball class >> playIcon [
	^ RSSVGPath new
		svgPath: self playSVGString;
		yourself 
]

{ #category : 'demo' }
BaselineOfFootball class >> playSVGString [
	^ 'M45.563,29.174l-22-15c-0.307-0.208-0.703-0.231-1.031-0.058C22.205,14.289,22,14.629,22,15v30   c0,0.371,0.205,0.711,0.533,0.884C22.679,45.962,22.84,46,23,46c0.197,0,0.394-0.059,0.563-0.174l22-15   C45.836,30.64,46,30.331,46,30S45.836,29.36,45.563,29.174z M24,43.107V16.893L43.225,30L24,43.107zM30,0C13.458,0,0,13.458,0,30s13.458,30,30,30s30-13.458,30-30S46.542,0,30,0z M30,58C14.561,58,2,45.439,2,30   S14.561,2,30,2s28,12.561,28,28S45.439,58,30,58z'
]

{ #category : 'baselines' }
BaselineOfFootball >> baseline: spec [
	<baseline>
	"main repository"
	"https://github.com/akevalion/Football"
	spec for: #common do: [
		spec postLoadDoIt: #generateDB.
		"spec postLoadDoIt: #prepareForDemo."
		
		"Dependencies"
		self
			roassal: spec;
			restore: spec;
			neoCSV: spec.
		"packages"
		spec
			package: 'Football' with: [ spec requires: #('Roassal' 'NeoCSV' 'ReStore') ];
			package: 'Football-Spec' with: [ spec requires: #('Football') ];
			package: 'Football-Roassal' with: [ spec requires: #('Football') ];
			package: 'Football-Tests' with: [ spec requires: #(
				'Football'
				'Football-Spec'
				'Football-Roassal') ].
				
		"Groups"
		spec
			group: 'default' with: #('Football-Tests') ]
		
]

{ #category : 'postload' }
BaselineOfFootball >> generateDB [
	(Smalltalk at: #EuropeanFootballLeagues) createDatabase
]

{ #category : 'demo' }
BaselineOfFootball >> launchButton [
	^ self class launchButton
]

{ #category : 'dependencies' }
BaselineOfFootball >> neoCSV: spec [
	spec baseline: 'NeoCSV' with: [ spec repository: 'github://svenvc/NeoCSV/repository' ].
]

{ #category : 'demo' }
BaselineOfFootball >> prepareForDemo [
	<script: 'self new prepareForDemo'>
	"self launchButton roassalCanvas open."
	| button win |
	MenubarMorph showMenubar: false.
	TaskbarMorph showTaskbar: false.
	PolymorphSystemSettings showDesktopLogo: false.
	
	button := self launchButton.
	
	win := button openInWindowLabeled: ''.
	win makeUnclosable.
	win position: 50@50.
	win extent: 200@100.
	
]

{ #category : 'demo' }
BaselineOfFootball >> prepareForDev [
	<script: 'self new prepareForDev'>
	
	| button |
	MenubarMorph showMenubar: true.
	TaskbarMorph showTaskbar: true.
	PolymorphSystemSettings showDesktopLogo: true.
	
	button := self launchButton.
	button delete.
	self class launchButton: nil
]

{ #category : 'dependencies' }
BaselineOfFootball >> restore: spec [
	spec 
		baseline: 'ReStore' 
 		with: [ 
			spec 
				repository: 'github://rko281/ReStoreForPharo';
    			loads: #( 'all' ) ]
]

{ #category : 'dependencies' }
BaselineOfFootball >> roassal: spec [

	spec 
		baseline: 'Roassal' 
 		with: [ spec
			repository: 'github://pharo-graphics/Roassal';
			loads: #( 'SVGImporter' 'default' ) ]
]
