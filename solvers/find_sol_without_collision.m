function [qk, qk_succ] = find_sol_without_collision(q, obstacle, origin, iter_max)
%FIND_SOL_WITHOUT_COLLISION Takes in a configuration q and tries to find
% another one with the same effector position which is not colliding with
% the obstacle

qk = q;
qk_succ = [];
is_colliding = true;
iter = 0;

while (is_colliding && iter < iter_max)
    [joints_X, joints_Y, color] = calc_serpent(qk, obstacle, origin);
    pos_effector = [joints_X(end) joints_Y(end)];
    
    if (color ~= 'r')
        is_colliding = false;
    end

    qk_succ = [qk_succ;qk];
    % Compute newton again after applying a random offset to try to find another
    % configuration for the same effector position
    qk = solve_serpent_pos_to_angle(qk+rand(size(qk)), pos_effector, obstacle, origin);

    iter = iter+1;
end

fprintf("`find_sol_without_collision` stopped after (%d/%d) iterations\n",iter, iter_max);

end

