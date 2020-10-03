%% Aserciones
%% - estado de las aserciones
%%   - ~check~  (default) -- Es la semántica intentada, para ser
%%     chequeada, es la especificación del programa, ingresada por el usuario.
%%   - ~trust~ -- semántica real, ingresada por el usuario y creída por
%%     el compilador (es una guía).
%%   - ~true~ o ~false~ -- semántica real, salida del compilador.
%%   - ~checked~ -- validación: es un ~check~ que ha sido probado. (igual
%%     a ~true~).
%% - ejemplo
%%    #+REVEAL_HTML: <div style="font-size: 130%;">

%% [[file:~/repos/curso-AILP/ailp.org::*Aserciones][Aserciones:1]]
:- trust pred is(X,Y) => (num(X),numexpr(Y)).

:- check pred p/2 : list(int) * var => list(int) * int.
:- modedef +X : nonvar(X).
:- check pred sortints(+L,-SL) :: list(int) * list(int) + sorted(SL)
                               # "@var{SL} has same elements as @var{L}.".
%% Aserciones:1 ends here

%% Propiedades del estado de éxito
%% #+ATTR_REVEAL: :frag (roll-in)
%% - Propiedades del estado de *éxito*.  Son similiares en naturaleza a
%%   las /postcondiciones/ usadas en verificación de programas
%%    #+REVEAL_HTML: <div style="font-size: 150%;">

%% [[file:~/repos/curso-AILP/ailp.org::*Propiedades del estado de éxito][Propiedades del estado de éxito:1]]
:- success Goal => Postcond.
%% Propiedades del estado de éxito:1 ends here

 
%%    #+REVEAL_HTML: </div>
%%     debe ser interpretada como "para toda llamada de la forma ~Goal~ que
%%    tiene éxito, al momento del éxito ~Postcond~ debería ser verdadero".

%% - Restricción de las aserciones a un subconjunto de las llamadas
%%    #+REVEAL_HTML: <div style="font-size: 150%;">

%% [[file:~/repos/curso-AILP/ailp.org::*Propiedades del estado de éxito][Propiedades del estado de éxito:2]]
:- success Goal : Precond => Postcond.
%% Propiedades del estado de éxito:2 ends here

%% Propiedades en la llamada y computación
%% #+ATTR_REVEAL: :frag (roll-in)
%% - Propiedades en el estado de llamada de un predicado que pueden
%%   aparecer en tiempo de ejecución. 
%%    #+REVEAL_HTML: <div style="font-size: 150%;">

%% [[file:~/repos/curso-AILP/ailp.org::*Propiedades en la llamada y computación][Propiedades en la llamada y computación:1]]
:- calls Goal : Cond.
%% Propiedades en la llamada y computación:1 ends here


%%    #+REVEAL_HTML: </div>
%%     se debe interpretar "toda llamada de la forma ~Goal~ debería
%%   satisfacer ~Cond~".
%% - Propiedades de la computación
%%    #+REVEAL_HTML: <div style="font-size: 150%;">

%% [[file:~/repos/curso-AILP/ailp.org::*Propiedades en la llamada y computación][Propiedades en la llamada y computación:2]]
:- comp Goal : Precond  + Comp_prop.
%% Propiedades en la llamada y computación:2 ends here

%% Composición de Aserciones 
%% Para facilitar la escritura una aserción compuesta de un predicado
%% puede ser usado como azúcar sintáctico para las aserciones básicas. La
%% aserción compuesta siguiente

%%    #+REVEAL_HTML: <div style="font-size: 150%;">

%% [[file:~/repos/curso-AILP/ailp.org::*Composición de Aserciones][Composición de Aserciones:1]]
:- pred Pred : Precond => Postcond + Comp_prop.
%% Composición de Aserciones:1 ends here


%% #+REVEAL_HTML: </div>

%% corresponde a la siguiente aserción de éxito:

%% #+REVEAL_HTML: <div style="font-size: 150%;">

