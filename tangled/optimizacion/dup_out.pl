 
%%     #+REVEAL_HTML: </div>

%% - Salida 
%%     #+REVEAL_HTML: <div style="font-size: 130%;">

%% [[file:~/repos/curso-AILP/ailp.org::*Optimización][Optimización:2]]
:- module(dup_out.pl,[dup_first/2],[assertions]).

dup_first([A|B],[A,A|B]).
%% Optimización:2 ends here
