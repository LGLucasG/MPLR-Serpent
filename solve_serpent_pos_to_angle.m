function [target_q] = solve_serpent_pos_to_angle(starting_q, starting_pos, target_pos, origin, obstacle)
%SOLVE_SERPENT_POS_TO_ANGLE Calcule la cinématique inverse
%  
%   starting_q: tableau des angles initiaux des articulations
%   starting_pos: position initiale de l'effecteur
%   target_pos: position cible
%RETOUR
%   target_q: tableau des angles des articulations pour la solution

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
    % To be continued...
    % [Xs,Xk_temp] = newton(X0,[origin;target_pos],[1;1],20)
end



end