%% [[file:~/repos/curso-AILP/ailp.org::*Composición de Aserciones][Composición de Aserciones:2]]
:- success Pred : Precond => Postcond.
%% Composición de Aserciones:2 ends here


%% #+REVEAL_HTML: </div>

%% si la aserción ~pred~ tiene un campo ~=>~ (y un campo
%% ~:~). También corresponde a una aserción de computación de la forma:

%% #+REVEAL_HTML: <div style="font-size: 150%;">

%% [[file:~/repos/curso-AILP/ailp.org::*Composición de Aserciones][Composición de Aserciones:3]]
:- comp Pred : Precond + Comp_prop.
%% Composición de Aserciones:3 ends here

%% Ejemplo de aserciones compuestas
%% - Consideremos el programa clasico quicksort ~qsort~ . Podemos usar la
%% siguiente aserción para requerir que la salida del procedimiento
%% ~qsort~ sea una lista.

%%    #+REVEAL_HTML: <div style="font-size: 150%;">

%% [[file:~/repos/curso-AILP/ailp.org::*Ejemplo de aserciones compuestas][Ejemplo de aserciones compuestas:1]]
:- success qsort(A,B) => list(B).
%% Ejemplo de aserciones compuestas:1 ends here

 
%%    #+REVEAL_HTML: </div>

%% - alternativamente podemos requerir que ~qsort~ es llamado con una
%%   lista en su primer argumento y tiene exito, entonces el segundo
%%   argumento también sera una lista.

%%    #+REVEAL_HTML: <div style="font-size: 150%;">

%% [[file:~/repos/curso-AILP/ailp.org::*Ejemplo de aserciones compuestas][Ejemplo de aserciones compuestas:2]]
:- success qsort(A,B) : list(A) => list(B).
%% Ejemplo de aserciones compuestas:2 ends here

%% Ejemplo de aserciones compuestas (cont.)
%% - Además podemos requerir que en todas las llamadas al predicado
%%   ~qsort~ el primer argumento debe ser una lista:

%%    #+REVEAL_HTML: <div style="font-size: 150%;">

%% [[file:~/repos/curso-AILP/ailp.org::*Ejemplo de aserciones compuestas (cont.)][Ejemplo de aserciones compuestas (cont.):1]]
:- calls qsort(A,B) : list(A).
%% Ejemplo de aserciones compuestas (cont.):1 ends here

 
%%    #+REVEAL_HTML: </div>

%% - El procedimiento ~qsort~ debe ordenar cualquier lista. Asi,
%%   requeriremos que todas las llamadas con una lista en el primer
%%   argumento y una variable en el segundo no fallen:

%%    #+REVEAL_HTML: <div style="font-size: 150%;">

%% [[file:~/repos/curso-AILP/ailp.org::*Ejemplo de aserciones compuestas (cont.)][Ejemplo de aserciones compuestas (cont.):2]]
:- comp qsort(A,B) : (list(A) , var(B)) + does_not_fail.
%% Ejemplo de aserciones compuestas (cont.):2 ends here

%% Ejemplo de aserciones compuestas (cont.)

%% En lugar de todas estas aserciones se puede usar la compuesta:

%%    #+REVEAL_HTML: <div style="font-size: 130%;">

%% [[file:~/repos/curso-AILP/ailp.org::*Ejemplo de aserciones compuestas (cont.)][Ejemplo de aserciones compuestas (cont.):1]]
:- pred qsort(A,B) : (list(A) , var(B)) => list(B) + does_not_fail.
%% Ejemplo de aserciones compuestas (cont.):1 ends here

 
%%    #+REVEAL_HTML: </div>

%% que es equivalente a: 

%%    #+REVEAL_HTML: <div style="font-size: 130%;">

%% [[file:~/repos/curso-AILP/ailp.org::*Ejemplo de aserciones compuestas (cont.)][Ejemplo de aserciones compuestas (cont.):2]]
:- calls qsort(A,B) : (list(A), var(B)).
:- success qsort(A,B) : (list(A), var(B)) => list(B).
:- comp qsort(A,B) : (list(A) , var(B)) + does_not_fail.
%% Ejemplo de aserciones compuestas (cont.):2 ends here

