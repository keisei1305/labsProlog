
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

%men/0
%DESCRIPTION:
%Выводит всех мужчин
men:- man(X), write(X), nl, fail.

%women/0
%DESCRIPTION:
%Выводит всех женщин
women:- woman(Y), write(Y), nl, fail.

%children(+X)
%DESCRIPTION:
%Выводит всех детей X
children(X):- parent(X, Y), write(Y), nl, fail.

%mother(?X, +Y)
%DESCRIPTION:
%Определяет является ли X - матерью Y
mother(X,Y):- parent(X,Y), woman(X), true.

%mother(+X)
%DESCRIPTION:
%Выводит мать X
mother(X):- parent(Y,X), woman(Y), write(Y).

%brother(?X, +Y)
%DESCRIPTION:
%Определяет является ли X - братом Y
brother(X,Y):- man(X), X \== Y, parent(Z, X), parent(Z, Y), true.

%brother(+X)
%DESCRIPTION:
%Выводит всех братьев X
brothers(X):- brother(Y,X), write(Y), nl, fail.

%b_s(?X, +Y)
%DESCRIPTION:
%Определяет является ли X - братом/сестрой Y
b_s(X, Y):- X \== Y, parent(Z, X), parent(Z, Y), man(Z), true.

%b_s(+X)
%DESCRIPTION:
%Выводит всех братьев/сестёр X
b_s(X):- b_s(Y, X), write(Y), nl, fail.

%son(?X, +Y)
%DESCRIPTION:
%Определяет является ли X - сыном Y
son(X, Y):- X\==Y, parent(Y, X), true.

%son(+X)
%DESCRIPTION:
%Выводит всех сыновей X
son(X):- son(Y, X), write(Y), nl, fail.

%husband(?X, +Y)
%DESCRIPTION:
%Определяет является ли X - мужем Y
husband(X, Y):- X\==Y, parent(X, Z), parent(Y, Z), man(X), true.

%husband(+X)
%DESCRIPTION:
%Выводит мужа X
husband(X):- husband(Y, X), X\==Y, write(Y), true.

%grand_so(?X, +Y)
%DESCRIPTION:
%Определяет является ли X - внуком Y
grand_so(X, Y):- man(X), parent(Z, X), parent(Y, Z), true.

%grand_sons(+X)
%DESCRIPTION:
%Выводит всех внуков X
grand_sons(X):- grand_so(Y,X), write(Y), nl, fail.

%grand_ma(+X, +Y)
%DESCRIPTION:
%Определяет является ли X - бабушкой Y
grand_ma(X, Y):- woman(X), parent(X, Z), parent(Z, Y), true.

%grand_da(+X, +Y)
%DESCRIPTION:
%Определяет является ли X - внучкой Y
grand_da(X, Y):- woman(X), parent(Z, X), parent(Y, Z), true.

%grand_ma_and_da(+X, +Y)
%DESCRIPTION:
%Определяет является ли X - бабушкой/внучкой Y
grand_ma_and_da(X, Y):- grand_ma(X, Y), true.
grand_ma_and_da(X, Y):- grand_da(X, Y), true.

%niece(+X, +Y)
%DESCRIPTION:
%Определяет является ли X - племянницей Y
niece(X, Y):- woman(X), parent(Z, X), b_s(Y, Z), true.

%nieces(+X)
%DESCRIPTION:
%Выводит всех племянниц X
nieces(X):- niece(Y, X), write(Y), nl, fail.















