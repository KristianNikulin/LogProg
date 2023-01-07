% Вариант 16

data(L) :- member(boris, L), not(member(kostya, L)), !, fail.
data(L) :- member(kostya, L), member(vasiliy, L), !, fail.
data(L) :- member(dima, L), not(member(yura, L)), !, fail.
data(L) :- member(fedya, L), member(dima, L), not(member(grisha, L)), !, fail.
data(L) :- member(fedya, L), member(kostya, L), not(member(dima, L)), !, fail.
data(L) :- member(grisha, L), member(kostya, L), member(boris, L), !, fail.
data(L) :- member(grisha, L), member(andrey, L), !, fail.
data(L) :- member(grisha, L), member(vasiliy, L), !, fail.
data(L) :- member(yura, L), not(member(boris, L)), not(member(fedya, L)), !, fail.
data(L) :- member(yura, L), member(kostya, L), not(member(grisha, L)), !, fail.
data(L) :- member(yura, L), member(andrey, L), !, fail.
data(L) :- member(yura, L), member(vasiliy, L), !, fail.
data(_).

solve(L) :- permutation([X1, X2, X3, X4, X5, X6, X7, X8], 
            [andrey, boris, kostya, vasiliy, grisha, dima, fedya, yura]), 
            data([X1, X2, X3, X4]), 
            L=[X1, X2, X3, X4], !.
