%Task4
/*
Вариант № 11 Воронов, Павлов, Левицкий и Сахаров – четыре талантливых
молодых человека. Один из них танцор, другой художник, третий-певец, а четвертый-
писатель. О них известно следующее: Воронов и Левицкий сидели в зале консерватории в
тот вечер, когда певец дебютировал в сольном концерте. Павлов и писатель вместе
позировали художнику. Писатель написал биографическую повесть о Сахарове и
собирается написать о Воронове. Воронов никогда не слышал о Левицком. Кто чем
занимается?
*/

solve1:-
	Humans = [_, _, _, _],
	member([voronov, Prof1], Humans),
	member([pavlov, Prof2], Humans),
	member([levickiy, Prof3], Humans),
	member([saharov, Prof4], Humans),

	member([_, dancer], Humans),
	member([_, artist], Humans),
	member([_, singer], Humans),
	member([_, author], Humans),

	%Воронов и Левицкий сидели в зале в консерватории в тот вечер, когда певец дебютировал
	Prof1 \= singer,
	Prof3 \= singer,

	%Павлов и писатель позировалу хужожнику

	Prof2 \= artist,
	Prof2 \= author,

	%Писатель написал биографическую повесть о Сахарове и Воронове

	Prof1 \= author,
	Prof4 \= author,

	write("Voronov is "), write(Prof1), nl,
	write("Pavlov is "), write(Prof2), nl,
	write("Levickiy is "), write(Prof3), nl,
	write("Saharov is "), write(Prof4), nl.

%Task5
/*
Вариант 11 Пятеро студентов едут на велосипедах.
Их зовут Сергей, Борис, Леонид, Григорий и Виктор.
Велосипеды сделаны в пяти городах: Риге, Пензе, Львове, Харькове
и Москве.
Каждый из студентов родился в одном из этих городов, но ни один
из студентов не едет на велосипеде, сделанном на его родине.
Сергей едет на велосипеде, сделанном в Риге.
Борис родом из Риги, у него велосипед из Пензы.
У Виктора велосипед из Москвы.
У Григория велосипед из Харькова.
Виктор родом из Львова.
Уроженец Пензы едет на велосипеде, сделанном на родине Леонида.
Кто из студентов родом из Москвы ?
*/


solve2:-
	Humans = [_, _, _, _, _],
	member([sergey, Rodina1, Velik1], Humans),
	member([boris, Rodina2, Velik2], Humans),
	member([leonid, Rodina3, Velik3], Humans),
	member([grisha, Rodina4, Velik4], Humans),
	member([viktor, Rodina5, Velik5], Humans),

	member([_, _,riga], Humans),
	member([_, _,penza], Humans),
	member([_, _,lvov], Humans),
	member([_, _,harkov], Humans),
	member([_, _,moskva], Humans),

	member([_, penza, _], Humans),
	member([_, riga, _], Humans),
	member([_, lvov, _], Humans),
	member([_, harkov, _], Humans),
	member([_, moskva, _], Humans),

	%Сергей едет на велосипеде, сделанном в Риге
	Velik1 = riga,

	%Борис родом из Риги, у него велосипед из Пензы.
	Rodina2 = riga, 
	Velik2 = penza,

	%У Виктора велосипед из Москвы.
	Velik5 = moskva,

	%У Григория велосипед из Харькова.
	Velik4 = harkov,

	%Виктор родом из Львова.
	Rodina5 = lvov,

	%Уроженец Пензы едет на велосипеде, сделанном на родине Леонида.
	member([_, penza, Rodina3], Humans),
 
	%Каждый из студентов родился в одном из этих городов, но ни один
	%из студентов не едет на велосипеде, сделанном на его родине.
	Rodina1 \= Velik1,
	Rodina2 \= Velik2,
	Rodina3 \= Velik3,
	Rodina4 \= Velik4,
	Rodina5 \= Velik5,

	member([X, moskva, _], Humans), write(X), !.
