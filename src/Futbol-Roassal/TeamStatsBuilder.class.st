"
Used to create a radar visualization
"
Class {
	#name : #TeamStatsBuilder,
	#superclass : #AbstractStatsBuilder,
	#category : #'Futbol-Roassal'
}

{ #category : #accessing }
TeamStatsBuilder >> axisNames [
	^ TeamAttributes axisNames
]
