"
big class look those instance names
"
Class {
	#name : #Match,
	#superclass : #FutbolEntity,
	#instVars : [
		'id',
		'country_id',
		'league_id',
		'season',
		'stage',
		'date',
		'match_api_id',
		'home_team_api_id',
		'away_team_api_id',
		'home_team_goal',
		'away_team_goal',
		'home_player_X1',
		'home_player_X2',
		'home_player_X3',
		'home_player_X4',
		'home_player_X5',
		'home_player_X6',
		'home_player_X7',
		'home_player_X8',
		'home_player_X9',
		'home_player_X10',
		'home_player_X11',
		'away_player_X1',
		'away_player_X2',
		'away_player_X3',
		'away_player_X4',
		'away_player_X5',
		'away_player_X6',
		'away_player_X7',
		'away_player_X8',
		'away_player_X9',
		'away_player_X10',
		'away_player_X11',
		'home_player_Y1',
		'home_player_Y2',
		'home_player_Y3',
		'home_player_Y4',
		'home_player_Y5',
		'home_player_Y6',
		'home_player_Y7',
		'home_player_Y8',
		'home_player_Y9',
		'home_player_Y10',
		'home_player_Y11',
		'away_player_Y1',
		'away_player_Y2',
		'away_player_Y3',
		'away_player_Y4',
		'away_player_Y5',
		'away_player_Y6',
		'away_player_Y7',
		'away_player_Y8',
		'away_player_Y9',
		'away_player_Y10',
		'away_player_Y11',
		'home_player_1',
		'home_player_2',
		'home_player_3',
		'home_player_4',
		'home_player_5',
		'home_player_6',
		'home_player_7',
		'home_player_8',
		'home_player_9',
		'home_player_10',
		'home_player_11',
		'away_player_1',
		'away_player_2',
		'away_player_3',
		'away_player_4',
		'away_player_5',
		'away_player_6',
		'away_player_7',
		'away_player_8',
		'away_player_9',
		'away_player_10',
		'away_player_11',
		'goal',
		'shoton',
		'shotoff',
		'foulcommit',
		'card',
		'cross',
		'corner',
		'possession',
		'B365H',
		'B365D',
		'B365A',
		'BWH',
		'BWD',
		'BWA',
		'IWH',
		'IWD',
		'IWA',
		'LBH',
		'LBD',
		'LBA',
		'PSH',
		'PSD',
		'PSA',
		'WHH',
		'WHD',
		'WHA',
		'SJH',
		'SJD',
		'SJA',
		'VCH',
		'VCD',
		'VCA',
		'GBH',
		'GBD',
		'GBA',
		'BSH',
		'BSD',
		'BSA',
		'dateAndTime',
		'homeName',
		'awayName'
	],
	#category : #'Futbol-Entities'
}

