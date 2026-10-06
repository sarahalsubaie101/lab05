% Gender
male(abraham).
male(herb).
male(homer).
male(bart).

female(mona).
female(marge).
female(lisa).
female(maggie).
female(patty).
female(selma).
female(ling).

% Parent relationships
parent(abraham, herb).
parent(mona, herb).

parent(abraham, homer).
parent(mona, homer).

parent(clancy, marge).
parent(jackie, marge).

parent(clancy, patty).
parent(jackie, patty).

parent(clancy, selma).
parent(jackie, selma).

parent(homer, bart).
parent(marge, bart).

parent(homer, lisa).
parent(marge, lisa).

parent(homer, maggie).
parent(marge, maggie).

parent(selma, ling).

% Father
father(X,Y) :-
    male(X),
    parent(X,Y).

% Mother
mother(X,Y) :-
    female(X),
    parent(X,Y).

% Son
son(X,Y) :-
    male(X),
    parent(Y,X).

% Daughter
daughter(X,Y) :-
    female(X),
    parent(Y,X).

% Brother
brother(X,Y) :-
    male(X),
    parent(P,X),
    parent(P,Y),
    X \= Y.

% Sister
sister(X,Y) :-
    female(X),
    parent(P,X),
    parent(P,Y),
    X \= Y.

% Grandfather
grandfather(X,Y) :-
    male(X),
    parent(X,Z),
    parent(Z,Y).

% Aunt
aunt(X,Y) :-
    female(X),
    parent(P,Y),
    sister(X,P).

% Uncle
uncle(X,Y) :-
    male(X),
    parent(P,Y),
    brother(X,P).

% Cousin
cousin(X,Y) :-
    parent(P1,X),
    parent(P2,Y),
    sibling(P1,P2),
    X \= Y.

% Helper rule for cousin
sibling(X,Y) :-
    parent(P,X),
    parent(P,Y),
    X \= Y.

% Ancestor
ancestor(X,Y) :-
    parent(X,Y).

ancestor(X,Y) :-
    parent(X,Z),
    ancestor(Z,Y).
