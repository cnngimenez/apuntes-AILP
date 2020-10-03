%% Certificación
%% - Entrada
%%     #+REVEAL_HTML: <div style="font-size: 130%;">

%% [[file:~/repos/curso-AILP/ailp.org::*Certificación][Certificación:1]]
:- module(multiply,_,[assertions]).

:- entry mmultiply(X,Y,Z): (var(Z),list(X,list(num)),list(Y,list(num))).
:- entry mmultiply(X,Y,Z) : (var(Z),ground(X),ground(Y)). 


mmultiply([],_,[]).
mmultiply([VO|Rest],V1,[Result|Others]):-
    mmultiply(Rest,V1,Others),
    multiply(V1,VO,Result).

multiply([],_,[]).
multiply([VO|Rest],VI,[Result|Others]):-
    multiply(Rest,VI,Others),
    vmul(VO,VI,Result).

vmul([],[],0).
vmul([H1|T1],[H2|T2],Result):-
    vmul(T1,T2,Newresult),
    Product is H1*H2,
    Result is Product+Newresult.
%% Certificación:1 ends here
