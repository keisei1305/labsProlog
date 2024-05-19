%max(+X, +Y, -U)
%DESCRIPTION:
%Предикат, который находит макс число из X,Y,Z.

%max(+X, +Y, +Z, -U)
%DESCRIPTION:
%Предикат, находящий максимальное число из X, Y, Z.
max(X, Y, Z, X):- X>Y, X>Z, !.
max(_, Y, Z, Y):- Y>Z, !.
max(_, _, Z, Z).

%fact_up(+X, -Y)
%DESCRIPTION:
%Факториал рекурсией вверх
fact_up(0, 1):-!.
fact_up(X, Y):- X1 is X-1, fact_up(X1, Y1), Y is X * Y1.

%fact_down(+X, -Y)
%DESCRIPTION:
%Факториал рекурсией вниз
fact_down(X, Y):- fact_down(0, 1, X, Y).
fact_down(X, Y, X, Y):-!.
fact_down(X1, Y1, X, Y):- X2 is X1+1, Y2 is Y1*X2, fact_down(X2, Y2, X, Y).

%sum_digits_up(+X, -Y)
%DESCRIPTION:
%Сумма цифр числа рекурсией вверх
sum_digits_up(0, 0):-!.
sum_digits_up(X, Y):- X1 is X//10, sum_digits_up(X1, Y1), Y is Y1 + X mod 10.

%sum_digits_down(+X, -Y)
%DESCRIPTION:
%Сумма цифр числа рекурсией вниз
sum_digits_down(X, Y):-sum_digits_down(0, X, Y).
sum_digits_down(Y, 0, Y):-!.
sum_digits_down(S, X, Y):- S1 is S + X mod 10, X1 is X//10, sum_digits_down(S1, X1, Y).

%free_from_square(+X)
%DESCRIPTION:
%Предикат, проверяющий является ли X свободным от квадратов
free_from_square(X):- MaxDel is (X // 2) + 1, free_from_square(2, MaxDel, X), !, true.
free_from_square(MaxDel, MaxDel, X):-!.
free_from_square(N, MaxDel, X):- Square is N * N, Ost is X mod Square, Ost \= 0, NextN is N + 1, free_from_square(NextN, MaxDel, X).

%read_list(-List, N).
%DESCRIPTION:
%Предикат, записывающий элементы в массив
read_list(List,N):-read_list(List,N,0,[]).
read_list(List,N,N,List):-!.
read_list(List,N,K,NewList):-read(X), append(NewList,[X],AppenListResult),K_next is K+1, read_list(List,N,K_next,AppenListResult).

%write_list(?List).
%DESCRIPTION:
%Предикат, выводящий элементы массива
write_list([]):-!.
write_list([H|T]):-write(H), nl, write_list(T).

%sum_list_down(+List, ?Sum)
%DESCRIPTION:
%Предикат, считающий сумму элементов, и сравнивающий с Sum или выводящий сумму. Рекурсия вниз.
sum_list_down(List, Sum):- sum_list_down(List, 0, Sum).
sum_list_down([], CurSum, Sum):- Sum is CurSum, !.
sum_list_down([H|T], CurSum, Sum):- NewCurSum is CurSum + H, sum_list_down(T, NewCurSum, Sum).

%sum_list_up(+List, ?Sum)
%DESCRIPTION:
%Предикат, считающий сумму элементов, и сравнивающий с Sum или выводящий сумму. Рекурсия вверх
sum_list_up([], 0):- !. 
sum_list_up([H|T], Sum):- sum_list_up(T, NewSum), Sum is NewSum + H.

%remove_by_sum(+List, +Sum).
%DESCRIPTION:
%Предикат, который удаляет все элементы из List, равные Sum
remove_by_sum(List, Sum):- remove_by_sum(List, Sum, []).
remove_by_sum([], _, ResultList):- write_list(ResultList), !.
remove_by_sum([H|T], Sum, ResultList):-(sum_digits_down(H, NumSum),
										NumSum is Sum,
										remove_by_sum(T, Sum, ResultList)),!.
remove_by_sum([H|T], Sum, ResultList):- append(ResultList, [H], NewList), remove_by_sum(T, Sum, NewList), !.

%max_digit_in_num_down(+X, -Y).
%DESCRIPTION:
%Предикат, который находит максимальную цифру в числе. Рекурсией вниз.
max_digit_in_num_down(X, Y):- max_digit_in_num_down(X, 0, Y).
max_digit_in_num_down(0, Max, Max):-!.
max_digit_in_num_down(X, Max, Y):- CurD is (X mod 10), Max > CurD, X1 is X//10, max_digit_in_num_down(X1, Max, Y), !.
max_digit_in_num_down(X, Max, Y):- CurD is (X mod 10), X1 is X//10, max_digit_in_num_down(X1, CurD, Y), !.

%max_digit_in_num_up(+X, -Y).
%DESCRIPTION:
%Предикат, который находит максимальную цифру в числе. Рекурсией вверх.
max_digit_in_num_up(0, 0):-!.
max_digit_in_num_up(X, Y):- X1 is X//10, max_digit_in_num_up(X1, Y1), Y1 > (X mod 10), Y is Y1, !.
max_digit_in_num_up(X, Y):- Y is (X mod 10), !.

%min_digit_in_num_down(+X, -Y).
%DESCRIPTION:
%Предикат, который находит минимальную, нечётную цифру в числе. Рекурсией вниз.
min_digit_in_num_down(X, Y):- min_digit_in_num_down(X, 9, Y).
min_digit_in_num_down(0, Min, Min):-!.
min_digit_in_num_down(X, Min, Y):- CurD is (X mod 10), CurD < Min, (CurD mod 2)=:=1, X1 is X//10, min_digit_in_num_down(X1, CurD, Y), !.
min_digit_in_num_down(X, Min, Y):- X1 is X//10, min_digit_in_num_down(X1, Min, Y), !.

%min_digit_in_num_down(+X, -Y).
%DESCRIPTION:
%Предикат, который находит минимальную, нечётную цифру в числе. Рекурсией вверх.
min_digit_in_num_up(0, 9):-!.
min_digit_in_num_up(X, Y):- X1 is X//10, min_digit_in_num_up(X1, Y1), CurD is (X mod 10), 
							(CurD < Y1, (CurD mod 2) =:= 1 -> Y is CurD; Y is Y1 ),!.

%nod_down(+X, +Y, -Z)
%DESCRIPTION:
%Найти НОД двух чисел.
nod(X, 0, X):- !.
nod(_, 0, _):- !, fail.
nod(X, Y, Z):- Ost is (X mod Y), nod(Y, Ost, Z).