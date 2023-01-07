:- encoding(utf8).
:- ['family_tree.pl'].

husband(Man, Woman) :-
    male(Man),
    female(Woman),
    child(Child, Man),
    child(Child, Woman).

brother(Person, Brother) :-
    male(Person),
    male(Brother),
    child(Person, Parent),
    child(Brother, Parent),
    not(Person = Brother).

dever(Woman, Y) :-
    husband(Husband, Woman),
    brother(Husband, Y).
