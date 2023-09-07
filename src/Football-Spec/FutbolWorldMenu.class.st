"
Used to access ESL new
"
Class {
	#name : #FutbolWorldMenu,
	#superclass : #Object,
	#category : #'Football-Spec-WorldMenu'
}

{ #category : #accessing }
FutbolWorldMenu class >> menu: aBuilder [
	<worldMenu>
	(aBuilder item: #EuropeanFootballLeagues)
		parent: #Tools;
		label: 'European Leagues(Demo)';
		icon: (self iconNamed: #remote);
		help: 'basic football demo';
		action: [ EuropeanFootballLeagues new inspect ];
		order: 1000
]
