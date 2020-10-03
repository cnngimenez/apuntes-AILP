%% Optimizacion
%% - Salida 
%%     #+REVEAL_HTML: <div style="font-size: 130%;">

%% [[file:~/repos/curso-AILP/ailp.org::*Optimizacion][Optimizacion:1]]
:- module(exponential_ac_out,[ent/2],[assertions]).

:- entry ent(Base,_A)
   : int(Base).

ent(A,B) :-
    C is A,
    D is C*A,
    E is D*A,
    exp_ac_1(A,E,B).

exp_ac_1(_1,A,A).
%% Optimizacion:1 ends here
