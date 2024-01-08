function tableau = tableau_obstacle_wrapper(taille, obstacle)
    taille;
    [nRows, nCols] = size(obstacle);
    for i=1:nRows
        for j=1:nCols
            obstacle(i,j) = obstacle(i,j) + 1;
        end
    end
    tableau = creerTableauAvecObstacles(taille,obstacle);
end