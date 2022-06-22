"
Used to access ESL new
"
Class {
	#name : #FutbolWorldMenu,
	#superclass : #Object,
	#category : #'Futbol-WoldMenu'
}

{ #category : #accessing }
FutbolWorldMenu class >> menu: aBuilder [
	<worldMenu>
	(aBuilder item: #ESL)
		parent: #Tools;
		label: 'European Leagues(Demo)';
		icon: (self iconNamed: #remote);
		help: 'basic football demo';
		action: [ ESL new inspect ];
		order: 1000
]
