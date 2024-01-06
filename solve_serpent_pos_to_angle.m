function [target_q, target_q_succ] = solve_serpent_pos_to_angle(starting_q, target_pos, obstacle, origin)
%SOLVE_SERPENT_POS_TO_ANGLE Calcule la cinématique inverse
%  
%   starting_q: tableau des angles initiaux des articulations : [q1, q2, q3, q4, q5]
%   starting_pos: position initiale de l'effecteur : [x, y]
%   target_pos: position cible : [x, y]
%   origin: origine du repère : [x, y]
%   obstacle : quatre points formant un obstacle : [x1, x2, x3, x4]
%   
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
    % To be continued...
    % [Xs,Xk_temp] = newton(X0,[origin;target_pos],[1;1],20)

    % Initialize the iteration
    current_q = starting_q;
    max_iters = 50; % Maximum number of iterations
    tol = 1e-3; % Tolerance for convergence

    for iter = 1:max_iters
        % Calculate current end-effector position
        [joints_X, joints_Y, color] = calc_serpent(current_q, obstacle, origin);
        pos_effector = [joints_X(end); joints_Y(end)];
        current_pos = pos_effector;
        % Check if current position is close enough to the target
        if norm(current_pos - target_pos) < tol
            target_q = current_q;
            return;
        end

        % % Compute Jacobian
        % % J = jacobian(current_q,origin);
        % % Newton-Raphson update
        % % delta_q = J \ (target_pos - current_pos)';
        % % current_q = current_q + delta_q';

        angle_to_target = atan2(target_pos(2) - current_pos(2), target_pos(1) - current_pos(1));
        angs = atan2(target_pos(2) - joints_Y, target_pos(1) - joints_X);
        update = angs(2:6) - angs(1:5)
        for i = 1:n
            % current_q = mod(current_q + angs(2:6)/10,2*pi);
            current_q = mod(current_q + update/100,2*pi);
        end


        % Additional checks can be added here (e.g., joint limits)
    end

    disp('Max iterations reached, a precise solution may not have been found.');
    target_q = current_q;
end



end

