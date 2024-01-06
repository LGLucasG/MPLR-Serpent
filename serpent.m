clear all;clf;

hold on;
axis equal;

origin = [0 0];
q = [pi/2 0 0 0 0];


obstacle = [
    3  1;
    3  2;
    3  3;
    4  1;
    4  2;
    4  3;
    5  1;
    5  2;
    5  3;
];
target_pos1 = [3 4];

pos_effector = round(dessin_serpent(q,obstacle,origin,0,0))

% application de dijkstra
% dessin_deplacement(pos_effector', q, target_pos1, 10, obstacle, origin);

% Calcul de la géometrie inverse (méthode de Newton)
[target_q1, target_q1_succ] = solve_serpent_pos_to_angle(q, target_pos1, obstacle, origin);

% Affichage des positions successives testées par l'algo de Newton
[m,n] = size(target_q1_succ);
for i=1:m
    dessin_serpent(target_q1_succ(i,:), obstacle, origin, 'c', ':');
end

% Affichage de la solution trouvée
pos_effector1 = dessin_serpent(target_q1, obstacle, origin, 'g', 0)