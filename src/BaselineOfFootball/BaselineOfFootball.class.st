"
baseline for futbol project
"
Class {
	#name : #BaselineOfFootball,
	#superclass : #BaselineOf,
	#category : #'BaselineOfFootball-Baseline'
}

{ #category : #baselines }
BaselineOfFootball >> baseline: spec [
	<baseline>
	"main repository"
	"https://github.com/akevalion/Football"
	spec for: #common do: [
		spec postLoadDoIt: #generateDB.
		
		"Dependencies"
		self
			roassal3: spec;
			restore: spec;
			neoCSV: spec.
		"packages"
		spec
			package: 'Football' with: [ spec requires: #('Roassal3' 'NeoCSV' 'ReStore') ];
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

{ #category : #postload }
BaselineOfFootball >> generateDB [
	(Smalltalk at: #ESL) createDatabase
]

{ #category : #dependencies }
BaselineOfFootball >> neoCSV: spec [
	spec baseline: 'NeoCSV' with: [ spec repository: 'github://svenvc/NeoCSV/repository' ].
]

{ #category : #dependencies }
BaselineOfFootball >> restore: spec [
	spec 
		baseline: 'ReStore' 
 		with: [ 
			spec 
				repository: 'github://rko281/ReStoreForPharo';
    			loads: #( 'all' ) ]
]

{ #category : #dependencies }
BaselineOfFootball >> roassal3: spec [

	spec 
		baseline: 'Roassal3' 
 		with: [ spec
			repository: 'github://ObjectProfile/Roassal3';
			loads: #( 'SVGImporter' 'default' ) ]
]
