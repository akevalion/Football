"
I am an abstract class to create a radar visualization
"
Class {
	#name : #RadarStatsVisualization,
	#superclass : #RSAbstractContainerBuilder,
	#instVars : [
		'stats',
		'model',
		'axisNames',
		'kiviat'
	],
	#category : #'Football-Roassal'
}

{ #category : #accessing }
RadarStatsVisualization >> axisNames [
	^ axisNames
]

{ #category : #accessing }
RadarStatsVisualization >> axisNames: aCollection [
	axisNames := aCollection
]

{ #category : #'accessing - defaults' }
RadarStatsVisualization >> defaultContainer [
	^ RSCanvas new @ RSCanvasController
]

{ #category : #accessing }
RadarStatsVisualization >> model: anObject [
	model := anObject.
	stats := model stats.
]

{ #category : #hooks }
RadarStatsVisualization >> newKiviat [
	^ RSKiviat new
		in: [ :kiviat | stats do: [ :stat | kiviat addRow: stat dataArray ] ];
		axisNames: self axisNames;
		usePolygonBorder;
		maxValue: 100;
		minValue: 0;
		yourself
]

{ #category : #hooks }
RadarStatsVisualization >> renderIn: aCanvas [
	stats 
		ifEmpty: [ aCanvas add: (RSLabel text: 'No information') ]
		ifNotEmpty: [ self renderKiviatIn: aCanvas ]
	
]

{ #category : #hooks }
RadarStatsVisualization >> renderKiviatIn: aCanvas [
	kiviat := self newKiviat.
	kiviat container: aCanvas.
	kiviat build.
	kiviat labels do: [ :lbl | lbl color: Color black ].
	
]
