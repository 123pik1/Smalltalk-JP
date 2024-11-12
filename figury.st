Object subclass: #Wielokat
	instanceVariableNames: 'wierzcholki nazwa '
	classVariableNames: ''
	poolDictionaries: ''
	category: 'JezykiProgramowania'!


!Wielokat methodsFor: 'initialize-release'!

initialize: liczbaWierzcholkow name: nowaNazwa
	"konstruktor obiektu - wielokata"

	nazwa:=nowaNazwa.
	wierzcholki:=Array new: liczbaWierzcholkow.
	wierzcholki at: 1 put: 0@0.! !

!Wielokat methodsFor: 'accessing'!

nazwa
	"podaje nazwe wielokata"

	^nazwa!

nazwa: nowa_nazwa
	"ustawia nowa nazwe wielokata"

	nazwa:=nowa_nazwa! !

!Wielokat methodsFor: 'displaying'!

drukuj
  "drukuje nazwe wielokata i jego wierzcholkow"

	(self checkIfWielokat: self) ifTrue: [
		Transcript show: 'Ta klasa jest wielokatem';cr.
	] ifFalse: [
		Transcript show: 'Ta klasa nie jest wielokatem';cr.
	].

  Transcript show: 'Wierzcholki wielokata to: ';cr.
	1 to: wierzcholki size do: 
    [:i |
        Transcript show: (wierzcholki at: i) printString;cr.
    ].! !

!Wielokat methodsFor: 'checking'!

checkIfWielokat: wielokat
	"sprawdza czy dany obiekt jest podklasa Wielokatu"

	^(wielokat isKindOf: Wielokat)! !













Wielokat subclass: #Kwadrat
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'JezykiProgramowania'!


!Kwadrat methodsFor: 'arithmetic'!

+ figura
	"dodaj 2 figury w sensie pola"

	| p drugie_pole |
	(self checkIfWielokat: figura) ifTrue: [
		drugie_pole := figura pole.
	]
	ifFalse: [
		drugie_pole := figura
	].

	p:=self pole + drugie_pole.
	^(Kwadrat new) initialize: p sqrt! !

!Kwadrat methodsFor: 'displaying'!

drukuj
  "drukuje nazwe wielokata i jego wierzcholkow"

  super drukuj.
  Transcript cr;
	show: 'Pole kwadratu to: ';
  show: self pole printString;cr.! !

!Kwadrat methodsFor: 'actions'!

pole
	"licz pole kwadratu"

	^(wierzcholki at: 2) x squared! !

!Kwadrat methodsFor: 'initialize-release'!

initialize: bok
	"tworz kwadrat o podanym boku"

	super initialize: 4 name: 'Kwadrat'.
	wierzcholki at: 2 put: bok@0.
	wierzcholki at: 3 put: bok@bok.
	wierzcholki at: 4 put: 0@bok.! !

!Kwadrat methodsFor: 'transformations'!

wysrodkuj
	"przesun srodek kwadratu do punktu (0,0)"

	| srodek |
	srodek:=((wierzcholki at: 1) x + ((wierzcholki at: 2) x / 2))@((wierzcholki at: 1) y + ((wierzcholki at: 3) y / 2)).
	1 to: wierzcholki size do: 
		[:i |
				wierzcholki at: i put: ((wierzcholki at: i) x - srodek x)@( (wierzcholki at: i) y - srodek y)
		].
	self drukuj.! !

Wielokat subclass: #Szesciokat
  instanceVariableNames: 'bok '
	classVariableNames: ''
	poolDictionaries: ''
	category: 'JezykiProgramowania'!

!Szesciokat methodsFor: 'initialize-release'!

initialize: poczatkowyBok
	"tworzy szesciokat foremny o podanym boku"
	bok:=poczatkowyBok.
	super initialize: 6 name: 'Szesciokat foremny'.
	self oblicz_wierzcholki.! !

