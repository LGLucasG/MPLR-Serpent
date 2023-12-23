clear all;clf;

hold on;
axis equal;

% pi = sym(pi)

q = [0;0;pi/6;pi/4;0];
obstacle = [
    3 0;
    3 1;
    4 1;
    4 0
];

dessin_serpent(q,obstacle);