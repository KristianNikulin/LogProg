:- encoding(utf8).
:- ['family_tree.pl'].

% Реализовать программу на языке Prolog, которая позволит определять степень родства двух произвольных индивидуумов в дереве

father(X, Y) :- child(Y, X), male(X), X \= Y.
mother(X, Y) :- child(Y, X), female(X), X \= Y.

son(X, Y) :- child(X, Y), male(X), X \= Y.
daughter(X, Y) :- child(X, Y), female(X), X \= Y.

husband(X, Y) :- child(Z, X), child(Z, Y), male(X), X \= Y.
wife(X, Y) :- child(Z, X), child(Z, Y), female(X), X \= Y.

brother(X, Y) :- child(X, Z), child(Y, Z), male(X), X \= Y.
sister(X, Y) :- child(X, Z), child(Y, Z), female(X),  X \= Y.

% отношения
kinship('father', Father, Child) :- father(Father, Child).
kinship('mother', Mother, Child) :-  mother(Mother, Child).
kinship('son', Child, Parent) :- son(Child, Parent).
kinship('daughter', Child, Parent) :- daughter(Child, Parent).
kinship('husband', Husband, Wife) :- husband(Husband, Wife).
kinship('wife', Wife, Husband) :- wife(Wife, Husband).
kinship('brother', Brother, Y) :- brother(Brother, Y).
kinship('sister', Sister, Y) :- sister(Sister, Y).

perm(X, Y) :- kinship(_, X, Y).
prolong([X | T], [Y, X | T]) :- perm(X, Y), not(member(Y, [X | T])).

bfs([[H | T] | _], H, [H | T]).
bfs([H|T], Res, Tree) :- findall(W, prolong(H, W), Trees), append(T, Trees, Newtrees), !, bfs(Newtrees, Res, Tree).

find([_], R, R).
find([X, Y | T], R, Relation) :- kinship(Re, X, Y), find([Y | T], [Re | R], Relation).

relative(Relation, X, Y) :- bfs([[X]], Y, R), reverse(R, Re), find(Re, [], Newrel), reverse(Newrel, Relation), N is 0.