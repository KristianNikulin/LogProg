% Первая часть задания - предикаты работы со списками

% Номер по списку - 16

% Длина списка
list_length([], 0).
list_length([_|Y], N) :- list_length(Y, N1), N is N1 + 1.

% Принадлежность элемента списку
list_member(Head, [Head|_]).
list_member(Head, [_|Tail]) :- list_member(Head, Tail).

% Конкатeнация списков
list_append([], X, X).
list_append([L|X], Y, [L|Z]) :- list_append(X, Y, Z).

% Удаление элемента из списка
list_remove(X, [X|T], T).
list_remove(X, [Y|T], [Y|Z]) :- list_remove(X, T, Z).

% Перестановки элементов в списке
list_permute([], []).
list_permute(L, [X|T]) :- list_remove(X, L, R), list_permute(R, T).

% Подсписки списка
list_sublist([], []).
list_sublist(X, L) :- list_append(_, L1, L), list_append(X, _, L1).

%

% Предикаты обработки списков
% 17. Отделение хвоста, начиная с элемента с данным значением

% 1 способ
list_delete_1(L, X, R) :- append(R, [X|_], L), !.
list_delete_1(L, X, R) :- append(R, [], L).
%?- list_delete_1([1, 2, 3, 4, 5, 6, 7, 8, 9], 5, X).
% X = [1, 2, 3, 4]
%?- list_delete_1([6, 7, 8, 9], 6, X).
% X = []

% 2 способ
list_delete_2([], X, []) :- !.
list_delete_2([X|T], X, []) :- !.
list_delete_2([H|T], X, [H|R]) :- list_delete_2(T, X, R).
%?- list_delete_2([1, 2, 3, 4, 5, 6, 7, 8, 9], 5, X).
% X = [1, 2, 3, 4]
%?- list_delete_2([6, 7, 8, 9], 6, X).
% X = []

%

% Пример совместного использования предикатов
% Отделение хвоста, начиная с элемента с данным значением, подсчет и вывод длины получившегося списка

list_delete_length(L, X, Answer) :- list_delete_1(L, X, L2), length(L2, Answer).
%?- list_delete_length([1, 2, 3, 4, 5, 6, 7, 8, 9], 5, Len).
% Len = 4
%?- list_delete_length([6, 7, 8, 9], 6, Len).
% Len = 0

%

% Предикаты обработки числовых списков
% 2. Вычисление произведения элементов

list_multiplication([], 1).
list_multiplication([Head|Tail], X) :- list_multiplication(Tail, X1), X is Head * X1.
%?- list_multiplication([1, 2, 3, 4, 5], X).
% X = 120
%?- list_multiplication([5, 5, 5, 5], X).
% X = 625
