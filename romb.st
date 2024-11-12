
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
	wierzcholki at: 1 put: 0@0.
    Transcript show: 'Wielokat created';cr.!!


!Wielokat methodsFor: 'accessing'!

nazwa
	"podaje nazwe wielokata"

	^nazwa!

nazwa: nowa_nazwa
	"ustawia nowa nazwe wielokata"

	nazwa:=nowa_nazwa! !


!Wielokat methodsFor: 'checking'!
checkIfWielokat: wielokat
	"sprawdza czy dany obiekt jest podklasa Wielokatu"

	^(wielokat isKindOf: Wielokat)! !

!Wielokat methodsFor: 'arithmetic'!
    calculateArcsin: x
        "liczy arcsin z x"
        ^x asFloat arcsin.
    

!!

!Wielokat methodsFor: 'displaying'!

drukuj
  "drukuje nazwe wielokata i jego wierzcholkow"
    (self checkIfWielokat: self) ifTrue: [
        Transcript show: 'Ta klasa jest wielokatem';cr.
    ] ifFalse: [
        Transcript show: 'Ta klasa nie jest wielokatem';cr.
    ].
    Transcript show: 'Nazwa wielokata to: ';cr.
    Transcript show: self nazwa;cr.
    
    

    Transcript show: 'Wierzcholki wielokata to: ';cr.
    1 to: wierzcholki size do: 
    [:i |
        Transcript show: (wierzcholki at: i) printString;cr.
    ].
    
    ! !





Wielokat subclass: #Romb
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'JezykiProgramowania'!


!Romb methodsFor: 'arithmetic'!


+ figura
	"dodaj 2 figury w sensie pola"
    | p |

    p := self pole + figura pole.
    ^(Romb new) initialize: p sqrt kat: 45! !

!Romb methodsFor: 'actions'!

pole
	"licz pole Rombu"

   
    | bok kat |
    bok := (wierzcholki at: 2) x.
    kat :=  bok arcsin.
    kat := (wierzcholki at: 3) y / kat. 
    ^  bok *  bok * ( kat sin) abs.!!




!Romb methodsFor: 'initialize-release'!

initialize: bok kat:kat
    
	"tworz Romb o podanym boku i kącie"
	super initialize: 4 name: 'Romb'.
    
	wierzcholki at: 2 put: bok@0.
    
	wierzcholki at: 3 put: (bok )@(bok ).
	wierzcholki at: 4 put: (0)@(bok ).
    Transcript show: 'Romb created';cr.
    

    !!

!Romb methodsFor: 'displaying'!
drukuj
    "drukuje nazwe wielokata i jego wierzcholkow"
        super drukuj.
        Transcript cr;
        show: 'Pole rombu to: ';
        show: self pole;cr.! !













Wielokat subclass: #Kwadrat
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'JezykiProgramowania'!


!Kwadrat methodsFor: 'arithmetic'!

+ figura
	"dodaj 2 figury w sensie pola"

	| p |

	p:=self pole + figura pole.
	^(Kwadrat new) initialize: p sqrt! !

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


| romb |
romb := Romb new.
romb initialize: 7 kat: 45.



romb drukuj.