 
%%     #+REVEAL_HTML: </div>

%% - Salida 
%%     #+REVEAL_HTML: <div style="font-size: 110%;">

%% [[file:~/repos/curso-AILP/ailp.org::*Optimización][Optimización:2]]
:- module(append_out,[appe/3],[assertions]).

:- entry appe(A,B,C).

appe([],A,[1,2,3|A]).
appe([B|C],A,[1,2,3,B|D]) :-
    append_1(C,A,D).

append_1([],A,A).
append_1([B|C],A,[B|D]) :-
    append_1(C,A,D).
%% Optimización:2 ends here
