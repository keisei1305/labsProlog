
man(voeneg).
man(ratibor).
man(boguslav).
man(velerad).
man(duhovlad).
man(svyatoslav).
man(dobrozhir).
man(bogomil).
man(zlatomir).

woman(goluba).
woman(lubomila).
woman(bratislava).
woman(veslava).
woman(zhdana).
woman(bozhedara).
woman(broneslava).
woman(veselina).
woman(zdislava).

parent(voeneg,ratibor).
parent(voeneg,bratislava).
parent(voeneg,velerad).
parent(voeneg,zhdana).

parent(goluba,ratibor).
parent(goluba,bratislava).
parent(goluba,velerad).
parent(goluba,zhdana).

parent(ratibor,svyatoslav).
parent(ratibor,dobrozhir).
parent(lubomila,svyatoslav).
parent(lubomila,dobrozhir).

parent(boguslav,bogomil).
parent(boguslav,bozhedara).
parent(bratislava,bogomil).
parent(bratislava,bozhedara).

parent(velerad,broneslava).
parent(velerad,veselina).
parent(veslava,broneslava).
parent(veslava,veselina).

parent(duhovlad,zdislava).
parent(duhovlad,zlatomir).
parent(zhdana,zdislava).
parent(zhdana,zlatomir).

/*Предикат вывода всех мужчин*/
men:- man(X), write(X), nl, fail.

/*Предикат вывода всех женщин*/
women:- woman(Y), write(Y), nl, fail.

/*Предикат вывода всех детей X*/
children(X):- parent(X, Y), write(Y), nl, fail.

/*Предикат, определяющий, что X - мать Y*/
mother(X,Y):- parent(X,Y), woman(X), true.

/*Предикат вывода матерей X*/
mother(X):- parent(Y,X), woman(Y), write(Y).

/*Предикат,определяющий, что X - брат Y*/
brother(X,Y):- man(X), X \== Y, man(Y), parent(Z, X), parent(Z, Y), true.

/*Предикат, выводящий всех братьев X*/
brothers(X):-
    man(X), parent(Z, X), parent(Z, Y), woman(Z), X \== Y, man(Y), write(Y), nl, fail.

/*Предикат, определяющий, что X - брат|сестра Y*/
b_s(X, Y):- X \== Y, parent(Z, X), parent(Z, Y), true.

/*Предикат, выводящий всех братьев|сестёр X*/
b_s(X):- parent(Z, X), parent(Z, Y), X \== Y, woman(Z), write(Y), nl, fail.

?-b_s(velerad).





