%% Ejemplo de aserciones compuestas (cont.)

%% si queremos llamar a ~qsort~ con algo diferente a una variable en el
%% segundo argumento se debe agregar:

%%    #+REVEAL_HTML: <div style="font-size: 130%;">

%% [[file:~/repos/curso-AILP/ailp.org::*Ejemplo de aserciones compuestas (cont.)][Ejemplo de aserciones compuestas (cont.):1]]
:- pred qsort(A,B) : (list(A) , var(B)) => list(B) + does_not_fail.
:- pred qsort(A,B) : list(A) => list(B).
%% Ejemplo de aserciones compuestas (cont.):1 ends here

 
%%    #+REVEAL_HTML: </div>

%% que es equivalente a: 

%%    #+REVEAL_HTML: <div style="font-size: 130%;">

%% [[file:~/repos/curso-AILP/ailp.org::*Ejemplo de aserciones compuestas (cont.)][Ejemplo de aserciones compuestas (cont.):2]]
:- calls qsort(A,B) : ((list(A), var(B)) ; list(A)).
:- success qsort(A,B) : ((list(A), var(B)) ; list(A)). => list(B).
:- comp qsort(A,B) : (list(A) , var(B)) + does_not_fail.
%% Ejemplo de aserciones compuestas (cont.):2 ends here

%% Tipos Regulares

%% Tipos Regulares son propiedades cuyas definiciones son  /"programas
%% regulares"/. Ejemplos:

%%    #+REVEAL_HTML: <div style="font-size: 130%;">

%% [[file:~/repos/curso-AILP/ailp.org::*Tipos Regulares][Tipos Regulares:1]]
:- regtype tree(X) # "X is a tree.".

tree(nil).
tree(t(_,L,R)):- 
     tree(L),
     tree(R).

:- regtype intlist(X) # "X is a list of integers"

intlist([]).
intlist([X|R]) :- int(X), intlist(R).
%% Tipos Regulares:1 ends here

%% Lenguaje de aserciones
%%  - ejemplo de ~pred/1~ 
%%     #+REVEAL_HTML: <div style="font-size: 130%;">

%% [[file:~/repos/curso-AILP/ailp.org::*Lenguaje de aserciones][Lenguaje de aserciones:1]]
:- pred length(L,N) : list * var => list * integer 
# "Computes the length of L.".
:- pred length(L,N) : var * integer => list * integer  
# "Outputs L of length N.".
:- pred length(L,N) : list * integer => list * integer
# "Checks that L is of length N.".
%% Lenguaje de aserciones:1 ends here


%%    #+REVEAL_HTML: </div>
%% - ejemplo de ~pred/2~
%%    #+REVEAL_HTML: <div style="font-size: 130%;">

%% [[file:~/repos/curso-AILP/ailp.org::*Lenguaje de aserciones][Lenguaje de aserciones:2]]
:- check pred length(L,N) : list * var => list * integer.
%% Lenguaje de aserciones:2 ends here


%%    #+REVEAL_HTML: </div>

%% - ejemplo de ~comp/1~
%%    #+REVEAL_HTML: <div style="font-size: 130%;">

%% [[file:~/repos/curso-AILP/ailp.org::*Lenguaje de aserciones][Lenguaje de aserciones:3]]
:- comp append(Xs,Ys,Zs) : var * var * var + not_fail.
%% Lenguaje de aserciones:3 ends here


%%    #+REVEAL_HTML: </div>

%% - ~test~ es similar a ~success~ pero especifica un caso de test como
%%   parte de la especificación del predicado
%%    #+REVEAL_HTML: <div style="font-size: 130%;">

%% [[file:~/repos/curso-AILP/ailp.org::*Lenguaje de aserciones][Lenguaje de aserciones:4]]
:- test length(L,N) : ( L = [1,2,5,2] ) => ( N = 4 ).
%% Lenguaje de aserciones:4 ends here

