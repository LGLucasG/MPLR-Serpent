function [] = dessin_deplacement(start_pos, start_q, finish_pos, depth, obstacle, origin)
%DESSIN_DEPLACEMENT Dessine le déplacement du robot de start_pos vers finish_pos

% application de dijkstra
tableau = tableau_obstacle_wrapper([depth, depth], obstacle);
path = dijkstra_wrapper(tableau,start_pos,finish_pos)
plot(path(:,1), path(:,2), 'gpentagram');
[m,n] = size(path);
q = start_q;
for i=2:m
    fprintf("path : %d %d\n",path(i,1) , path(i,2))
    new_q = solve_serpent_pos_to_angle(q, path(i,:), obstacle, origin);
    [new_q, target_q1_better_succ] = find_sol_without_collision(new_q, obstacle, origin, 50);
    dessin_serpent(new_q, obstacle, origin, 0, 0);
    fprintf("old new q : %d %d\n",q , new_q)
    q = new_q;
end

end

