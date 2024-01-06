function tableau = creerTableauAvecObstacles(taille, obstacles)
    % Créer un tableau de zéros avec les dimensions spécifiées
    tableau = zeros(taille);

    % Parcourir la liste des obstacles et placer des 1 aux positions indiquées
    for i = 1:size(obstacles, 1)
        pos_obstacle = obstacles(i, :);
        tableau(pos_obstacle(1), pos_obstacle(2)) = 1;
        % tableau(pos_obstacle(1)+1, pos_obstacle(2)+1) = 1; % on décale les indices de 1
    end
end
