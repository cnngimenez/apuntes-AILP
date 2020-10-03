%% Debugging
%% - Entrada
%%     #+REVEAL_HTML: <div style="font-size: 130%;">

%% [[file:~/repos/curso-AILP/ailp.org::*Debugging][Debugging:1]]
:- module(qsort2, [qsort/2], [assertions]).

:- entry qsort(A,B) : (list(num, A), var(B)).

qsort([X|L],R) :-
    partition(L,L1,X,L2),  % <-- swapped second and third arguments
    qsort(L2,R2), qsort(L1,R1),
    append(R2,[X|R1],R).
qsort([],[]).

partition([],_B,[],[]).
partition([e|R],C,[E|Left1],Right):-  % <-- 'e' should be E (variable)
    E < C, !, partition(R,C,Left1,Right).
partition([E|R],C,Left,[E|Right1]):-
    E >= C, partition(R,C,Left,Right1).

append([],X,X).
append([H|X],Y,[H|Z]):- append(X,Y,Z).
%% Debugging:1 ends here
