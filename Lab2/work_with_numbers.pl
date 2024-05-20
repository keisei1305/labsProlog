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
sum_digits_up(X, Y):- X1 is X//10, sum_digits_up(X1, Y1), Y is Y1 + (X mod 10).

%sum_digits_down(+X, -Y)
%DESCRIPTION:
%Сумма цифр числа рекурсией вниз
sum_digits_down(X, Y):-sum_digits_down(0, X, Y).
sum_digits_down(Y, 0, Y):-!.
sum_digits_down(S, X, Y):- S1 is S + (X mod 10), X1 is X//10, sum_digits_down(S1, X1, Y).

%free_from_square(+X)
%DESCRIPTION:
%Предикат, проверяющий является ли X свободным от квадратов
free_from_square(X):- MaxDel is (X // 2) + 1, free_from_square(2, MaxDel, X), !, true.
free_from_square(MaxDel, MaxDel, _):-!.
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
max_digit_in_num_down(X, _, Y):- CurD is (X mod 10), X1 is X//10, max_digit_in_num_down(X1, CurD, Y), !.

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

%unique_el/0.
%DESCRIPTION:
%Сценарий для нахождения уникального элемента
unique_el:-
	write("Task 11: get unique element in list"), nl,
	write("Enter list length"), nl, read(Len),
	write("Enter list elements"), nl, read_list(List, Len),
	write("Answer: "), unique_el(List, Answer), write(Answer).

%unique_el(+X, -Z).
%DESCRIPTION:
%Найти уникальный элемент в X
unique_el([U, E, E|_], Z):- U\=E, Z is U.
unique_el([E, U, E|_], Z):- U\=E, Z is U.
unique_el([E, E, U|_], Z):- U\=E, Z is U.
unique_el([_|T], Z):- unique_el(T, Z), !.


%count_in_interval/0.
%DESCRIPTION:
%Сценарий для подсчёта элементов, которые лежат в интервале A..B.
count_in_interval:-
	write("Task 14: Find nums between A,B"), nl,
	write("Enter A"), nl, read(A),
	write("Enter B"), nl ,read(B),
	write("Enter list length"), nl, read(Len),
	write("Enter list elements"), nl, read_list(List, Len),
	write("Answer: "), count_in_interval(List,A,B, Answer), write(Answer).

%count_in_interval(+X, +A, +B, -Z).
%DESCRIPTION:
%Посчитать количество элементов, которые лежат в интервале A..B.
count_in_interval([H|T], A, B, Z):-H>A, H<B, 
								count_in_interval(T, A, B, Z1), Z is Z1+1, !.
count_in_interval([_|T], A, B, Z):-count_in_interval(T, A, B, Z1), Z is Z1, !.
count_in_interval([], _, _, 0):-!.

%count_in_interval/0.
%DESCRIPTION:
%Сценарий для подсчёта элементов, которые лежат в интервале A..B.
max_in_interval:-
	write("Task 25: Find max between A,B"), nl,
	write("Enter A"), nl, read(A),
	write("Enter B"), nl ,read(B),
	write("Enter list length"), nl, read(Len),
	write("Enter list elements"), nl, read_list(List, Len),
	write("Answer: "), max_in_interval(List, A, B, Answer), write(Answer).

%max_in_interval(+X, +A, +B, -Z).
%DESCRIPTION:
%Найти макс в интервале A..B.
max_in_interval([H|T], A, B, Z):- H>A, H<B,
								max_in_interval(T, A, B, Z1), 
								(H > Z1 -> Z is H; Z is Z1).
max_in_interval([_|T], A, B, Z):-max_in_interval(T, A, B, Z1), Z is Z1, !.
max_in_interval([], _, _, 0):-!.

count_dividers_undivisible_by3:-
	write("Task 11: Find count dividers, that undivisible by 3"), nl,
	write("Enter Num"), nl, read(X),
	write("Answer: "), count_dividers_undivisible_by3(X, Answer), write(Answer).

%count_dividers_undivisible_by3(+X, -Y)
%DESCRIPTION:
%Найти количество делителей, не делящихся на 3
count_dividers_undivisible_by3(X, Y):- MaxDel is (X//2)+1, count_dividers_undivisible_by3(X, MaxDel, Y1),
									((X mod 3)=\=0 ->Y is Y1+1;Y is Y1).
count_dividers_undivisible_by3(_,1,1):-!.
count_dividers_undivisible_by3(X, CurDel,Y):- CurDel1 is CurDel-1,!, count_dividers_undivisible_by3(X,CurDel1 ,Y1),
									((CurDel mod 3)=\=0, (X mod CurDel)=:=0 ->Y is Y1+1;Y is Y1).

%proizved_digits_in_num(+X, -Y)
%DESCRIPTION:
%Предикат, считающий произведение всех цифр в числе
proizved_digits_in_num(0, 1):-!.
proizved_digits_in_num(X, Y):- X1 is X//10, proizved_digits_in_num(X1, Y1), Y is Y1 * (X mod 10).


%sum_dividers_with_condition(+X, -Y).
%DESCRIPTION:
%Сценарий, считающий сумму всех делителей числа,
%взаимно простых с суммой цифр числа 
%и не взаимно простых с суммой простых цифр этого числа
sum_dividers_with_condition:-
	write("Task 11: Find count dividers with condition"), nl,
	write("Enter Num"), nl, read(X),
	write("Answer: "), sum_dividers_with_condition(X, Answer), write(Answer).

%sum_dividers_with_condition(+X, -Y).
%DESCRIPTION:
%Предикат, считающий сумму всех делителей числа,
%взаимно простых с суммой цифр числа 
%и не взаимно простых с суммой простых цифр этого числа
sum_dividers_with_condition(X, Y):- proizved_digits_in_num(X, Proizv), sum_digits_up(X, Sum),
									MaxDel is (X//2)+1,
									sum_dividers_with_condition(X, Y1, Proizv, Sum, MaxDel),
									(nod(X, Sum, R1), R1=:=1,
									nod(X, Proizv, R2), R2=\=1-> 
									Y is Y1 + X; Y is Y1).
sum_dividers_with_condition(_, 0, _, _, 1):-!.
sum_dividers_with_condition(X, Y, Proizv, Sum, CurDel):- CurDel1 is CurDel-1, !,
														 sum_dividers_with_condition(X, Y1, Proizv, Sum, CurDel1),
														 ((X mod CurDel)=:=0, nod(CurDel, Sum, R1), R1=:=1,
														 	nod(CurDel, Proizv, R2), R2=\=1-> 
														 	Y is Y1 + CurDel; Y is Y1).