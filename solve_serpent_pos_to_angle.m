function [target_q, target_q_succ] = solve_serpent_pos_to_angle(starting_q, target_pos, obstacle, origin)
%SOLVE_SERPENT_POS_TO_ANGLE Calcule la cinématique inverse
%  
%   starting_q: tableau des angles initiaux des articulations
%   target_pos: position cible
%   obstacle: position de l'obstacle
%   origin: position de l'origine du robot (souvent [0 0])
%RETOUR
%   target_q: tableau des angles des articulations pour la solution
%   target_q_succ: tableau des angles successifs calculés au cours de
%   l'algorithme

[m,n] = size(starting_q);
% Il y a autant de bras que de degrés de liberté. Chaque bras mesure 1,
% donc la distance max vaut :
max_dist = n;
dist = norm(origin - target_pos);
target_q = zeros(1,n);

if(dist > max_dist)
    disp('target_pos is too far away, no solution was found !');
else if (dist == max_dist)
    target_q(1) = atan(  abs(target_pos(2)-origin(2)) / abs(target_pos(1)-origin(1)) );
else
    [target_q,target_q_succ] = newton(starting_q,target_pos,obstacle,origin,20);    
end
% TODO: rajouter des conditions pour l'obstacle (?)
end

