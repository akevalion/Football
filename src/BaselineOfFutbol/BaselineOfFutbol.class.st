"
baseline for futbol project
"
Class {
	#name : #BaselineOfFutbol,
	#superclass : #BaselineOf,
	#category : #'BaselineOfFutbol-Baseline'
}

{ #category : #baselines }
BaselineOfFutbol >> baseline: spec [
	<baseline>
	"main repository"
	"https://github.com/akevalion/Futbol"
	spec for: #common do: [
		spec postLoadDoIt: #generateDB.
		
		"Dependencies"
		self
			roassal3: spec;
			restore: spec;
			neoCSV: spec.
		"packages"
		spec
			package: 'Futbol' with: [ spec requires: #('Roassal3' 'NeoCSV' 'ReStore') ];
			package: 'Futbol-Spec' with: [ spec requires: #('Futbol') ];
			package: 'Futbol-Roassal' with: [ spec requires: #('Futbol') ];
			package: 'Futbol-Tests' with: [ spec requires: #('Futbol' 'Futbol-Spec' 'Futbol-Roassal') ].
				
		"Groups"
		spec
			group: 'default' with: #('Futbol-Tests') ]
		
]

{ #category : #postload }
BaselineOfFutbol >> generateDB [
	(Smalltalk at: #ESL) createDatabase
]

{ #category : #dependencies }
BaselineOfFutbol >> neoCSV: spec [
	spec baseline: 'NeoCSV' with: [ spec repository: 'github://svenvc/NeoCSV/repository' ].
]

{ #category : #dependencies }
BaselineOfFutbol >> restore: spec [
	spec 
		baseline: 'ReStore' 
 		with: [ 
			spec 
				repository: 'github://rko281/ReStoreForPharo';
    			loads: #( 'all' ) ]
]

{ #category : #dependencies }
BaselineOfFutbol >> roassal3: spec [

	spec 
		baseline: 'Roassal3' 
 		with: [ 
			spec
				repository: (self class environment at: #BaselineOfPharo) roassal3Repository;
    			loads: #( 'SVGImporter' ) ]
]