%% Lenguaje de aserciones (cont.)

%% - definición de nuevos modos

%%     #+REVEAL_HTML: <div style="font-size: 130%;">

%% [[file:~/repos/curso-AILP/ailp.org::*Lenguaje de aserciones (cont.)][Lenguaje de aserciones (cont.):1]]
:- modedef +A : nonvar(A) # "A is bound upon predicate entry.".

:- pred p(+A,B) : integer(A) =>  ground(B).
%% Lenguaje de aserciones (cont.):1 ends here


%% #+REVEAL_HTML: </div>
%% es equivalente a:
%% #+REVEAL_HTML: <div style="font-size: 130%;">

%% [[file:~/repos/curso-AILP/ailp.org::*Lenguaje de aserciones (cont.)][Lenguaje de aserciones (cont.):2]]
:- pred p(A,B) : (nonvar(A),integer(A)) =>  ground(B)
                         # "A is bound upon predicate entry.".
%% Lenguaje de aserciones (cont.):2 ends here

 
%%     #+REVEAL_HTML: </div>

%% - documentación 
  
%%    #+REVEAL_HTML: <div style="font-size: 130%;">

%% [[file:~/repos/curso-AILP/ailp.org::*Lenguaje de aserciones (cont.)][Lenguaje de aserciones (cont.):3]]
:- doc(Pred,Comment). 

:- doc(p(A,B),"A is bound upon predicate entry.").
%% Lenguaje de aserciones (cont.):3 ends here

 
%%     #+REVEAL_HTML: </div>

%% - Salida 
%%     #+REVEAL_HTML: <div style="font-size: 130%;">

%% [[file:~/repos/curso-AILP/ailp.org::*Analisis][Analisis:2]]
:- true pred app(A,B,C) : ( list(A), list(B), term(C) )
                            => ( list(A), list(B), list(C) ).

:- true pred app(A,B,C) 
   : mshare([[A],[A,B],[A,B,C],[A,C],[B],[B,C],[C]])
   => mshare([[A,B,C],[A,C],[B,C]]).
%% Analisis:2 ends here

%% Analisis 
%% - dominio shfr sin el ~:- entry ... ~ 
%%   #+REVEAL_HTML: <div style="font-size: 130%;">

%% [[file:~/repos/curso-AILP/ailp.org::*Analisis][Analisis:1]]
:- true pred qsort(_A,R)
   : mshare([[_A],[_A,R],[R]])
   => mshare([[_A,R]]).

:- true pred partition(_A,_B,Left,Right)
   : ( mshare([[_A],[_A,_B],[_B],[Left],[Right]]), var(Left), var(Right) )
   => ( mshare([[_B]]), ground([_A,Left,Right]) ).

:- true pred append(_A,X,_B)
   : ( mshare([[X],[X,_B],[_B]]), ground([_A]) )
   => ( mshare([[X,_B]]), ground([_A]) ).
%% Analisis:1 ends here

%% Analisis 
%% - dominio shfr con el ~:- entry qsort(A,B) : (list(num, A), var(B)).~ 
%%   #+REVEAL_HTML: <div style="font-size: 130%;">

%% [[file:~/repos/curso-AILP/ailp.org::*Analisis][Analisis:1]]
:- true pred qsort(A,B)
   : ( mshare([[B]]), var(B), ground([A]) )
   => ground([A,B]).

:- true pred partition(_A,_B,Left,Right)
   : ( mshare([[Left],[Right]]), var(Left), var(Right), ground([_A,_B]) )
   => ground([_A,_B,Left,Right]).

:- true pred append(_A,X,_B)
   : ( mshare([[_B]]), var(_B), ground([_A,X]) )
   => ground([_A,X,_B]).
%% Analisis:1 ends here

%% Analisis 
%% - dominio eterms sin  ~:- entry qsort(A,B) : (list(num, A), var(B)).~ 
%%   #+REVEAL_HTML: <div style="font-size: 130%;">

