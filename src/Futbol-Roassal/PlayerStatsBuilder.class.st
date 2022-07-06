"
I am a roassal builder for a player object
"
Class {
	#name : #PlayerStatsBuilder,
	#superclass : #AbstractStatsBuilder,
	#category : #'Futbol-Roassal'
}

{ #category : #accessing }
PlayerStatsBuilder >> axisNames [
	^ PlayerAttributes axisNames
]
