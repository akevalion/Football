"
Extented attributes of a football team
"
Class {
	#name : #TeamAttributes,
	#superclass : #FutbolEntity,
	#instVars : [
		'id',
		'team_fifa_api_id',
		'team_api_id',
		'date',
		'buildUpPlaySpeed',
		'buildUpPlaySpeedClass',
		'buildUpPlayDribbling',
		'buildUpPlayDribblingClass',
		'buildUpPlayPassing',
		'buildUpPlayPassingClass',
		'buildUpPlayPositioningClass',
		'chanceCreationPassing',
		'chanceCreationPassingClass',
		'chanceCreationCrossing',
		'chanceCreationCrossingClass',
		'chanceCreationShooting',
		'chanceCreationShootingClass',
		'chanceCreationPositioningClass',
		'defencePressure',
		'defencePressureClass',
		'defenceAggression',
		'defenceAggressionClass',
		'defenceTeamWidth',
		'defenceTeamWidthClass',
		'defenceDefenderLineClass'
	],
	#category : #'Futbol-Entities'
}

{ #category : #accessing }
TeamAttributes class >> csvFile [
	^ 'Team_Attributes_export_2022-04-14_145804.csv'
]

{ #category : #public }
TeamAttributes class >> reStoreDefinition [
	^ super reStoreDefinition
		defineAsID: #id;
		define: #team_fifa_api_id as: Integer;
		define: #team_api_id as: Integer;
		define: #date as: (String maxSize: 100);
		define: #buildUpPlaySpeed as: (String maxSize: 100);
		define: #buildUpPlaySpeedClass as: (String maxSize: 100);
		define: #buildUpPlayDribbling as: (String maxSize: 100);
		define: #buildUpPlayDribblingClass as: (String maxSize: 100);
		define: #buildUpPlayPassing as: (String maxSize: 100);
		define: #buildUpPlayPassingClass as: (String maxSize: 100);
		define: #buildUpPlayPositioningClass as: (String maxSize: 100);
		define: #chanceCreationPassing as: (String maxSize: 100);
		define: #chanceCreationPassingClass as: (String maxSize: 100);
		define: #chanceCreationCrossing as: (String maxSize: 100);
		define: #chanceCreationCrossingClass as: (String maxSize: 100);
		define: #chanceCreationShooting as: (String maxSize: 100);
		define: #chanceCreationShootingClass as: (String maxSize: 100);
		define: #chanceCreationPositioningClass as: (String maxSize: 100);
		define: #defencePressure as: (String maxSize: 100);
		define: #defencePressureClass as: (String maxSize: 100);
		define: #defenceAggression as: (String maxSize: 100);
		define: #defenceAggressionClass as: (String maxSize: 100);
		define: #defenceTeamWidth as: (String maxSize: 100);
		define: #defenceTeamWidthClass as: (String maxSize: 100);
		define: #defenceDefenderLineClass as: (String maxSize: 100);
		yourself

]

{ #category : #accessing }
TeamAttributes >> buildUpPlayDribbling [
	^ buildUpPlayDribbling
]

{ #category : #accessing }
TeamAttributes >> buildUpPlayDribbling: anObject [
	buildUpPlayDribbling:= anObject
]

{ #category : #accessing }
TeamAttributes >> buildUpPlayDribblingClass [
	^ buildUpPlayDribblingClass
]

{ #category : #accessing }
TeamAttributes >> buildUpPlayDribblingClass: anObject [
	buildUpPlayDribblingClass:= anObject
]

{ #category : #accessing }
TeamAttributes >> buildUpPlayPassing [
	^ buildUpPlayPassing
]

{ #category : #accessing }
TeamAttributes >> buildUpPlayPassing: anObject [
	buildUpPlayPassing:= anObject
]

{ #category : #accessing }
TeamAttributes >> buildUpPlayPassingClass [
	^ buildUpPlayPassingClass
]

{ #category : #accessing }
TeamAttributes >> buildUpPlayPassingClass: anObject [
	buildUpPlayPassingClass:= anObject
]

{ #category : #accessing }
TeamAttributes >> buildUpPlayPositioningClass [
	^ buildUpPlayPositioningClass
]

{ #category : #accessing }
TeamAttributes >> buildUpPlayPositioningClass: anObject [
	buildUpPlayPositioningClass:= anObject
]

{ #category : #accessing }
TeamAttributes >> buildUpPlaySpeed [
	^ buildUpPlaySpeed
]

{ #category : #accessing }
TeamAttributes >> buildUpPlaySpeed: anObject [
	buildUpPlaySpeed:= anObject
]

{ #category : #accessing }
TeamAttributes >> buildUpPlaySpeedClass [
	^ buildUpPlaySpeedClass
]

{ #category : #accessing }
TeamAttributes >> buildUpPlaySpeedClass: anObject [
	buildUpPlaySpeedClass:= anObject
]

{ #category : #accessing }
TeamAttributes >> chanceCreationCrossing [
	^ chanceCreationCrossing
]

{ #category : #accessing }
TeamAttributes >> chanceCreationCrossing: anObject [
	chanceCreationCrossing:= anObject
]

{ #category : #accessing }
TeamAttributes >> chanceCreationCrossingClass [
	^ chanceCreationCrossingClass
]

{ #category : #accessing }
TeamAttributes >> chanceCreationCrossingClass: anObject [
	chanceCreationCrossingClass:= anObject
]

{ #category : #accessing }
TeamAttributes >> chanceCreationPassing [
	^ chanceCreationPassing
]

{ #category : #accessing }
TeamAttributes >> chanceCreationPassing: anObject [
	chanceCreationPassing:= anObject
]

{ #category : #accessing }
TeamAttributes >> chanceCreationPassingClass [
	^ chanceCreationPassingClass
]

{ #category : #accessing }
TeamAttributes >> chanceCreationPassingClass: anObject [
	chanceCreationPassingClass:= anObject
]

{ #category : #accessing }
TeamAttributes >> chanceCreationPositioningClass [
	^ chanceCreationPositioningClass
]

{ #category : #accessing }
TeamAttributes >> chanceCreationPositioningClass: anObject [
	chanceCreationPositioningClass:= anObject
]

{ #category : #accessing }
TeamAttributes >> chanceCreationShooting [
	^ chanceCreationShooting
]

{ #category : #accessing }
TeamAttributes >> chanceCreationShooting: anObject [
	chanceCreationShooting:= anObject
]

{ #category : #accessing }
TeamAttributes >> chanceCreationShootingClass [
	^ chanceCreationShootingClass
]

{ #category : #accessing }
TeamAttributes >> chanceCreationShootingClass: anObject [
	chanceCreationShootingClass:= anObject
]

{ #category : #accessing }
TeamAttributes >> date [
	^ date
]

{ #category : #accessing }
TeamAttributes >> date: anObject [
	date:= anObject
]

{ #category : #accessing }
TeamAttributes >> defenceAggression [
	^ defenceAggression
]

{ #category : #accessing }
TeamAttributes >> defenceAggression: anObject [
	defenceAggression:= anObject
]

{ #category : #accessing }
TeamAttributes >> defenceAggressionClass [
	^ defenceAggressionClass
]

{ #category : #accessing }
TeamAttributes >> defenceAggressionClass: anObject [
	defenceAggressionClass:= anObject
]

{ #category : #accessing }
TeamAttributes >> defenceDefenderLineClass [
	^ defenceDefenderLineClass
]

{ #category : #accessing }
TeamAttributes >> defenceDefenderLineClass: anObject [
	defenceDefenderLineClass:= anObject
]

{ #category : #accessing }
TeamAttributes >> defencePressure [
	^ defencePressure
]

{ #category : #accessing }
TeamAttributes >> defencePressure: anObject [
	defencePressure:= anObject
]

{ #category : #accessing }
TeamAttributes >> defencePressureClass [
	^ defencePressureClass
]

{ #category : #accessing }
TeamAttributes >> defencePressureClass: anObject [
	defencePressureClass:= anObject
]

{ #category : #accessing }
TeamAttributes >> defenceTeamWidth [
	^ defenceTeamWidth
]

{ #category : #accessing }
TeamAttributes >> defenceTeamWidth: anObject [
	defenceTeamWidth:= anObject
]

{ #category : #accessing }
TeamAttributes >> defenceTeamWidthClass [
	^ defenceTeamWidthClass
]

{ #category : #accessing }
TeamAttributes >> defenceTeamWidthClass: anObject [
	defenceTeamWidthClass:= anObject
]

{ #category : #accessing }
TeamAttributes >> id [
	^ id
]

{ #category : #accessing }
TeamAttributes >> id: anObject [
	id:= anObject
]

{ #category : #accessing }
TeamAttributes >> team_api_id [
	^ team_api_id
]

{ #category : #accessing }
TeamAttributes >> team_api_id: anObject [
	team_api_id:= anObject
]

{ #category : #accessing }
TeamAttributes >> team_fifa_api_id [
	^ team_fifa_api_id
]

{ #category : #accessing }
TeamAttributes >> team_fifa_api_id: anObject [
	team_fifa_api_id:= anObject
]
