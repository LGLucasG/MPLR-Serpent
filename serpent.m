clear all;clf;

hold on;
axis equal;

origin = [0 0];
q = [pi/4 pi/2 0 0 0];

obstacle = [
    3  0;
    3  1;
    4  1;
    4  0;
];

pos_effector = dessin_serpent(q,obstacle,origin);

%% TEST CINEMATIQUE INVERSE

target_pos1 = [0 5];
target_q1 = solve_serpent_pos_to_angle(q, pos_effector, target_pos1, origin, obstacle);

pos_effector1 = dessin_serpent(target_q1, obstacle, origin);