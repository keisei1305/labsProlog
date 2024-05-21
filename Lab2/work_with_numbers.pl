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


%Пентагональные числа P(n)=n(3n-1)/2
%P(n)<1.000.000, найти пару P(i),P(j) => (P(i)+P(j)) is P(n) and P(i)-P(j) in P(n),
%|i-j|->min, max(n) - 816
%Для P(n) <1.000.000 решений не найдено, переделал под 10.000.000, max(n) - 2582

%p(+X, -Y)
%DESCRIPTION:
%Считает пентагональное число, под номером X
p(X, Y):- Y is (X*(3*X-1)/2).

%D=1+24P, x1 = 1+sqrt(1+24P)/6, 
%if (x1 is int and x1 mod 6 ==0)-> vse horosho

%is_p(+P)
%DESCRIPTION:
%Предикат, проверяющий число на пентагональность
is_p(P):- X is integer((1+sqrt(1+24*P))/6), p(X, Y), Y=:=P.

%is_p(+P, -X)
is_p(P, X):-X is integer((1+sqrt(1+24*P))/6), p(X, Y), Y=:=P.


%find_p
%DESCRIPTION:
%Сценарий, для нахождения двух пентагональных чисел, удовлетворяющих условию задачи
find_p:- find_p(1, 1, Y1, Y2),
	write("Searching..."),nl,
	write("First n: "), write(Y1), p(Y1, P1), write("   First P(n): "), write(P1), nl,
	write("Second n: "), write(Y2), p(Y2, P2), write("   Second P(n): "), write(P2), nl,
	write("Sum n: "), SumP is P1+P2, is_p(SumP, SumN), write(SumN), write("   Sum P(n): "), write(SumP), nl,
	write("Diff n: "), DiffP is abs(P1-P2), is_p(DiffP, DiffN), write(DiffN), write("   Diff P(n): "), write(DiffP), nl,
	write("Difference: "), Different is Y2-Y1,write(Different).

%find_p(+X, +D, -Y1, -Y2)
%DESCRIPTION:
%Предикат, который отслеживает ограничение разници между числами
find_p(_, D, Y1, Y2):- D>2582, Y1 is 0, Y2 is 0.

%DESCRIPTION:
%Предикат, который отслеживает ограничение пентагональных чисел
find_p(X1, D, Y1, Y2):- X2 is X1+D, X2>2582, NewD is D+1, find_p(1, NewD, Y1, Y2).

%DESCRIPTION
%Предикат, который проверяет пару чисел на удовлетворение условий
find_p(X1, D, Y1, Y2):- X2 is X1+D, p(X1, P1), p(X2, P2), 
					SumP is P1+P2, is_p(SumP),
					DiffP is abs(P1-P2), is_p(DiffP), Y1 is X1, Y2 is X2.

%DESCRIPTION:
%Предикат, перебирающий номера пентагональных чисел
find_p(X1, D, Y1, Y2):- X2 is X1+1, find_p(X2, D, Y1, Y2), !.

%in_list(+List, +El)
%DESCRIPTION:
%Ищет элемент в листе
in_list([El|_], El).
in_list([_|T], El):-in_list(T, El).

%count_repeat(+List, +El, -X)
%DESCRIPTION:
%Считает количество повторений
count_repeat([], _, 0):-!.
count_repeat([H|T], El, X):- H==El, count_repeat(T, El, X1), X is (X1 + 1), !.
count_repeat([_|T], El, X):- count_repeat(T, El, X1), X is X1, !.

%max_repeat(+List, -X)
%DESCRIPTION:
%Считает максимальное количество повторений элемента в List и возвращает этот элемент
max_repeat(List, X):- max_repeat(List, List, 0, 0, [], X), !.
max_repeat([], _, MaxNum, _, _, MaxNum):-!.
max_repeat([H|T], List, MaxNum, MaxCount, Cache, X):- in_list(Cache, H), max_repeat(T, List, MaxNum, 
																					MaxCount, Cache, X), !.
