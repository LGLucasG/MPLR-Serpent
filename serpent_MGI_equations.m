%% CINEMATIQUE INVERSE - EQUATIONS
clear all;clf;
addpath('helper_functions\');

syms q1 q2 q3 q4 q5;
q = [q1;q2;q3;q4;q5];

T01 = denavit_hartenberg(q1, 1, 0, 0);
T10 = th_invT(T01);
T12 = denavit_hartenberg(q2, 1, 0, 0);
T21 = th_invT(T12);
T23 = denavit_hartenberg(q3, 1, 0, 0);
T32 = th_invT(T23);
T34 = denavit_hartenberg(q4, 1, 0, 0);
T43 = th_invT(T34);
T45 = denavit_hartenberg(q5, 1, 0, 0);
T54 = th_invT(T45);

T02 = T01*T12;
T03 = T01*T12*T23;
T04 = T01*T12*T23*T34;
T05 = T01*T12*T23*T34*T45;

% Coordonnées cibles
syms xd yd;
O04d = [xd;yd;0]; % Pas de composante en z, pb 2D
% écrire les équations à résoudre dans R0
O04 = T04(1:3,4);
eq1 = simplify(O04d(1)) - simplify(O04(1)) == 0
eq2 = simplify(O04d(2)) - simplify(O04(2)) == 0