%% [[file:~/repos/curso-AILP/ailp.org::*Analisis][Analisis:1]]
:- true pred qsort(_A,R)
   : ( term(_A), term(R) )
   => ( list(_A), list(R) ).

:- true pred partition(_A,_B,Left,Right)
   : ( term(_A), term(_B), term(Left), term(Right) )
   => ( list(arithexpression,_A), term(_B), 
        list(arithexpression,Left), list(arithexpression,Right) ).

:- true pred append(_A,X,_B)
   : ( list(_A), non_empty_list(X), term(_B) )
   => ( list(_A), non_empty_list(X), non_empty_list(_B) ).
%% Analisis:1 ends here

%% Analisis 
%% - dominio eterms con  ~:- entry qsort(A,B) : (list(num, A), var(B)).~ 
%%   #+REVEAL_HTML: <div style="font-size: 130%;">

%% [[file:~/repos/curso-AILP/ailp.org::*Analisis][Analisis:1]]
:- true pred qsort(A,B)
  : ( list(num,A), term(B) )
  => ( list(num,A), list(num,B) ).

:- true pred partition(_A,_B,Left,Right)
  : ( list(num,_A), num(_B), term(Left), term(Right) )
 => ( list(num,_A), num(_B), list(num,Left), list(num,Right) ).

:- true pred append(_A,X,_B)
 : ( list(num,_A), list1(num,X), term(_B) )
=> ( list(num,_A), list1(num,X), list1(num,_B) ).
%% Analisis:1 ends here

%% Debugging
%% - Salida
%%     #+REVEAL_HTML: <div style="font-size: 150%;">

%% [[file:~/repos/curso-AILP/ailp.org::*Debugging][Debugging:1]]
:- true pred qsort(A,B)
   : ( list(num,A), term(B) )
   => ( list(num,A), list(^(x),B) ).
%% Debugging:1 ends here

%% Debugging
%% - Salida
%%     #+REVEAL_HTML: <div style="font-size: 100%;">

%% [[file:~/repos/curso-AILP/ailp.org::*Debugging][Debugging:1]]
{In /home/claudio/tmp/orgfiles/data/ciaopp/clase2/hacerslides/debugging/qsort2.pl
WARNING (preproc_errors): (lns 4-8) goal qsort2:partition(L,L1,X,L2) at literal 1 does not succeed!
}
{ERROR (ctchecks_messages): error printing:message_clause_incompatible(qsort2:partition/4/2,eterms
 ,qsort2:partition([e|C],A,[D|E],B),[A,B,C,D,E],[C,Right,R,E,Left1])
}
{In /home/claudio/tmp/orgfiles/data/ciaopp/clase2/hacerslides/debugging/qsort2.pl
WARNING (preproc_errors): (lns 14-15) goal arithmetic:>=(E,C) at
literal 1 does not succeed!
%% Debugging:1 ends here

%% Optimización
%% - Entrada
%%     #+REVEAL_HTML: <div style="font-size: 110%;">

%% [[file:~/repos/curso-AILP/ailp.org::*Optimización][Optimización:1]]
:- module(append,[appe/3],[assertions] ) .


:- entry appe(A,B,C). 

appe(A,B,C) :- append([1,2,3|A],B,C).

append([],X,X).
append([H|X],Y, [H|Z]):- append(X,Y,Z) .
%% Optimización:1 ends here

%% Certificación
%% - Certificado
%%     #+REVEAL_HTML: <div style="font-size: 130%;">

%% [[file:~/repos/curso-AILP/ailp.org::*Certificación][Certificación:1]]
:- true pred A is B+C : (mshare([[A]]),var(A),ground([B,C]))
                          => (ground([A,B,C])).
:- true pred A is B*C : (mshare([[A]]),var(A),ground([B,C]))
                         => (ground([A,B,C])).

:- true pred A is B+C : (term(A),num(B),num(C))
                         => (num(A),num(B),num(C)).
                         
:- true pred A is B*C : (term(A),num(B),num(C))
                         => (num(A),num(B),num(C)).
%% Certificación:1 ends here