max_repeat([H|T], List, _, MaxCount, Cache, X):- count_repeat(List, H, Y), 
													Y>MaxCount, append(Cache, [H], NewCache), 
													max_repeat(T, List, H, Y, NewCache, X), !.
max_repeat([H|T], List, MaxNum, MaxCount, Cache, X):- append(Cache, [H], NewCache),
													max_repeat(T, List, MaxNum, MaxCount, NewCache, X),!.

%get_indices/0.
%DESCRIPTION:
%Сценарий для нахождения индексов максимального элемента.
get_indices:-
	write("Task 48: Finds max element indices"), nl,
	write("Enter list length"), nl, read(Len),
	write("Enter list elements"), nl, read_list(List, Len),
	write("Answer: "), max_repeat(List, Max), nl,
	get_indices(List, Max, Answer), write_list(Answer).

%get_indices(+List, +El, -Result)
%DESCRIPTION:
%Получает лист индексов элементов равных El
get_indices(List, El, Result):- get_indices(List, El, [], Result, 0), !.
get_indices([], _, Cache, Cache, _):-!.
get_indices([H|T], El, Cache, Result, Index):- H==El, NewIndex is Index+1, append(Cache,[Index], NewCache),
									get_indices(T, El, NewCache, Result, NewIndex), !.
get_indices([_|T], El, Cache, Result, Index):- NewIndex is Index + 1, get_indices(T, El, Cache, Result, NewIndex), !.

%get_average(+X, -Y)
%DESCRIPTION:
%Считает среднюю арифметическую в списке X
get_average(List, Average):- sum_list_up(List, Sum), length(List, Len), Average is Sum/Len.

%get_max(+X, -Y)
%DESCRIPTION:
%Находит максимальное число в списке
get_max([], 0):-!.
get_max([H|T], Y):- get_max(T, Y1), (H>Y1->Y is H; Y is Y1),!.

%list_between(+List, +A, +B, -Result)
%DESCRIPTION:
%Возвращает список из чисел которые лежат в интервале A..B
list_between(List, Result):- get_average(List, A), get_max(List, Max), 
							A1 is (integer(A)+1), list_between(Max, A1, Result),!.
list_between(B, B, []):-!.
list_between(B, Cur, Result):-Cur1 is Cur+1, list_between(B, Cur1, Result1), append(Result1,[Cur], Result).

%list_between/0.
%DESCRIPTION:
%Сценарий для нахождения элементов листа, которые лежат в интервале 
%от среднего значения до его максиального значение.
list_between:-
	write("Task 53: Find list with condition"), nl,
	write("Enter list length"), nl, read(Len),
	write("Enter list elements"), nl, read_list(List, Len),
	write("Answer: "), list_between(List, Answer), nl, 
	write_list(Answer).

%get_special_list(+X, -Y)
%DESCRIPTION:
%Составляет список квадратов неотрицательных элементов списка, меньших 100
%и встречающихся в массиве больше двух раз
get_special_list(List, Result):- get_special_list(List, List, [], Result).
get_special_list([],_, _, _):-!.
get_special_list([H|T], List, Cache, Result):- H>0, H<100, in_list(Cache, H), get_special_list(T, List, Cache, Result), !.
get_special_list([H|T], List, Cache, Result):- H>0, H<100, append(Cache, [H], Cache1),
                                        count_repeat(List, H, Count), Count>1,
                                        get_special_list(T, List, Cache1, Result1),
                                        H2 is H*H, append(Result1,[H2], Result),!.
get_special_list([H|T], List, Cache, Result):- H>0, H<100, append(Cache, [H], Cache1),
                                        get_special_list(T, List, Cache1, Result), !.
get_special_list([_|T], List, Cache, Result):- get_special_list(T, List, Cache, Result).

%get_special_list/0
%DESCRIPTION:
%Сценарий составления списка квадратов неотрицательных элементов списка, меньших 100
%и встречающихся в массиве больше двух раз
get_special_list:-
	write("Task 59: Find list with condition"), nl,
	write("Enter list length"), nl, read(Len),
	write("Enter list elements"), nl, read_list(List, Len),
	write("Answer: "), get_special_list(List, Answer), nl, 
	write_list(Answer).