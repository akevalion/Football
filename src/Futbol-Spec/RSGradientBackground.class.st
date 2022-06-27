"
Utility class add a nice background and configure the canvas controller
"
Class {
	#name : #RSGradientBackground,
	#superclass : #RSInteraction,
	#category : #'Futbol-Spec-Core'
}

{ #category : #hooks }
RSGradientBackground >> onShape: canvas [
	canvas @ (RSCanvasController new
		in: [:int | 
			int configuration 
				maxScale: 5;
				minScale: 1;
				padding: 0 ];
		yourself).
	canvas camera zoomRatio: 1.
	canvas when: RSExtentChangedEvent send: #updateBackground: to: self.
]

{ #category : #hooks }
RSGradientBackground >> updateBackground: evt [
	| box paint |
	box := evt canvas propertyAt: #backgroundBox ifAbsentPut: [ RSBox new ].
	box remove.
	evt canvas zoomToFit.
	paint := LinearGradientPaint fromArray:
		{0->'fdfbfb'. 
		1->'ebedee'}.
	box fromRectangle: evt canvas visibleRectangle.
	paint start: box baseRectangle origin.
	paint stop: box baseRectangle corner.
	box paint: paint.
	evt canvas addShape: box.
	box pushBack.
]
