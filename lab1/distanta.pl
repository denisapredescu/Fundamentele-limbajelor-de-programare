%distance/3
%distance(+P1, +P2, -R).

distance((X1, Y1), (X2, Y2), R) :- R is sqrt((X2 - X1) ** 2 + (Y2 - Y1) ** 2).