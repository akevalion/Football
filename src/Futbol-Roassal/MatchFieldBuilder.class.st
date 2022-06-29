"
I can draw a match field with each player position
"
Class {
	#name : #MatchFieldBuilder,
	#superclass : #RSAbstractContainerBuilder,
	#instVars : [
		'palette',
		'homePlayers',
		'awayPlayers',
		'match'
	],
	#category : #'Futbol-Roassal'
}

{ #category : #hooks }
MatchFieldBuilder >> createAwayPlayers [
	| players layers |
	awayPlayers := self playersFrom: 'away'.
	players := awayPlayers collect: [ :player | 
		(self createPlayerShapeFor: player) 
			in: [ :shape |
				shape children first color: palette range nextToLast.
				shape position: (shape position x negated + (30*25) ) @ shape position y ]
			yourself ] as: RSGroup.
	
	layers := players groupedBy: [ :shape | (shape propertyAt: #drawablePlayer) y ].
	layers do: [ :group | 
		RSVerticalLineLayout new
			gapSize: 20;
			on: group ].
	RSHorizontalLineLayout new
		alignMiddle;
		gapSize: 40;
		on: (layers values reverse collect: [:group | group asGroup ]).
	^ players	
]

{ #category : #hooks }
MatchFieldBuilder >> createHomePlayers [
	| players layers |
	homePlayers := self playersFrom: 'home'.
	players := homePlayers collect: [ :player | 
		(self createPlayerShapeFor: player) 
			in: [ :shape |
				shape children first color: palette range second.
				shape position: shape position x @ shape position y ]
			yourself ] as: RSGroup.
	layers := players groupedBy: [ :shape | (shape propertyAt: #drawablePlayer) y ].
	layers do: [ :group | 
		RSVerticalLineLayout new
			gapSize: 20;
			on: group reverse ].
	RSHorizontalLineLayout new
		alignMiddle;
		gapSize: 40;
		on: (layers values collect: [:group | group asGroup ]).
	^ players
]

{ #category : #hooks }
MatchFieldBuilder >> createPlayerShapeFor: aDrawablePlayer [
	| size circle name label box |
	size := 30.
	circle := RSEllipse new
		size: size*0.75;
		yourself.
	label := RSLabel new
		color: 'black';
		text: aDrawablePlayer lastName;
		fontSize: 15;
		position: 0 @ size *0.75;
		yourself.
	box := RSBox new
		fromRectangle: label encompassingRectangle;
		extent: label extent + 5;
		color: Color white translucent;
		yourself.
	name := { box. label } asShape.
		
	^ { circle } asShape
		model: aDrawablePlayer asPlayer;
		propertyAt: #drawablePlayer put: aDrawablePlayer;
		add: name;
		yourself
]

{ #category : #hooks }
MatchFieldBuilder >> date [
	^ RSLabel new
		text: (Date fromString: match date);
		color: 'black';
		fontSize: 20;
		yourself
]

{ #category : #'accessing - defaults' }
MatchFieldBuilder >> defaultContainer [
	^ RSCanvas new @ RSCanvasController
]

{ #category : #initialization }
MatchFieldBuilder >> initialize [
	super initialize.
	palette := RSColorPalette diverging rdylbu10.
]

{ #category : #'private - layout' }
MatchFieldBuilder >> layoutPlayers [
	RSHorizontalLineLayout new
		alignMiddle;
		gapSize: 40;
		on: { homePlayers. awayPlayers }.
]

{ #category : #accessing }
MatchFieldBuilder >> match: aMatch [
	match := aMatch
]

{ #category : #hooks }
MatchFieldBuilder >> playersFrom: aString [
	| selector selectorX selectorY |
	selector := aString , '_player_'.
	selectorX := aString , '_player_X'.
	selectorY := aString , '_player_Y'.
	
	^ (1 to: 11) collect: [ :i | | x y |
		x := (selectorX , i asString) asSymbol value: match.
		y := (selectorY , i asString) asSymbol value: match.
		x ifNil: [ x := 0 ].
		y ifNil: [ y := 0 ].
		DrawablePlayer
			id: ((selector , i asString) asSymbol value: match)
			x: x asInteger
			y: y asInteger ]
]

{ #category : #hooks }
MatchFieldBuilder >> renderIn: aCanvas [
	| field r1 title dateLabel |
	homePlayers := self createHomePlayers.
	awayPlayers := self createAwayPlayers.
	field := self soccerField.
	self layoutPlayers.
	aCanvas addAll: homePlayers.
	aCanvas addAll: awayPlayers.
	r1 := aCanvas nodes encompassingRectangle.
	field position: r1 floatCenter.
	field scaleBy: (r1 width / field width) * 1.1.
	title := self title.
	dateLabel := self date.
	r1 width > r1 height ifTrue: [ 
		aCanvas add: field.
		field pushBack
	] ifFalse: [ field := (0@20) asMargin expandRectangle: aCanvas encompassingRectangle. ].
	RSLocation new 
		above; move: title on: field;
		below; move: dateLabel on: field.
	aCanvas addAll: {title. dateLabel}.
	
]

{ #category : #'accessing - defaults' }
MatchFieldBuilder >> soccerField [
	^ RSSVGImporter fromString: self soccerFieldString
]

{ #category : #'accessing - defaults' }
MatchFieldBuilder >> soccerFieldString [
	^ '<?xml version="1.0" encoding="UTF-8" standalone="yes" ?>
<!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1//EN" 
  "http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd">
<svg width="22cm" height="14cm" viewBox="0 0 1150 720" stroke="white" version="1.1"
     xmlns="http://www.w3.org/2000/svg">
     <rect x="0" y="0" width="1150" height="720" fill="#299f1b" />
     <path d="M 575,20 L 50,20 50,700 1100,700 1100,20 575,20 575,700 z" stroke="white" stroke-width="2" fill="#299f1b" />
     <circle cx="575" cy="360" r="91.5" stroke="white" stroke-width="2" fill-opacity="0" />
     <circle cx="575" cy="360" r="2" stroke="white" fill="white" />
     <circle cx="160" cy="360" r="2" stroke="white" fill="white" />
     <circle cx="990" cy="360" r="2" stroke="white" fill="white" />
     <path d="M 50,324.4 L 40,324.4 40, 396.6 50 396.6 z" stroke="white" stroke-width="2" fill-opacity="0" />
     <path d="M 1100,324.4 L 1110,324.4 1110,396.6 1100,396.6 z" stroke="white" stroke-width="2" fill-opacity="0" />
     <path d="M 50,269.4 L 105,269.4 105,451.6 50 451.6 z" stroke="white" stroke-width="2" fill-opacity="0" />
     <path d="M 1100,269.4 L 1045,269.4 1045,451.6 1100,451.6 z" stroke="white" stroke-width="2" fill-opacity="0" />
     <path d="M 50,159.4 L 215,159.4 215,561.6 50 561.6 z" stroke="white" stroke-width="2" fill-opacity="0" />
     <path d="M 1100,159.4 L 935,159.4 935,561.6 1100,561.6 z" stroke="white" stroke-width="2" fill-opacity="0" />
     <path d="M 215,286.875 A 91.5,91.5 0 0,1 215,433.125 z" stroke="white" stroke-width="2" fill="#299f1b" />
     <path d="M 935,286.875 A 91.5,91.5 0 0,0 935,433.125 z" stroke="white" stroke-width="2" fill="#299f1b" />
     <path d="M 50,30 A 10,10 0 0,0 60,20 L 50,20 z" stroke="white" stroke-width="2" fill-opacity="0" />
     <path d="M 60,700 A 10,10 0 0,0 50,690 L 50,700 z" stroke="white" stroke-width="2" fill-opacity="0" />
     <path d="M 1100,690 A 10,10 0 0,0 1090,700 L 1100,700 z" stroke="white" stroke-width="2" fill-opacity="0" />
     <path d="M 1090,20 A 10,10 0 0,0 1100,30 L 1100,20 z" stroke="white" stroke-width="2" fill-opacity="0" />
</svg>'
]

{ #category : #hooks }
MatchFieldBuilder >> title [
	^ RSLabel new
		text: match asString;
		color: 'black';
		fontSize: 20;
		yourself
]
