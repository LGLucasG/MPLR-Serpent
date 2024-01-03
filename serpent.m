clear all;clf;

hold on;
axis equal;

origin = [0 0];
q = [pi/4 pi/2 pi/4 pi/6 0];

obstacle = [
    3 0;
    3 1;
    4 1;
    4 0
];

pos_effector = dessin_serpent(q,obstacle,origin)