%% Optimización
%% - Entrada
%%     #+REVEAL_HTML: <div style="font-size: 130%;">

%% [[file:~/repos/curso-AILP/ailp.org::*Optimización][Optimización:1]]
:- module(dup.pl, [dup_first/2], []).

dup_first([X|Xs], Zs) :-
    app([X], [X|Xs], Zs).

app([],Y,Y).
app([X|Xs], Ys, [X|Zs]) :-
    app(Xs,Ys,Zs).
%% Optimización:1 ends here
