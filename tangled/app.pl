%% Analisis
%% - Entrada
%%     #+REVEAL_HTML: <div style="font-size: 130%;">

%% [[file:~/repos/curso-AILP/ailp.org::*Analisis][Analisis:1]]
:- module(app, [app/3], [assertions]).

:- entry app(A,B,C) : (list(A), list(B)).

app([],Y,Y).
app([X|Xs], Ys, [X|Zs]) :- app(Xs,Ys,Zs).
%% Analisis:1 ends here
