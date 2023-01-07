% Условие лабораторной работы http://www.soshnikov.com/courses/prolog/labs/lab3.pdf

% исключения

exception('Wolf', 'Goat').
exception('Goat', 'Wolf').
exception('Cabbage', 'Goat').
exception('Goat', 'Cabbage').

add(E, [], [E]).
add(E, [H|T], [H|T1]) :- add(E, T, T1).

print_result([]).
print_result([A|T]) :- print_result(T), write(A), nl.

check([Object_1, Object_2]) :- exception(Object_1, Object_2).

% возможные переходы из начального состояния

move(s([Object_1, Object_2, Object_3], 'L', []), s([Object_1, Object_2], 'R', [Object_3])) :- not(check([Object_1, Object_2])).
move(s([Object_1, Object_2, Object_3], 'L', []), s([Object_1, Object_3], 'R', [Object_2])) :- not(check([Object_1, Object_3])).
move(s([Object_1, Object_2, Object_3], 'L', []), s([Object_2, Object_3], 'R', [Object_1])) :- not(check([Object_2, Object_3])).

% проверка, что если лодка на правом берегу и в ней два объекта, которые можно оставлять вместе, то лодка плывет на левый берег

move(s([Left|T], 'R', Right), s([Left|T], 'L', Right)) :- not(check(Right)).
move(s(Left, 'R', [Object_1, Object_2]), s(Out, 'L', [Object_2])) :- check([Object_1, Object_2]), add(Object_1, Left, Out).

% перемещение объектов

move(s([L|LT], 'L', [R|RT]), s(LT, 'R', Out)) :- add(L, [R|RT], Out).
move(s([X, L|LT], 'L', [R|RT]), s([X|LT], 'R', Out)) :- add(L, [R|RT], Out).

prolong([In|InT], [Out, In|InT]) :- move(In, Out), not(member(Out, [In|InT])).

int(1).
int(X) :- int(Y), X is Y + 1.

% поиск в глубину с итерационным углублением (iterative deepening)

id_search(Start, Finish) :-
    get_time(ITER),
    int(DepthLimit),
    id_depth([Start], Finish, Res, DepthLimit),
    print_result(Res),
    get_time(ITER1), nl,
    T1 is ITER1 - ITER,
    write('TIME '), write(T1), nl.
    
id_search(Start, Finish, Path) :- int(Level), id_search(Start, Finish, Path, Level).

id_depth([Finish|T], Finish, [Finish|T], 0).

id_depth(Path, Finish, R, N) :-
    N > 0,
    prolong(Path, NewPath),
    N1 is N - 1,
    id_depth(NewPath, Finish, R, N1).
    
% поиск в ширину

search_in_width(X, Y) :-
    get_time(BFS),
    width([[X]], Y, L),
    print_result(L),
    get_time(BFS1), nl,
    T1 is BFS1 - BFS,
    write('TIME '), write(T1), nl.

width([[B|T]|_], B, [B|T]).

width([H|QT], X, R) :-
    findall(Z, prolong(H, Z), T),
    append(QT, T, OutQ), !,
    width(OutQ, X, R).
    
width([_|T], X, R) :- width(T, X, R).

% поиск в глубину

search_in_depth(A, B) :-
    get_time(DFS),
    depth([A], B, L),
    print_result(L),
    get_time(DFS1), nl,
    T1 is DFS1 - DFS,
    write('TIME '), write(T1), nl.

depth([X|T], X, [X|T]).

depth(P, F, L) :- prolong(P, P1), depth(P1, F, L).
