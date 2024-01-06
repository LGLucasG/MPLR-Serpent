clear all;clf;

hold on;
axis equal;

origin = [1 1];
q = [pi/4 -pi/4 pi/4 -pi/4 pi/4];

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

pos_effector = dessin_serpent(q,obstacle,origin)

taille = [10, 10];
tableau = creerTableauAvecObstacles(taille, obstacle)*100
path = dijkstra_grid(tableau, [1 1], [6 1])


pos_effector = dessin_serpent(q,obstacle,origin,0,0)

% Calcul de la géometrie inverse (méthode de Newton)
[target_q1, target_q1_succ] = solve_serpent_pos_to_angle(q, target_pos1, obstacle, origin);

% Affichage des positions successives testées par l'algo de Newton
[m,n] = size(target_q1_succ);
for i=1:m
    dessin_serpent(target_q1_succ(i,:), obstacle, origin, 'c', ':');
end

% Affichage de la solution trouvée
pos_effector1 = dessin_serpent(target_q1, obstacle, origin, 'g', 0)

% target_pos1 = [1 3];
% target_q1 = solve_serpent_pos_to_angle(q, pos_effector, target_pos1, origin, obstacle)
% % target_q1(5)=0
% pos_effector1 = dessin_serpent(target_q1, obstacle, origin)
