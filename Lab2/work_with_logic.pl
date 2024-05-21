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
