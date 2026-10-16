% Алхам 2: Баримтууд
male(bataa). male(bold). male(tomor). male(dorj). male(zolboo). male(munkh). male(bat). male(temuulen).
female(saraa). female(oyuna). female(tsetseg). female(ganaa). female(anar). female(naraa). female(enkhee).

% Ижил предикатууд нэг дор цуг байх ёстой (discontiguous warning-оос сэргийлж)
parent(bataa, bold). parent(saraa, bold).
parent(bataa, oyuna). parent(saraa, oyuna).
parent(bataa, tomor). parent(saraa, tomor).
parent(bold, anar). parent(tsetseg, anar).
parent(bold, zolboo). parent(tsetseg, zolboo).
parent(dorj, munkh). parent(oyuna, munkh).
parent(dorj, naraa). parent(oyuna, naraa).
parent(tomor, enkhee). parent(ganaa, enkhee).
parent(bat, temuulen). parent(anar, temuulen).

% Алхам 3: Энгийн дүрэм
father(X, Y) :- parent(X, Y), male(X).
mother(X, Y) :- parent(X, Y), female(X).
son(X, Y) :- parent(Y, X), male(X).
daughter(X, Y) :- parent(Y, X), female(X).

person(X) :- male(X).
person(X) :- female(X).

% Алхам 4: Өвөө эмээ ба ах дүү
grandparent(X, Y) :- parent(X, Z), parent(Z, Y).
sibling(X, Y) :- parent(Z, X), parent(Z, Y), X \= Y.

% Алхам 5: Ураг төрлийн дүрмүүд
brother(X, Y) :- sibling(X, Y), male(X).
sister(X, Y) :- sibling(X, Y), female(X).
uncle(X, Y) :- brother(X, Z), parent(Z, Y).
aunt(X, Y) :- sister(X, Z), parent(Z, Y).
cousin(X, Y) :- parent(Z, X), sibling(Z, W), parent(W, Y).

% Алхам 6: Рекурсив дүрэм
ancestor(X, Y) :- parent(X, Y).
ancestor(X, Y) :- parent(X, Z), ancestor(Z, Y).
descendant(X, Y) :- ancestor(Y, X).

% Алхам 7: Асуулт ба үгүйсгэл
has_child(X) :- parent(X, _).
childless(X) :- person(X), \+ has_child(X).
great_grandparent(X, Y) :- parent(X, Z), grandparent(Z, Y).