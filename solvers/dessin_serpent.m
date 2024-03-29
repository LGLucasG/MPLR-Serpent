function [pos_effector] = dessin_serpent(q,obstacle,origin,overwrite_color,overwrite_linestyle)
%DESSIN_SERPENT Dessine le serpent et l'obstacle
%   q : Vecteur 1xN, contenant les N degrés de liberté
%   obstacle : Matrice Mx2, contenant les coordonnées des M sommets du
%   polygone correspondant à l'obstacle
%RETOURNE la cinématique directe (position de l'effecteur en fonction
%   des angles d'entrée q)
hold on;
axis equal;

% Calcul des coordonnées du serpent
[joints_X, joints_Y, color] = calc_serpent(q, obstacle, origin);
linestyle = '-';
if all(overwrite_color~='') && all(overwrite_color~=0) && (color~='r')
    color = overwrite_color;
end
if all(overwrite_linestyle~='') && all(overwrite_linestyle~=0)
    linestyle = overwrite_linestyle;
end

% Dessin de l'obstacle
obstacle_plot = plot(cat(2, obstacle(:,1)', obstacle(1,1)), cat(2, obstacle(:,2)', obstacle(1,2)), 'r');

% Dessine le robot
joint_plot   = plot(joints_X(1:end-1), joints_Y(1:end-1), 'o', 'Color', color); % Joints
gripper_plot = plot(joints_X(end), joints_Y(end), 'x', 'Color', color); % Gripper
arm_plot     = plot(joints_X, joints_Y, 'Color', color, 'LineStyle', linestyle); % Bras

% Retourner la position de l'effecteur (géométrie directe)
pos_effector = [joints_X(end); joints_Y(end)];

xlim([-5 5]);
ylim([-5 5]);

end

