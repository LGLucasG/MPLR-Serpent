function [] = dessin_deplacement(start_pos, start_q, finish_pos, steps, obstacle, origin)
%DESSIN_DEPLACEMENT Dessine le déplacement du robot de start_pos vers finish_pos avec steps étapes

% application de dijkstra
tableau = tableau_obstacle_wrapper([steps, steps], obstacle);
path = dijkstra_wrapper(tableau,start_pos,finish_pos)
[m,n] = size(path);
q = start_q;
for i=1:m
    new_q = solve_serpent_pos_to_angle(q, path(i,:), obstacle, origin);
    dessin_serpent(new_q, obstacle, origin, 0, 0);
    q = new_q;
end

end

