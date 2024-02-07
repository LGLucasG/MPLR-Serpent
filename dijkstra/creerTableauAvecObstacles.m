function tableau = creerTableauAvecObstacles(taille, obstacle)
    % Créer un tableau de zéros avec les dimensions spécifiées
    tableau = zeros(taille);
    xmin_obstacle = min(obstacle(:,1));
    xmax_obstacle = max(obstacle(:,1));
    ymin_obstacle = min(obstacle(:,2));
    ymax_obstacle = max(obstacle(:,2));
    obstacle_points = [];
    for i=xmin_obstacle:xmax_obstacle
        for j=ymin_obstacle:ymax_obstacle
            obstacle_points = [obstacle_points; [i,j]];
        end
    end
    % Parcourir la liste des obstacles et placer des 1 aux positions indiquées
    for i = 1:size(obstacle_points, 1)
        pos_obstacle = obstacle_points(i, :);
        tableau(pos_obstacle(1), pos_obstacle(2)) = 1;
        % tableau(pos_obstacle(1)+1, pos_obstacle(2)+1) = 1; % on décale les indices de 1
    end
end