{ #category : #accessing }
Match class >> csvFile [
	^ 'Match_export_2022-04-14_145208.csv'
]

{ #category : #public }
Match class >> reStoreDefinition [
	^ super reStoreDefinition
		defineAsID: #id;
		define: #country_id as: Integer;
		define: #league_id as: Integer;
		define: #season as: (String maxSize: 50);
		define: #stage as: (String maxSize: 50);
		define: #date as: (String maxSize: 50);
		define: #match_api_id as: Integer;
		define: #home_team_api_id as: Integer;
		define: #away_team_api_id as: Integer;
		define: #home_team_goal as: (String maxSize: 50);
		define: #away_team_goal as: (String maxSize: 50);
		define: #home_player_X1 as: (String maxSize: 50);
		define: #home_player_X2 as: (String maxSize: 50);
		define: #home_player_X3 as: (String maxSize: 50);
		define: #home_player_X4 as: (String maxSize: 50);
		define: #home_player_X5 as: (String maxSize: 50);
		define: #home_player_X6 as: (String maxSize: 50);
		define: #home_player_X7 as: (String maxSize: 50);
		define: #home_player_X8 as: (String maxSize: 50);
		define: #home_player_X9 as: (String maxSize: 50);
		define: #home_player_X10 as: (String maxSize: 50);
		define: #home_player_X11 as: (String maxSize: 50);
		define: #away_player_X1 as: (String maxSize: 50);
		define: #away_player_X2 as: (String maxSize: 50);
		define: #away_player_X3 as: (String maxSize: 50);
		define: #away_player_X4 as: (String maxSize: 50);
		define: #away_player_X5 as: (String maxSize: 50);
		define: #away_player_X6 as: (String maxSize: 50);
		define: #away_player_X7 as: (String maxSize: 50);
		define: #away_player_X8 as: (String maxSize: 50);
		define: #away_player_X9 as: (String maxSize: 50);
		define: #away_player_X10 as: (String maxSize: 50);
		define: #away_player_X11 as: (String maxSize: 50);
		define: #home_player_Y1 as: (String maxSize: 50);
		define: #home_player_Y2 as: (String maxSize: 50);
		define: #home_player_Y3 as: (String maxSize: 50);
		define: #home_player_Y4 as: (String maxSize: 50);
		define: #home_player_Y5 as: (String maxSize: 50);
		define: #home_player_Y6 as: (String maxSize: 50);
		define: #home_player_Y7 as: (String maxSize: 50);
		define: #home_player_Y8 as: (String maxSize: 50);
		define: #home_player_Y9 as: (String maxSize: 50);
		define: #home_player_Y10 as: (String maxSize: 50);
		define: #home_player_Y11 as: (String maxSize: 50);
		define: #away_player_Y1 as: (String maxSize: 50);
		define: #away_player_Y2 as: (String maxSize: 50);
		define: #away_player_Y3 as: (String maxSize: 50);
		define: #away_player_Y4 as: (String maxSize: 50);
		define: #away_player_Y5 as: (String maxSize: 50);
		define: #away_player_Y6 as: (String maxSize: 50);
		define: #away_player_Y7 as: (String maxSize: 50);
		define: #away_player_Y8 as: (String maxSize: 50);
		define: #away_player_Y9 as: (String maxSize: 50);
		define: #away_player_Y10 as: (String maxSize: 50);
		define: #away_player_Y11 as: (String maxSize: 50);
		define: #home_player_1 as: (String maxSize: 50);
		define: #home_player_2 as: (String maxSize: 50);
		define: #home_player_3 as: (String maxSize: 50);
		define: #home_player_4 as: (String maxSize: 50);
		define: #home_player_5 as: (String maxSize: 50);
		define: #home_player_6 as: (String maxSize: 50);
		define: #home_player_7 as: (String maxSize: 50);
		define: #home_player_8 as: (String maxSize: 50);
		define: #home_player_9 as: (String maxSize: 50);
		define: #home_player_10 as: (String maxSize: 50);
		define: #home_player_11 as: (String maxSize: 50);
		define: #away_player_1 as: (String maxSize: 50);
		define: #away_player_2 as: (String maxSize: 50);
		define: #away_player_3 as: (String maxSize: 50);
		define: #away_player_4 as: (String maxSize: 50);
		define: #away_player_5 as: (String maxSize: 50);
		define: #away_player_6 as: (String maxSize: 50);
		define: #away_player_7 as: (String maxSize: 50);
		define: #away_player_8 as: (String maxSize: 50);
		define: #away_player_9 as: (String maxSize: 50);
		define: #away_player_10 as: (String maxSize: 50);
		define: #away_player_11 as: (String maxSize: 50);
		define: #goal as: (String maxSize: 50);
		define: #shoton as: (String maxSize: 50);
		define: #shotoff as: (String maxSize: 50);
		define: #foulcommit as: (String maxSize: 50);
		define: #card as: (String maxSize: 50);
		define: #cross as: (String maxSize: 50);
		define: #corner as: (String maxSize: 50);
		define: #possession as: (String maxSize: 50);
		define: #B365H as: (String maxSize: 50);
		define: #B365D as: (String maxSize: 50);
		define: #B365A as: (String maxSize: 50);
		define: #BWH as: (String maxSize: 50);
		define: #BWD as: (String maxSize: 50);
		define: #BWA as: (String maxSize: 50);
		define: #IWH as: (String maxSize: 50);
		define: #IWD as: (String maxSize: 50);
		define: #IWA as: (String maxSize: 50);
		define: #LBH as: (String maxSize: 50);
		define: #LBD as: (String maxSize: 50);
		define: #LBA as: (String maxSize: 50);
		define: #PSH as: (String maxSize: 50);
		define: #PSD as: (String maxSize: 50);
		define: #PSA as: (String maxSize: 50);
		define: #WHH as: (String maxSize: 50);
		define: #WHD as: (String maxSize: 50);
		define: #WHA as: (String maxSize: 50);
		define: #SJH as: (String maxSize: 50);
		define: #SJD as: (String maxSize: 50);
		define: #SJA as: (String maxSize: 50);
		define: #VCH as: (String maxSize: 50);
		define: #VCD as: (String maxSize: 50);
		define: #VCA as: (String maxSize: 50);
		define: #GBH as: (String maxSize: 50);
		define: #GBD as: (String maxSize: 50);
		define: #GBA as: (String maxSize: 50);
		define: #BSH as: (String maxSize: 50);
		define: #BSD as: (String maxSize: 50);
		define: #BSA as: (String maxSize: 50);
		yourself
]

{ #category : #accessing }
Match >> B365A [
	^ B365A
]

{ #category : #accessing }
Match >> B365A: anObject [
	B365A:= anObject
]

{ #category : #accessing }
Match >> B365D [
	^ B365D
]

{ #category : #accessing }
Match >> B365D: anObject [
	B365D:= anObject
]

{ #category : #accessing }
Match >> B365H [
	^ B365H
]

{ #category : #accessing }
Match >> B365H: anObject [
	B365H:= anObject
]

{ #category : #accessing }
Match >> BSA [
	^ BSA
]

{ #category : #accessing }
Match >> BSA: anObject [
	BSA:= anObject
]

{ #category : #accessing }
Match >> BSD [
	^ BSD
]

{ #category : #accessing }
Match >> BSD: anObject [
	BSD:= anObject
]

{ #category : #accessing }
Match >> BSH [
	^ BSH
]

{ #category : #accessing }
Match >> BSH: anObject [
	BSH:= anObject
]

{ #category : #accessing }
Match >> BWA [
	^ BWA
]

{ #category : #accessing }
Match >> BWA: anObject [
	BWA:= anObject
]

{ #category : #accessing }
Match >> BWD [
	^ BWD
]

{ #category : #accessing }
Match >> BWD: anObject [
	BWD:= anObject
]

{ #category : #accessing }
Match >> BWH [
	^ BWH
]

{ #category : #accessing }
Match >> BWH: anObject [
	BWH:= anObject
]

{ #category : #accessing }
Match >> GBA [
	^ GBA
]

{ #category : #accessing }
Match >> GBA: anObject [
	GBA:= anObject
]

{ #category : #accessing }
Match >> GBD [
	^ GBD
]

{ #category : #accessing }
Match >> GBD: anObject [
	GBD:= anObject
]

{ #category : #accessing }
Match >> GBH [
	^ GBH
]

{ #category : #accessing }
Match >> GBH: anObject [
	GBH:= anObject
]

{ #category : #accessing }
Match >> IWA [
	^ IWA
]

{ #category : #accessing }
Match >> IWA: anObject [
	IWA:= anObject
]

{ #category : #accessing }
Match >> IWD [
	^ IWD
]

{ #category : #accessing }
Match >> IWD: anObject [
	IWD:= anObject
]

{ #category : #accessing }
Match >> IWH [
	^ IWH
]

{ #category : #accessing }
Match >> IWH: anObject [
	IWH:= anObject
]

{ #category : #accessing }
Match >> LBA [
	^ LBA
]

{ #category : #accessing }
Match >> LBA: anObject [
	LBA:= anObject
]

{ #category : #accessing }
Match >> LBD [
	^ LBD
]

{ #category : #accessing }
Match >> LBD: anObject [
	LBD:= anObject
]

{ #category : #accessing }
Match >> LBH [
	^ LBH
]

{ #category : #accessing }
Match >> LBH: anObject [
	LBH:= anObject
]

{ #category : #accessing }
Match >> PSA [
	^ PSA
]

{ #category : #accessing }
Match >> PSA: anObject [
	PSA:= anObject
]

{ #category : #accessing }
Match >> PSD [
	^ PSD
]

{ #category : #accessing }
Match >> PSD: anObject [
	PSD:= anObject
]

{ #category : #accessing }
Match >> PSH [
	^ PSH
]

{ #category : #accessing }
Match >> PSH: anObject [
	PSH:= anObject
]

{ #category : #accessing }
Match >> SJA [
	^ SJA
]

{ #category : #accessing }
Match >> SJA: anObject [
	SJA:= anObject
]

{ #category : #accessing }
Match >> SJD [
	^ SJD
]

{ #category : #accessing }
Match >> SJD: anObject [
	SJD:= anObject
]

{ #category : #accessing }
Match >> SJH [
	^ SJH
]

{ #category : #accessing }
Match >> SJH: anObject [
	SJH:= anObject
]

{ #category : #accessing }
Match >> VCA [
	^ VCA
]

{ #category : #accessing }
Match >> VCA: anObject [
	VCA:= anObject
]

{ #category : #accessing }
Match >> VCD [
	^ VCD
]

{ #category : #accessing }
Match >> VCD: anObject [
	VCD:= anObject
]

{ #category : #accessing }
Match >> VCH [
	^ VCH
]

{ #category : #accessing }
Match >> VCH: anObject [
	VCH:= anObject
]

{ #category : #accessing }
Match >> WHA [
	^ WHA
]

{ #category : #accessing }
Match >> WHA: anObject [
	WHA:= anObject
]

{ #category : #accessing }
Match >> WHD [
	^ WHD
]

{ #category : #accessing }
Match >> WHD: anObject [
	WHD:= anObject
]

{ #category : #accessing }
Match >> WHH [
	^ WHH
]

{ #category : #accessing }
Match >> WHH: anObject [
	WHH:= anObject
]

{ #category : #'accessing - computed' }
Match >> awayName [
	^ awayName ifNil: [ awayName := self teamName: away_team_api_id ] 
]

{ #category : #'accessing - computed' }
Match >> awayName: aString [
	awayName := aString
]

{ #category : #accessing }
Match >> away_player_1 [
	^ away_player_1
]

{ #category : #accessing }
Match >> away_player_10 [
	^ away_player_10
]

{ #category : #accessing }
Match >> away_player_10: anObject [
	away_player_10:= anObject
]

{ #category : #accessing }
Match >> away_player_11 [
	^ away_player_11
]

{ #category : #accessing }
Match >> away_player_11: anObject [
	away_player_11:= anObject
]

{ #category : #accessing }
Match >> away_player_1: anObject [
	away_player_1:= anObject
]

{ #category : #accessing }
Match >> away_player_2 [
	^ away_player_2
]

{ #category : #accessing }
Match >> away_player_2: anObject [
	away_player_2:= anObject
]

{ #category : #accessing }
Match >> away_player_3 [
	^ away_player_3
]

{ #category : #accessing }
Match >> away_player_3: anObject [
	away_player_3:= anObject
]

{ #category : #accessing }
Match >> away_player_4 [
	^ away_player_4
]

{ #category : #accessing }
Match >> away_player_4: anObject [
	away_player_4:= anObject
]

{ #category : #accessing }
Match >> away_player_5 [
	^ away_player_5
]

{ #category : #accessing }
Match >> away_player_5: anObject [
	away_player_5:= anObject
]

{ #category : #accessing }
Match >> away_player_6 [
	^ away_player_6
]

{ #category : #accessing }
Match >> away_player_6: anObject [
	away_player_6:= anObject
]

{ #category : #accessing }
Match >> away_player_7 [
	^ away_player_7
]

{ #category : #accessing }
Match >> away_player_7: anObject [
	away_player_7:= anObject
]

{ #category : #accessing }
Match >> away_player_8 [
	^ away_player_8
]

{ #category : #accessing }
Match >> away_player_8: anObject [
	away_player_8:= anObject
]

{ #category : #accessing }
Match >> away_player_9 [
	^ away_player_9
]

{ #category : #accessing }
Match >> away_player_9: anObject [
	away_player_9:= anObject
]

{ #category : #accessing }
Match >> away_player_X1 [
	^ away_player_X1
]

{ #category : #accessing }
Match >> away_player_X10 [
	^ away_player_X10
]

{ #category : #accessing }
Match >> away_player_X10: anObject [
	away_player_X10:= anObject
]

{ #category : #accessing }
Match >> away_player_X11 [
	^ away_player_X11
]

{ #category : #accessing }
Match >> away_player_X11: anObject [
	away_player_X11:= anObject
]

{ #category : #accessing }
Match >> away_player_X1: anObject [
	away_player_X1:= anObject
]

{ #category : #accessing }
Match >> away_player_X2 [
	^ away_player_X2
]

{ #category : #accessing }
Match >> away_player_X2: anObject [
	away_player_X2:= anObject
]

{ #category : #accessing }
Match >> away_player_X3 [
	^ away_player_X3
]

{ #category : #accessing }
Match >> away_player_X3: anObject [
	away_player_X3:= anObject
]

{ #category : #accessing }
Match >> away_player_X4 [
	^ away_player_X4
]

{ #category : #accessing }
Match >> away_player_X4: anObject [
	away_player_X4:= anObject
]

{ #category : #accessing }
Match >> away_player_X5 [
	^ away_player_X5
]

{ #category : #accessing }
Match >> away_player_X5: anObject [
	away_player_X5:= anObject
]

{ #category : #accessing }
Match >> away_player_X6 [
	^ away_player_X6
]

{ #category : #accessing }
Match >> away_player_X6: anObject [
	away_player_X6:= anObject
]

{ #category : #accessing }
Match >> away_player_X7 [
	^ away_player_X7
]

{ #category : #accessing }
Match >> away_player_X7: anObject [
	away_player_X7:= anObject
]

{ #category : #accessing }
Match >> away_player_X8 [
	^ away_player_X8
]

{ #category : #accessing }
Match >> away_player_X8: anObject [
	away_player_X8:= anObject
]

{ #category : #accessing }
Match >> away_player_X9 [
	^ away_player_X9
]

{ #category : #accessing }
Match >> away_player_X9: anObject [
	away_player_X9:= anObject
]

{ #category : #accessing }
Match >> away_player_Y1 [
	^ away_player_Y1
]

{ #category : #accessing }
Match >> away_player_Y10 [
	^ away_player_Y10
]

{ #category : #accessing }
Match >> away_player_Y10: anObject [
	away_player_Y10:= anObject
]

{ #category : #accessing }
Match >> away_player_Y11 [
	^ away_player_Y11
]

{ #category : #accessing }
Match >> away_player_Y11: anObject [
	away_player_Y11:= anObject
]

{ #category : #accessing }
Match >> away_player_Y1: anObject [
	away_player_Y1:= anObject
]

{ #category : #accessing }
Match >> away_player_Y2 [
	^ away_player_Y2
]

{ #category : #accessing }
Match >> away_player_Y2: anObject [
	away_player_Y2:= anObject
]

{ #category : #accessing }
Match >> away_player_Y3 [
	^ away_player_Y3
]

{ #category : #accessing }
Match >> away_player_Y3: anObject [
	away_player_Y3:= anObject
]

{ #category : #accessing }
Match >> away_player_Y4 [
	^ away_player_Y4
]

{ #category : #accessing }
Match >> away_player_Y4: anObject [
	away_player_Y4:= anObject
]

{ #category : #accessing }
Match >> away_player_Y5 [
	^ away_player_Y5
]

{ #category : #accessing }
Match >> away_player_Y5: anObject [
	away_player_Y5:= anObject
]

{ #category : #accessing }
Match >> away_player_Y6 [
	^ away_player_Y6
]

{ #category : #accessing }
Match >> away_player_Y6: anObject [
	away_player_Y6:= anObject
]

{ #category : #accessing }
Match >> away_player_Y7 [
	^ away_player_Y7
]

{ #category : #accessing }
Match >> away_player_Y7: anObject [
	away_player_Y7:= anObject
]

{ #category : #accessing }
Match >> away_player_Y8 [
	^ away_player_Y8
]

{ #category : #accessing }
Match >> away_player_Y8: anObject [
	away_player_Y8:= anObject
]

{ #category : #accessing }
Match >> away_player_Y9 [
	^ away_player_Y9
]

{ #category : #accessing }
Match >> away_player_Y9: anObject [
	away_player_Y9:= anObject
]

{ #category : #accessing }
Match >> away_team_api_id [
	^ away_team_api_id
]

{ #category : #accessing }
Match >> away_team_api_id: anObject [
	away_team_api_id:= anObject
]

{ #category : #accessing }
Match >> away_team_goal [
	^ away_team_goal
]

{ #category : #accessing }
Match >> away_team_goal: anObject [
	away_team_goal:= anObject
]

{ #category : #accessing }
Match >> card [
	^ card
]

{ #category : #accessing }
Match >> card: anObject [
	card:= anObject
]

{ #category : #accessing }
Match >> corner [
	^ corner
]

{ #category : #accessing }
Match >> corner: anObject [
	corner:= anObject
]

{ #category : #accessing }
Match >> country_id [
	^ country_id
]

{ #category : #accessing }
Match >> country_id: anObject [
	country_id:= anObject
]

{ #category : #inspector }
Match >> createAwayPlayersPalette: palette [
	| awayPlayers shapes layers |
	awayPlayers := self playersFrom: 'away'.
	shapes := awayPlayers collect: [ :player | 
		(self createPlayerShapeFor: player) 
			in: [ :shape |
				shape children first color: palette range nextToLast.
				shape position: (shape position x negated + (30*25) ) @ shape position y ]
			yourself ] as: RSGroup.
	
	layers := shapes groupedBy: [ :shape | (shape propertyAt: #drawablePlayer) y ].
	layers do: [ :group | 
		RSVerticalLineLayout new
			gapSize: 20;
			on: group ].
	RSHorizontalLineLayout new
		alignMiddle;
		gapSize: 40;
		on: (layers values reverse collect: [:group | group asGroup ]).
	^ shapes	
]

{ #category : #inspector }
Match >> createHomePlayersPalette: palette [
	| homePlayers shapes layers |
	homePlayers := self playersFrom: 'home'.
	shapes := homePlayers collect: [ :player | 
		(self createPlayerShapeFor: player) 
			in: [ :shape |
				shape children first color: palette range second.
				shape position: shape position x @ shape position y ]
			yourself ] as: RSGroup.
	layers := shapes groupedBy: [ :shape | (shape propertyAt: #drawablePlayer) y ].
	layers do: [ :group | 
		RSVerticalLineLayout new
			gapSize: 20;
			on: group reverse ].
	RSHorizontalLineLayout new
		alignMiddle;
		gapSize: 40;
		on: (layers values collect: [:group | group asGroup ]).
	^ shapes
]

{ #category : #inspector }
Match >> createPlayerShapeFor: aDrawablePlayer [
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

{ #category : #inspector }
Match >> createPlayersCanvas [
	| canvas homePlayers awayPlayers palette field r1 title dateLabel |
	
	palette := RSColorPalette diverging rdylbu10.
	homePlayers := self createHomePlayersPalette: palette.
	awayPlayers := self createAwayPlayersPalette: palette.
	
	canvas := RSCanvas new.
	field := self soccerField.
	
	canvas @ RSCanvasController.
	
	RSHorizontalLineLayout new
		alignMiddle;
		gapSize: 40;
		on: { homePlayers. awayPlayers }.
	canvas addAll: homePlayers.
	canvas addAll: awayPlayers.
	r1 := canvas nodes encompassingRectangle.
	
	field position: r1 floatCenter.
	field scaleBy: (r1 width / field width) * 1.1.
	
	title := RSLabel new
		text: self asString;
		color: 'black';
		fontSize: 20;
		yourself.
	dateLabel := RSLabel new
		text: (Date fromString: self date);
		color: 'black';
		fontSize: 20;
		yourself.
	r1 width > r1 height ifTrue: [ 
		canvas add: field.
		field pushBack
	] ifFalse: [ field := (0@20) asMargin expandRectangle: canvas encompassingRectangle. ].
	RSLocation new above; move: title on: field.
	RSLocation new below; move: dateLabel on: field.
	canvas addAll: {title. dateLabel}.
	^ canvas
]

{ #category : #accessing }
Match >> cross [
	^ cross
]

{ #category : #accessing }
Match >> cross: anObject [
	cross:= anObject
]

{ #category : #accessing }
Match >> date [
	^ date
]

{ #category : #accessing }
Match >> date: anObject [
	date:= anObject
]

{ #category : #'accessing - computed' }
Match >> dateAndTime [
	^ dateAndTime ifNil: [ dateAndTime := DateAndTime fromString: self date ]
]

{ #category : #accessing }
Match >> foulcommit [
	^ foulcommit
]

{ #category : #accessing }
Match >> foulcommit: anObject [
	foulcommit:= anObject
]

{ #category : #accessing }
Match >> goal [
	^ goal
]

{ #category : #accessing }
Match >> goal: anObject [
	goal:= anObject
]

{ #category : #'accessing - computed' }
Match >> homeName [
	^ homeName ifNil: [ homeName := self teamName: home_team_api_id ] 
]

{ #category : #'accessing - computed' }
Match >> homeName: aString [
	homeName := aString
]

{ #category : #accessing }
Match >> home_player_1 [
	^ home_player_1
]

{ #category : #accessing }
Match >> home_player_10 [
	^ home_player_10
]

{ #category : #accessing }
Match >> home_player_10: anObject [
	home_player_10:= anObject
]

{ #category : #accessing }
Match >> home_player_11 [
	^ home_player_11
]

{ #category : #accessing }
Match >> home_player_11: anObject [
	home_player_11:= anObject
]

{ #category : #accessing }
Match >> home_player_1: anObject [
	home_player_1:= anObject
]

{ #category : #accessing }
Match >> home_player_2 [
	^ home_player_2
]

{ #category : #accessing }
Match >> home_player_2: anObject [
	home_player_2:= anObject
]

{ #category : #accessing }
Match >> home_player_3 [
	^ home_player_3
]

{ #category : #accessing }
Match >> home_player_3: anObject [
	home_player_3:= anObject
]

{ #category : #accessing }
Match >> home_player_4 [
	^ home_player_4
]

{ #category : #accessing }
Match >> home_player_4: anObject [
	home_player_4:= anObject
]

{ #category : #accessing }
Match >> home_player_5 [
	^ home_player_5
]

{ #category : #accessing }
Match >> home_player_5: anObject [
	home_player_5:= anObject
]

{ #category : #accessing }
Match >> home_player_6 [
	^ home_player_6
]

{ #category : #accessing }
Match >> home_player_6: anObject [
	home_player_6:= anObject
]

{ #category : #accessing }
Match >> home_player_7 [
	^ home_player_7
]

{ #category : #accessing }
Match >> home_player_7: anObject [
	home_player_7:= anObject
]

{ #category : #accessing }
Match >> home_player_8 [
	^ home_player_8
]

{ #category : #accessing }
Match >> home_player_8: anObject [
	home_player_8:= anObject
]

{ #category : #accessing }
Match >> home_player_9 [
	^ home_player_9
]

{ #category : #accessing }
Match >> home_player_9: anObject [
	home_player_9:= anObject
]

{ #category : #accessing }
Match >> home_player_X1 [
	^ home_player_X1
]

{ #category : #accessing }
Match >> home_player_X10 [
	^ home_player_X10
]

{ #category : #accessing }
Match >> home_player_X10: anObject [
	home_player_X10:= anObject
]

{ #category : #accessing }
Match >> home_player_X11 [
	^ home_player_X11
]

{ #category : #accessing }
Match >> home_player_X11: anObject [
	home_player_X11:= anObject
]

{ #category : #accessing }
Match >> home_player_X1: anObject [
	home_player_X1:= anObject
]

{ #category : #accessing }
Match >> home_player_X2 [
	^ home_player_X2
]

{ #category : #accessing }
Match >> home_player_X2: anObject [
	home_player_X2:= anObject
]

{ #category : #accessing }
Match >> home_player_X3 [
	^ home_player_X3
]

{ #category : #accessing }
Match >> home_player_X3: anObject [
	home_player_X3:= anObject
]

{ #category : #accessing }
Match >> home_player_X4 [
	^ home_player_X4
]

{ #category : #accessing }
Match >> home_player_X4: anObject [
	home_player_X4:= anObject
]

{ #category : #accessing }
Match >> home_player_X5 [
	^ home_player_X5
]

{ #category : #accessing }
Match >> home_player_X5: anObject [
	home_player_X5:= anObject
]

{ #category : #accessing }
Match >> home_player_X6 [
	^ home_player_X6
]

{ #category : #accessing }
Match >> home_player_X6: anObject [
	home_player_X6:= anObject
]

{ #category : #accessing }
Match >> home_player_X7 [
	^ home_player_X7
]

{ #category : #accessing }
Match >> home_player_X7: anObject [
	home_player_X7:= anObject
]

{ #category : #accessing }
Match >> home_player_X8 [
	^ home_player_X8
]

{ #category : #accessing }
Match >> home_player_X8: anObject [
	home_player_X8:= anObject
]

{ #category : #accessing }
Match >> home_player_X9 [
	^ home_player_X9
]

{ #category : #accessing }
Match >> home_player_X9: anObject [
	home_player_X9:= anObject
]

{ #category : #accessing }
Match >> home_player_Y1 [
	^ home_player_Y1
]

{ #category : #accessing }
Match >> home_player_Y10 [
	^ home_player_Y10
]

{ #category : #accessing }
Match >> home_player_Y10: anObject [
	home_player_Y10:= anObject
]

{ #category : #accessing }
Match >> home_player_Y11 [
	^ home_player_Y11
]

{ #category : #accessing }
Match >> home_player_Y11: anObject [
	home_player_Y11:= anObject
]

{ #category : #accessing }
Match >> home_player_Y1: anObject [
	home_player_Y1:= anObject
]

{ #category : #accessing }
Match >> home_player_Y2 [
	^ home_player_Y2
]

{ #category : #accessing }
Match >> home_player_Y2: anObject [
	home_player_Y2:= anObject
]

{ #category : #accessing }
Match >> home_player_Y3 [
	^ home_player_Y3
]

{ #category : #accessing }
Match >> home_player_Y3: anObject [
	home_player_Y3:= anObject
]

{ #category : #accessing }
Match >> home_player_Y4 [
	^ home_player_Y4
]

{ #category : #accessing }
Match >> home_player_Y4: anObject [
	home_player_Y4:= anObject
]

{ #category : #accessing }
Match >> home_player_Y5 [
	^ home_player_Y5
]

{ #category : #accessing }
Match >> home_player_Y5: anObject [
	home_player_Y5:= anObject
]

{ #category : #accessing }
Match >> home_player_Y6 [
	^ home_player_Y6
]

{ #category : #accessing }
Match >> home_player_Y6: anObject [
	home_player_Y6:= anObject
]

{ #category : #accessing }
Match >> home_player_Y7 [
	^ home_player_Y7
]

{ #category : #accessing }
Match >> home_player_Y7: anObject [
	home_player_Y7:= anObject
]

{ #category : #accessing }
Match >> home_player_Y8 [
	^ home_player_Y8
]

{ #category : #accessing }
Match >> home_player_Y8: anObject [
	home_player_Y8:= anObject
]

{ #category : #accessing }
Match >> home_player_Y9 [
	^ home_player_Y9
]

{ #category : #accessing }
Match >> home_player_Y9: anObject [
	home_player_Y9:= anObject
]

{ #category : #accessing }
Match >> home_team_api_id [
	^ home_team_api_id
]

{ #category : #accessing }
Match >> home_team_api_id: anObject [
	home_team_api_id:= anObject
]

{ #category : #accessing }
Match >> home_team_goal [
	^ home_team_goal
]

{ #category : #accessing }
Match >> home_team_goal: anObject [
	home_team_goal:= anObject
]

{ #category : #accessing }
Match >> id [
	^ id
]

{ #category : #accessing }
Match >> id: anObject [
	id:= anObject
]

{ #category : #inspector }
Match >> inspectorPlayerCanvas [
	<inspectorPresentationOrder: 90 title: 'Players'>
	
	^ SpRoassal3InspectorPresenter new
		canvas: self createPlayersCanvas;
		yourself
]

{ #category : #inspector }
Match >> inspectorPlayerCanvasContext: aContext [

	aContext withoutEvaluator
]

{ #category : #accessing }
Match >> league_id [
	^ league_id
]

{ #category : #accessing }
Match >> league_id: anObject [
	league_id:= anObject
]

{ #category : #accessing }
Match >> match_api_id [
	^ match_api_id
]

{ #category : #accessing }
Match >> match_api_id: anObject [
	match_api_id:= anObject
]

{ #category : #inspector }
Match >> playersFrom: aString [

	| selector selectorX selectorY |
	selector := aString , '_player_'.
	selectorX := aString , '_player_X'.
	selectorY := aString , '_player_Y'.
	
	^ (1 to: 11) collect: [ :i | | x y |
		x := (selectorX , i asString) asSymbol value: self.
		y := (selectorY , i asString) asSymbol value: self.
		x ifNil: [ x := 0 ].
		y ifNil: [ y := 0 ].
		DrawablePlayer
			id: ((selector , i asString) asSymbol value: self)
			x: x asInteger
			y: y asInteger ]
]

{ #category : #accessing }
Match >> possession [
	^ possession
]

{ #category : #accessing }
Match >> possession: anObject [
	possession:= anObject
]

{ #category : #printing }
Match >> printOn: stream [
	stream 
		<< self homeName asString
		<< ' - '
		<< self awayName asString
		<< ' ('
		<< home_team_goal asString
		<< ' - ' 
		<< away_team_goal asString
		<< ')'
]

{ #category : #accessing }
Match >> season [
	^ season
]

{ #category : #accessing }
Match >> season: anObject [
	season:= anObject
]

{ #category : #accessing }
Match >> shotoff [
	^ shotoff
]

{ #category : #accessing }
Match >> shotoff: anObject [
	shotoff:= anObject
]

{ #category : #accessing }
Match >> shoton [
	^ shoton
]

{ #category : #accessing }
Match >> shoton: anObject [
	shoton:= anObject
]

{ #category : #inspector }
Match >> soccerField [
	^ RSSVGImporter fromString: self soccerFieldString
]

{ #category : #inspector }
Match >> soccerFieldString [
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

{ #category : #accessing }
Match >> stage [
	^ stage
]

{ #category : #accessing }
Match >> stage: anObject [
	stage:= anObject
]

{ #category : #utilities }
Match >> teamName: teamId [
	^ ESL databaseDo: [ 
		((Team storedInstances satisfying: [ :team | team team_api_id = teamId ])
			collect: [ :team | team team_long_name ]) first ]
]