!Szesciokat methodsFor: 'calculations'!

oblicz_wierzcholki
	"oblicza wspolrzedne wierzcholkow szesciokata"
	| srodek pi |
	srodek:= ((wierzcholki at: 1) x + bok)@((wierzcholki at: 1) y).
	pi := Float pi.

	1 to: wierzcholki size do: 
		[:i |
				wierzcholki at: i put: ((srodek x + (bok * (i * pi / 3) cos))@(srodek y + (bok * (i * pi / 3) sin)))
		].! !

!Szesciokat methodsFor: 'transformations'!	

wysrodkuj
	"przesun srodek szesciokata do punktu (0,0)"

	wierzcholki at: 1 put: (0 - bok)@(0).
	self oblicz_wierzcholki.
	self drukuj.! !

!Szesciokat methodsFor: 'actions'!

pole
    | wynik |
    wynik := (((bok squared) * (3 sqrt) * 3) / 2).
    ^wynik.! !

!Szesciokat methodsFor: 'arithmetic'!
+ figura
	"dodaj 2 figury w sensie pola"

	| p nowyBok drugie_pole |
	(self checkIfWielokat: figura) ifTrue: [
		drugie_pole := figura pole.
	]
	ifFalse: [
		drugie_pole := figura
	].

	p:=self pole + drugie_pole.
	nowyBok:=((p * 2 / 3) * (1 / (3 sqrt))) sqrt.
	^(Szesciokat new) initialize: nowyBok! !


!Szesciokat methodsFor: 'displaying'!

drukuj
  "drukuje nazwe wielokata i jego wierzcholkow"

  super drukuj.
  Transcript cr;
	show: 'Pole szesciokata to: ';
  show: self pole printString;cr;cr.! !

szesciokat_1 := Szesciokat new initialize: 2.
szesciokat_2 := Szesciokat new initialize: 3.
kwadrat_1 := Kwadrat new initialize: 4.

Transcript show: 'Dane są wielokaty:'; cr.
szesciokat_1 drukuj.
szesciokat_2 drukuj.
kwadrat_1 drukuj.

Transcript cr; show: 'szesciokat_1 + szesciokat_2';cr.
szesciokat_3 := szesciokat_1 + szesciokat_2.
szesciokat_3 drukuj.

Transcript cr; show: 'szesciokat_1 + kwadrat_1';cr.
szesciokat_4 := szesciokat_1 + kwadrat_1.
szesciokat_4 drukuj.

Transcript cr; show: 'kwadrat_1 + szesciokat_2';cr.
kwadrat_2 := kwadrat_1 + szesciokat_2.
kwadrat_2 drukuj.

Transcript cr; show: 'wysrodkuj szesciokat_1';cr.
szesciokat_1 wysrodkuj.
szesciokat_1 drukuj.

Transcript cr; show: 'wysrodkuj kwadrat_1';cr.
kwadrat_1 wysrodkuj.
kwadrat_1 drukuj.

Transcript cr; show: 'Sprawdz czy kwadrat_1 jest wielokatem';cr.
Transcript show: (kwadrat_1 checkIfWielokat: kwadrat_1) printString.

wielokat_1 := Wielokat new initialize: 3 name: 'Wielokat'.
Transcript cr; show: 'Sprawdz czy nowy wielokat_1 jest wielokatem';cr.
Transcript show: (wielokat_1 checkIfWielokat: wielokat_1) printString.

Transcript cr; show: 'Wydrkuj wielokat';cr.
wielokat_1 drukuj.

kwadrat_1 := kwadrat_1 + 12.
Transcript cr; show: 'Dodaj do kwadratu_1 liczbe 12';cr.
kwadrat_1 drukuj.

szesciokat_1 drukuj.
Transcript cr; show: 'Dodaj do szesciokat_1 liczbe 10';cr.
szesciokat_1 := szesciokat_1 + 10.
szesciokat_1 drukuj.
