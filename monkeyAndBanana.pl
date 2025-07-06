dim(5).  % aqui se define las dimensiones NxN del plano 

% las distintas direcciones a las que puede ir el mono
dir(north, -1, 0).
dir(east, 0, 1).
dir(south, 1, 0).
dir(west, 0, -1).

valid_pos(I, J) :-
    dim(N),
    I >= 0, I < N,
    J >= 0, J < N.


% grasp
move(state(coordsMonkey(A, B), onbox, coordsBox(A, B), coordsBanana(A, B), has-not),
     grasp,
     state(coordsMonkey(A, B), onbox, coordsBox(A, B), coordsBanana(A, B), has)).

% las coords del platano son asi por optimizacion, abajo en down tambien

% up 
move(state(coordsMonkey(A, B), onfloor, coordsBox(A, B), coordsBanana(A, B), has-not),
     climb_up,
     state(coordsMonkey(A, B), onbox, coordsBox(A, B), coordsBanana(A, B), has-not)).

% down
move(state(coordsMonkey(A, B), onbox, coordsBox(A, B), coordsBanana(C, D), has-not),
     climb_down,
     state(coordsMonkey(A, B), onfloor, coordsBox(A, B), coordsBanana(C, D), has-not)).

% push
move(state(coordsMonkey(A, B), onfloor, coordsBox(A, B), coordsBanana(C, D), has-not),
     push(Direccion),
     state(coordsMonkey(NewA, NewB), onfloor, coordsBox(NewA, NewB), coordsBanana(C, D), has-not)) :-
    ( D > B -> Direccion = east;
      C < A -> Direccion = north;
      C > A -> Direccion = south;
      D < B -> Direccion = west
    ),
    dir(Direccion, Dx, Dy),
    NewA is A + Dx,
    NewB is B + Dy,
    valid_pos(NewA, NewB).


% walk
move(state(coordsMonkey(A, B), onfloor, coordsBox(C, D), coordsBanana(E, F), has-not),
     walk(Direccion),
     state(coordsMonkey(NewA, NewB), onfloor, coordsBox(C, D), coordsBanana(E, F), has-not)) :-
    ( D > B -> Direccion = east;
      C < A -> Direccion = north;
      C > A -> Direccion = south;
      D < B -> Direccion = west
    ),
    dir(Direccion, Dx, Dy),
    NewA is A + Dx,
    NewB is B + Dy,
    valid_pos(NewA, NewB).


eating(State, Path) :-
    eating(State, [], [], Path).

eating(State1, Visited, Acc, Path) :-
    \+ member(State1, Visited),
    move(State1, Action, State2),
    eating(State2, [State1 | Visited], [Action | Acc], Path).

eating(state(_, _, _, _, has), _, Acc, Path):-
 writeln('True'),
    reverse(Acc, Path).