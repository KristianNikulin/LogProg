% Условие лабораторной работы http://www.soshnikov.com/courses/prolog/labs/lab4.pdf

prefix_dictionary(L) :- L =
[
['з','а'] : 'за',
['и','з'] : 'из',
['в','ы'] : 'вы',
['о','б'] : 'об',
['п','е','р','е'] : 'пере',
['н','е','д','о'] : 'недо'
].


root_dictionary(L) :- L =
[
['у','ч'] : 'уч'
].


ending_dictionary(L) :- L =
[
['и','л'] : 'ил',
['и','т'] : 'ит',
['и','л','а'] : 'ила',
['и','л','о'] : 'ило',
['и','л','и'] : 'или'
].


gender_dictionary(L) :- L =
[
'а' : 'женский',
'о' : 'средний',
'л' : 'мужской',
'т' : 'мужской',
'и' : 'неопределенный'
].


count_dictionary(L) :- L =
[
'и' : 'множественное',
'а' : 'единственное',
'о' : 'единственное',
'л' : 'единственное',
'т' : 'единственное'
].


an_morf(Word, morph(Prefix, Root, Ending, Gender, Count)) :-
	append(X, End, Word),
	append(Pref, Roott, X),
	prefix(Pref, Prefix),
	root(Roott, Root),
	ending(End, Ending),
	gender(End, Gender),
	count(End, Count),
	!.


prefix(X, prist(X1)) :- % приставка
	prefix_dictionary(L),
	find(X1, X, L).


root(X, kor(X1)) :- % корень
	root_dictionary(L),
	find(X1, X, L).


ending(X, okon(X1)) :- % окончание
	ending_dictionary(L),
	find(X1, X, L).


gender([X], rod(X1)) :- % род
	gender_dictionary(L),
	find(X1, X, L).

gender([_ | T], rod(X1)) :- 
	gender(T, rod(X1)).


count([X], chislo(Y)) :- % число
	count_dictionary(L),
	find(Y, X, L).

count([_ | T], chislo(Y)) :-
	count(T, chislo(Y)).

find(Y, X, L) :-
	member(M, L),
	states(Y, X, M).
	
	
states(Y, X, X : Y).
