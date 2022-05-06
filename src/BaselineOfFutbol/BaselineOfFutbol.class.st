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
		"Dependencies"
		
		self
			roassal3: spec;
			restore: spec.
		"packages"
		spec
			package: 'Futbol' with: [ spec requires: #('Roassal3') ];
			package: 'Futbol-Tests' with: [ spec requires: 'Futbol' ].
				
		"Groups"
		spec
			group: 'default' with: #('Futbol' 'Futbol-Tests') ]
		
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
    			loads: #( 'Core' 'Tests') ]
]
