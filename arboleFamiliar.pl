%Relaciones de familia
hombre('bob').
hombre('tom').
hombre('pat').
hombre('jim').
mujer('pam').
mujer('liz').
mujer('ann').
padrede('bob','pam').
padrede('bob','tom').
padrede('liz','tom').
padrede('ann','bob').
padrede('pat','bob').
padrede('jim','pat').
pareja('pam','tom').

% %Relaciones %
padre(A,B):-hombre(B),padrede(A,B).
madre(A,B):-mujer(B),padrede(A,B).
hijode(A,B):-hombre(A),padrede(A,B).
hijade(A,B):-mujer(A),padrede(A,B).
abuelode(A,B):-hombre(B),padrede(A,C),padrede(C,B).
abuelade(A,B):-mujer(B),padrede(A,C),padrede(C,B).
hermanode(A,B):-padrede(A,C),padrede(B,C),A\==B.
tiode(A,B):-padrede(A,C),hermanode(C,B).
