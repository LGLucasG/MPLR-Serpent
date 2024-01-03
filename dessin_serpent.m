function [pos_effector] = dessin_serpent(q,obstacle,origin)
%DESSIN_SERPENT Dessine le serpent et l'obstacle
%   q : Vecteur 1xN, contenant les N degrés de liberté
%   obstacle : Matrice Mx2, contenant les coordonnées des M sommets du
%   polygone correspondant à l'obstacle
%RETOURNE la cinématique directe (position de l'effecteur en fonction
%   des angles d'entrée q)

% Calcul des coordonnées du serpent
[joints_X, joints_Y, color] = calc_serpent(q, obstacle, origin);

% Dessin de l'obstacle
obstacle_plot = plot(obstacle(:,1)', obstacle(:,2)', 'r');

% Dessine le robot
joint_plot   = plot(joints_X(1:end-1), joints_Y(1:end-1), 'o', 'Color', color); % Joints
gripper_plot = plot(joints_X(end), joints_Y(end), 'x', 'Color', color); % Gripper
arm_plot     = plot(joints_X, joints_Y, color); % Bras

% Retourner la position de l'effecteur (géométrie directe)
pos_effector = [joints_X(end); joints_Y(end)];

xlim([0 5]);
ylim([0 5]);

end

