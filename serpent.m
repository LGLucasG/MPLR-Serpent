clear all;clf;

hold on;
axis equal;

origin = [0 0];
q = [pi/2 -pi/6 -pi/6 0 0];

obstacle = [
    3  0;
    3  1;
    4  1;
    4  0;
];

target_pos1 = [3 3];

pos_effector = dessin_serpent(q,obstacle,origin,0)

target_q1 = solve_serpent_pos_to_angle(q, target_pos1, obstacle, origin);

pos_effector1 = dessin_serpent(target_q1, obstacle, origin, 'g')


