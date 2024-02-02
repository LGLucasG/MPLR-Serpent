clear all;clf;

hold on;
axis equal;

%% VARIABLES MODIFIABLES
% Modifier les variables ci-dessous pour modifier l'expérience

% Origine du robot (emplacement de q0)
origin = [0 0];

% Position initiale du robot (liste des positions angulaires de chaque
% moteur)
q = [-pi/2 0 0 0 0];

% Position de l'obstacle (liste des sommets du polygone associé)
obstacle = [
    2  0;
    2  2;
    4  2;
    4  0;
];

% Position cible pour l'effecteur
target_pos1 = [3 2.3];

%% DEROULEMENT DU PROGRAMME PRINCIPAL

% Plot le robot en position initiale (bleu)
pos_effector = round(dessin_serpent(q,obstacle,origin,0,0))

% application de dijkstra
% dessin_deplacement(pos_effector', q, target_pos1, 10, obstacle, origin);

% Calcul de la géometrie inverse (méthode de Newton)
[target_q1, target_q1_succ] = solve_serpent_pos_to_angle(q, target_pos1, obstacle, origin);

% Affichage des positions successives testées par l'algo de Newton
% [m,n] = size(target_q1_succ);
% for i=1:m
%     dessin_serpent(target_q1_succ(i,:), obstacle, origin, 'c', ':');
% end

% Affichage de la solution trouvée (verte, ou rouge si collision)
pos_effector1 = dessin_serpent(target_q1, obstacle, origin, 'g', 0);

% Recherche d'une solution sans collision à partir de celle trouvée
% (ne cherchera pas si la solution est déjà sans collision)
[target_q1_better, target_q1_better_succ] = find_sol_without_collision(target_q1, obstacle, origin, 20);

% Affichage les améliorations successives et la solution finale (magenta)
[m,n] = size(target_q1_better_succ);
for i=1:m
    dessin_serpent(target_q1_better_succ(i,:), obstacle, origin, 'm', ':');
end