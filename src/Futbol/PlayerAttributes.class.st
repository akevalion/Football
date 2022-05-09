"
same as team attributes
"
Class {
	#name : #PlayerAttributes,
	#superclass : #FutbolEntity,
	#instVars : [
		'id',
		'player_fifa_api_id',
		'player_api_id',
		'date',
		'overall_rating',
		'potential',
		'preferred_foot',
		'attacking_work_rate',
		'defensive_work_rate',
		'crossing',
		'finishing',
		'heading_accuracy',
		'short_passing',
		'volleys',
		'dribbling',
		'curve',
		'free_kick_accuracy',
		'long_passing',
		'ball_control',
		'acceleration',
		'sprint_speed',
		'agility',
		'reactions',
		'balance',
		'shot_power',
		'jumping',
		'stamina',
		'strength',
		'long_shots',
		'aggression',
		'interceptions',
		'positioning',
		'vision',
		'penalties',
		'marking',
		'standing_tackle',
		'sliding_tackle',
		'gk_diving',
		'gk_handling',
		'gk_kicking',
		'gk_positioning',
		'gk_reflexes'
	],
	#category : #Futbol
}

{ #category : #accessing }
PlayerAttributes class >> csvFile [
	^ 'Player_Attributes_export_2022-04-14_145751.csv'
]

{ #category : #public }
PlayerAttributes class >> reStoreDefinition [
	^ super reStoreDefinition
		defineAsID: #id;
		define: #player_fifa_api_id as: Integer;
		define: #player_api_id as: Integer;
		define: #date as: (String maxSize: 100);
		define: #overall_rating as: (String maxSize: 100);
		define: #potential as: (String maxSize: 100);
		define: #preferred_foot as: (String maxSize: 100);
		define: #attacking_work_rate as: (String maxSize: 100);
		define: #defensive_work_rate as: (String maxSize: 100);
		define: #crossing as: (String maxSize: 100);
		define: #finishing as: (String maxSize: 100);
		define: #heading_accuracy as: (String maxSize: 100);
		define: #short_passing as: (String maxSize: 100);
		define: #volleys as: (String maxSize: 100);
		define: #dribbling as: (String maxSize: 100);
		define: #curve as: (String maxSize: 100);
		define: #free_kick_accuracy as: (String maxSize: 100);
		define: #long_passing as: (String maxSize: 100);
		define: #ball_control as: (String maxSize: 100);
		define: #acceleration as: (String maxSize: 100);
		define: #sprint_speed as: (String maxSize: 100);
		define: #agility as: (String maxSize: 100);
		define: #reactions as: (String maxSize: 100);
		define: #balance as: (String maxSize: 100);
		define: #shot_power as: (String maxSize: 100);
		define: #jumping as: (String maxSize: 100);
		define: #stamina as: (String maxSize: 100);
		define: #strength as: (String maxSize: 100);
		define: #long_shots as: (String maxSize: 100);
		define: #aggression as: (String maxSize: 100);
		define: #interceptions as: (String maxSize: 100);
		define: #positioning as: (String maxSize: 100);
		define: #vision as: (String maxSize: 100);
		define: #penalties as: (String maxSize: 100);
		define: #marking as: (String maxSize: 100);
		define: #standing_tackle as: (String maxSize: 100);
		define: #sliding_tackle as: (String maxSize: 100);
		define: #gk_diving as: (String maxSize: 100);
		define: #gk_handling as: (String maxSize: 100);
		define: #gk_kicking as: (String maxSize: 100);
		define: #gk_positioning as: (String maxSize: 100);
		define: #gk_reflexes as: (String maxSize: 100);
		yourself

]

{ #category : #accessing }
PlayerAttributes >> acceleration [
	^ acceleration
]

{ #category : #accessing }
PlayerAttributes >> acceleration: anObject [
	acceleration:= anObject
]

{ #category : #accessing }
PlayerAttributes >> aggression [
	^ aggression
]

{ #category : #accessing }
PlayerAttributes >> aggression: anObject [
	aggression:= anObject
]

{ #category : #accessing }
PlayerAttributes >> agility [
	^ agility
]

{ #category : #accessing }
PlayerAttributes >> agility: anObject [
	agility:= anObject
]

{ #category : #accessing }
PlayerAttributes >> attacking_work_rate [
	^ attacking_work_rate
]

{ #category : #accessing }
PlayerAttributes >> attacking_work_rate: anObject [
	attacking_work_rate:= anObject
]

{ #category : #accessing }
PlayerAttributes >> balance [
	^ balance
]

{ #category : #accessing }
PlayerAttributes >> balance: anObject [
	balance:= anObject
]

{ #category : #accessing }
PlayerAttributes >> ball_control [
	^ ball_control
]

{ #category : #accessing }
PlayerAttributes >> ball_control: anObject [
	ball_control:= anObject
]

{ #category : #accessing }
PlayerAttributes >> crossing [
	^ crossing
]

{ #category : #accessing }
PlayerAttributes >> crossing: anObject [
	crossing:= anObject
]

{ #category : #accessing }
PlayerAttributes >> curve [
	^ curve
]

{ #category : #accessing }
PlayerAttributes >> curve: anObject [
	curve:= anObject
]

{ #category : #accessing }
PlayerAttributes >> date [
	^ date
]

{ #category : #accessing }
PlayerAttributes >> date: anObject [
	date:= anObject
]

{ #category : #accessing }
PlayerAttributes >> defensive_work_rate [
	^ defensive_work_rate
]

{ #category : #accessing }
PlayerAttributes >> defensive_work_rate: anObject [
	defensive_work_rate:= anObject
]

{ #category : #accessing }
PlayerAttributes >> dribbling [
	^ dribbling
]

{ #category : #accessing }
PlayerAttributes >> dribbling: anObject [
	dribbling:= anObject
]

{ #category : #accessing }
PlayerAttributes >> finishing [
	^ finishing
]

{ #category : #accessing }
PlayerAttributes >> finishing: anObject [
	finishing:= anObject
]

{ #category : #accessing }
PlayerAttributes >> free_kick_accuracy [
	^ free_kick_accuracy
]

{ #category : #accessing }
PlayerAttributes >> free_kick_accuracy: anObject [
	free_kick_accuracy:= anObject
]

{ #category : #accessing }
PlayerAttributes >> gk_diving [
	^ gk_diving
]

{ #category : #accessing }
PlayerAttributes >> gk_diving: anObject [
	gk_diving:= anObject
]

{ #category : #accessing }
PlayerAttributes >> gk_handling [
	^ gk_handling
]

{ #category : #accessing }
PlayerAttributes >> gk_handling: anObject [
	gk_handling:= anObject
]

{ #category : #accessing }
PlayerAttributes >> gk_kicking [
	^ gk_kicking
]

{ #category : #accessing }
PlayerAttributes >> gk_kicking: anObject [
	gk_kicking:= anObject
]

{ #category : #accessing }
PlayerAttributes >> gk_positioning [
	^ gk_positioning
]

{ #category : #accessing }
PlayerAttributes >> gk_positioning: anObject [
	gk_positioning:= anObject
]

{ #category : #accessing }
PlayerAttributes >> gk_reflexes [
	^ gk_reflexes
]

{ #category : #accessing }
PlayerAttributes >> gk_reflexes: anObject [
	gk_reflexes:= anObject
]

{ #category : #accessing }
PlayerAttributes >> heading_accuracy [
	^ heading_accuracy
]

{ #category : #accessing }
PlayerAttributes >> heading_accuracy: anObject [
	heading_accuracy:= anObject
]

{ #category : #accessing }
PlayerAttributes >> id [
	^ id
]

{ #category : #accessing }
PlayerAttributes >> id: anObject [
	id:= anObject
]

{ #category : #accessing }
PlayerAttributes >> interceptions [
	^ interceptions
]

{ #category : #accessing }
PlayerAttributes >> interceptions: anObject [
	interceptions:= anObject
]

{ #category : #accessing }
PlayerAttributes >> jumping [
	^ jumping
]

{ #category : #accessing }
PlayerAttributes >> jumping: anObject [
	jumping:= anObject
]

{ #category : #accessing }
PlayerAttributes >> long_passing [
	^ long_passing
]

{ #category : #accessing }
PlayerAttributes >> long_passing: anObject [
	long_passing:= anObject
]

{ #category : #accessing }
PlayerAttributes >> long_shots [
	^ long_shots
]

{ #category : #accessing }
PlayerAttributes >> long_shots: anObject [
	long_shots:= anObject
]

{ #category : #accessing }
PlayerAttributes >> marking [
	^ marking
]

{ #category : #accessing }
PlayerAttributes >> marking: anObject [
	marking:= anObject
]

{ #category : #accessing }
PlayerAttributes >> overall_rating [
	^ overall_rating
]

{ #category : #accessing }
PlayerAttributes >> overall_rating: anObject [
	overall_rating:= anObject
]

{ #category : #accessing }
PlayerAttributes >> penalties [
	^ penalties
]

{ #category : #accessing }
PlayerAttributes >> penalties: anObject [
	penalties:= anObject
]

{ #category : #accessing }
PlayerAttributes >> player_api_id [
	^ player_api_id
]

{ #category : #accessing }
PlayerAttributes >> player_api_id: anObject [
	player_api_id:= anObject
]

{ #category : #accessing }
PlayerAttributes >> player_fifa_api_id [
	^ player_fifa_api_id
]

{ #category : #accessing }
PlayerAttributes >> player_fifa_api_id: anObject [
	player_fifa_api_id:= anObject
]

{ #category : #accessing }
PlayerAttributes >> positioning [
	^ positioning
]

{ #category : #accessing }
PlayerAttributes >> positioning: anObject [
	positioning:= anObject
]

{ #category : #accessing }
PlayerAttributes >> potential [
	^ potential
]

{ #category : #accessing }
PlayerAttributes >> potential: anObject [
	potential:= anObject
]

{ #category : #accessing }
PlayerAttributes >> preferred_foot [
	^ preferred_foot
]

{ #category : #accessing }
PlayerAttributes >> preferred_foot: anObject [
	preferred_foot:= anObject
]

{ #category : #accessing }
PlayerAttributes >> reactions [
	^ reactions
]

{ #category : #accessing }
PlayerAttributes >> reactions: anObject [
	reactions:= anObject
]

{ #category : #accessing }
PlayerAttributes >> short_passing [
	^ short_passing
]

{ #category : #accessing }
PlayerAttributes >> short_passing: anObject [
	short_passing:= anObject
]

{ #category : #accessing }
PlayerAttributes >> shot_power [
	^ shot_power
]

{ #category : #accessing }
PlayerAttributes >> shot_power: anObject [
	shot_power:= anObject
]

{ #category : #accessing }
PlayerAttributes >> sliding_tackle [
	^ sliding_tackle
]

{ #category : #accessing }
PlayerAttributes >> sliding_tackle: anObject [
	sliding_tackle:= anObject
]

{ #category : #accessing }
PlayerAttributes >> sprint_speed [
	^ sprint_speed
]

{ #category : #accessing }
PlayerAttributes >> sprint_speed: anObject [
	sprint_speed:= anObject
]

{ #category : #accessing }
PlayerAttributes >> stamina [
	^ stamina
]

{ #category : #accessing }
PlayerAttributes >> stamina: anObject [
	stamina:= anObject
]

{ #category : #accessing }
PlayerAttributes >> standing_tackle [
	^ standing_tackle
]

{ #category : #accessing }
PlayerAttributes >> standing_tackle: anObject [
	standing_tackle:= anObject
]

{ #category : #accessing }
PlayerAttributes >> strength [
	^ strength
]

{ #category : #accessing }
PlayerAttributes >> strength: anObject [
	strength:= anObject
]

{ #category : #accessing }
PlayerAttributes >> vision [
	^ vision
]

{ #category : #accessing }
PlayerAttributes >> vision: anObject [
	vision:= anObject
]

{ #category : #accessing }
PlayerAttributes >> volleys [
	^ volleys
]

{ #category : #accessing }
PlayerAttributes >> volleys: anObject [
	volleys:= anObject
]
