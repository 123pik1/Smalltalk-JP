Object subclass: #Wielokat
	instanceVariableNames: 'wierzcholki nazwa wysrodkowana'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'JezykiProgramowania'!


!Wielokat methodsFor: 'initialize-release'!

initialize: liczbaWierzcholkow name: nowaNazwa
	"konstruktor obiektu - wielokata"
	wysrodkowana:=false.
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

!Wielokat methodsFor: 'actions'!

wysrodkuj
	"przenosi figure tak że punkt 0,0 układu będzie w punkcie przeciecia ,,przekatnych'' wielokata"
	| srodek |
	srodek := self srodekPrzekatnych.

	
	"Przesuwamy kazdy wierzcholek tak zeby srodek przekatnych znalazl sie w punkcie 0,0"
	1 to: wierzcholki size do: [:i |
        wierzcholki at: i put: (wierzcholki at: i) - srodek.
    ].

	wysrodkowana := true.  "Ustawiamy, że figura została wyśrodkowana"
	" Transcript show: 'Figura zostala wysrodkowana.'; cr. "

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
	wysrodkowana 
        ifTrue: [Transcript show: 'Figura została wyśrodkowana.'; cr.]
        ifFalse: [Transcript show: 'Figura nie została jeszcze wyśrodkowana.'; cr.].
    
    ! !

!Wielokat methodsFor: 'abstract'!

srodekPrzekatnych
    "Oblicza środek figury - ale aby działać prawidłowo musi być nadpisany w podklasach"
	"nil oznacza że ta metoda nie wykonuje zadnej operacji i zwraca brak wartosci - jak NULL"
    ^ 0@0.  !!
	




Wielokat subclass: #Romb
	instanceVariableNames: 'kat '
	classVariableNames: ''
	poolDictionaries: ''
	category: 'JezykiProgramowania'!


!Romb methodsFor: 'arithmetic'!


+ figura
	"dodaj 2 figury w sensie pola"
    | p |
	"git jeśli kąt jest w radianach, jeśli kąt w stopniach to po prostu dodać: katWRad := self kat * Float pi / 180."
    p := self pole + figura pole.
	^(Romb new) initialize: ((p/(self kat sin)) sqrt) kat: self kat.!
   
= figura
	"porównaj 2 figury w sensie przystawania"
	Transcript show: 'Porównuje pola figur'; cr.
	self pole = figura pole ifTrue: [ Transcript show: 'Pola figur są równe'; cr
		self kat = figura kat
		ifTrue: [^true]
		ifFalse: [^false]].
	ifFalse: [
		Transcript show: 'Pola figur nie są równe'; cr.
		^false].!!


!Romb methodsFor: 'actions'!

pole
	"licz pole Rombu"
	"git jeśli kąt jest w radianach, jeśli kąt w stopniach to po prostu dodać: katWRad := self kat * Float pi / 180."
    | bok |
	
	"Obliczamy dlugosc boku"
    bok := ((wierzcholki at: 2) x - (wierzcholki at: 1) x) squared +
          ((wierzcholki at: 2) y - (wierzcholki at: 1) y) squared.
	bok := bok sqrt.

	"Pole rombu = bok^2 * sin(kąt)"
    ^  (bok *  bok * (self kat  sin) abs) roundTo: 0.01 .!! "Zaokrąglamy od razu do 2 cyfr po przecinku"




!Romb methodsFor: 'initialize-release'!

initialize: bok kat:kat
    
	"tworz Romb o podanym boku i kącie"
	super initialize: 4 name: 'Romb'.
    self kat: kat.
	wierzcholki at: 2 put: bok@0.

	"jest dobrze??"
	wierzcholki at: 3 put: 2*bok@(bok * (self kat  sin) abs).
	wierzcholki at: 4 put: bok@(bok * (self kat  sin) abs + bok).
    Transcript show: 'Romb created';cr.
    !
	
	!

!Romb methodsFor: 'displaying'!

drukuj
    "drukuje nazwe rombu, jego wierzcholki oraz pole"
	
	super drukuj. "wywołuje ogólną metodę drukuj z klasy bazowej, czyli wypisuje nazwe i wierzcholki"
    Transcript show: 'Pole rombu to: '; cr.
    Transcript show: self pole printString; cr.
	!!

!Romb methodsFor: 'accessing'!
	kat 
	"podaje kat rombu"
	^kat! 

	kat: aKat
	"ustawia kat rombu"
	kat := aKat!
	!!

!Romb methodsFor: 'abstract'!

srodekPrzekatnych
	"Wyznacza środek przekątnych rombu"
	| srodek |
	
	"Punkt przecięcia przekątnych rombu jest w punkcie środka przekątnych(przekątne po przecięciu dzielą się na równe połowy)"
	srodek := ((wierzcholki at: 1) + (wierzcholki at: 3)) / 2.

	^srodek. !! 



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
	| bok_squared |
	"Obliczamy kwadrat długości boku, bo a^2=b^2+c^2"
	bok_squared := ((wierzcholki at: 2) x - (wierzcholki at: 1) x) squared +
          ((wierzcholki at: 2) y - (wierzcholki at: 1) y) squared.

	"pole to po prostu kwadrat boku"
	^bok_squared! !

!Kwadrat methodsFor: 'displaying'!

drukuj
    "drukuje nazwe rombu, jego wierzcholki oraz pole"
	
	super drukuj. "wywołuje ogólną metodę drukuj z klasy bazowej, czyli wypisuje nazwe i wierzcholki"
    Transcript show: 'Pole kwadratu to: '; cr.
    Transcript show: self pole printString; cr.
	!!

!Kwadrat methodsFor: 'abstract'!

srodekPrzekatnych
	"Wyznacza środek przekątnych kwadratu"
	| srodek |
	srodek := ((wierzcholki at: 1) + (wierzcholki at: 3)) / 2.

	" ^2@2. !! "
	^srodek. !! 

!Kwadrat methodsFor: 'initialize-release'!

initialize: bok
	"tworz kwadrat o podanym boku"

	super initialize: 4 name: 'Kwadrat'.
	wierzcholki at: 2 put: bok@0.
	wierzcholki at: 3 put: bok@bok.
	wierzcholki at: 4 put: 0@bok.! !


| romb |
romb := Romb new.
romb initialize: 7 kat:  0.78e.
| romb1 |
romb1 := Romb new.
romb1 initialize: 7 kat: 0.78e.

| romb2 |
romb2 :=(romb+romb1). "lub (romb+romb1) drukuj."
romb2 drukuj.


romb drukuj.
romb wysrodkuj. 
romb drukuj. 

kwadrat := Kwadrat new.
kwadrat initialize: 4.
kwadrat drukuj.
kwadrat wysrodkuj. 
kwadrat drukuj.  

romb = romb1. "lub romb = romb1 drukuj."

Transcript show: 'Romb: ';cr.
Transcript show: romb pole printString;cr.
Transcript show: 'Romb1: ';cr.
Transcript show: romb1 pole printString;cr.

romb = romb1 ifTrue: [Transcript show: 'Romb = Romb1';cr.] ifFalse: [Transcript show: 'Romb != Romb1';cr.].
