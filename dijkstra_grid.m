function path = dijkstra_grid(graph, start_pos, goal_pos)
    % start_pos = start_pos + [1 ,1]; % Indices matlab commencent à 1...
    % goal_pos = goal_pos + [1 ,1]; % Indices matlab commencent à 1...
    numRows = size(graph, 1);
    numCols = size(graph, 2);

    % Convertir les positions en indices linéaires
    start_idx = sub2ind(size(graph), start_pos(1), start_pos(2));
    goal_idx = sub2ind(size(graph), goal_pos(1), goal_pos(2));

    % Initialisation
    dist = inf(numRows, numCols)
    dist(start_idx) = 0;
    prev = zeros(numRows, numCols);

    % Créer un ensemble de tous les nœuds non visités. 
    % On utilise un tableau pour représenter cet ensemble.
    Q = true(numRows, numCols);
    
    while any(Q(:))
        % Trouver le nœud avec la plus petite distance
        [nRows, nCols] = size(Q);
        voisins = [];
        u_row = 1; 
        u_col = 1;
        if all(Q == true)
            voisins = [start_pos,true,graph(start_pos)]
            u_row = voisins(1); 
            u_col = voisins(2);
        else
            for i = 1:nRows
                for j = 1:nCols
                    if ~Q(i, j) % Vérifier si l'élément est faux (déjà parcouru)
                        % Vérifier chaque voisin
                        if i > 1 && Q(i-1, j) % Voisin du haut
                            voisins = [voisins; [i-1,j,true,graph(i-1, j)]];
                        end
                        if i < nRows && Q(i+1, j) % Voisin du bas
                            voisins = [voisins; [i+1,j,true,graph(i+1, j)]];
                        end
                        if j > 1 && Q(i, j-1) % Voisin de gauche
                            voisins = [voisins; [i,j-1,true,graph(i, j-1)]];
                        end
                        if j < nCols && Q(i, j+1) % Voisin de droite
                            voisins = [voisins; [i,j+1,true,graph(i, j+1)]];
                        end
                    end
                end
            end
            voisins = sortrows(voisins, 4)
            u_row = voisins(1,1)
            u_col = voisins(1,2)

        end
        % [a, u] = min(graph(Q));
        % [u_row, u_col] = ind2sub(size(graph), find(Q, u, 'first'));
        % u_row = u_row(1); 
        % u_col = u_col(1);
        % Si le nœud cible est atteint
        if (u_row == goal_pos(1)) && (u_col == goal_pos(2))
            break;
        end

        % Marquer le nœud comme visité
        Q(u_row, u_col) = false;

        % Vérifier les voisins
        neighbors = [u_row-1, u_col; u_row+1, u_col; u_row, u_col-1; u_row, u_col+1];
        for i = 1:size(neighbors, 1)
            v_row = neighbors(i, 1);
            v_col = neighbors(i, 2);

            % Vérifier si le voisin est à l'intérieur du graphe et non visité
            if v_row >= 1 && v_row <= numRows && v_col >= 1 && v_col <= numCols && Q(v_row, v_col)
                alt = dist(u_row, u_col) + graph(v_row, v_col);
                if alt < dist(v_row, v_col)
                    dist(v_row, v_col) = alt;
                    prev(v_row, v_col) = sub2ind(size(graph), u_row, u_col);
                end
            end
        end
    end
    d=dist
    % Reconstruire le chemin
    path = [];
    u = goal_idx;
    while u ~= 0
        [u_row, u_col] = ind2sub(size(graph), u);
        % path = [[u_row-1, u_col-1]; path]; % On décale les indices pour commencer à 0
        path = [[u_row, u_col]; path];
        u = prev(u_row, u_col);
    end

    % start_pos = start_pos - [1 ,1]; % Indices matlab commencent à 1...
    % goal_pos = goal_pos - [1 ,1]; % Indices matlab commencent à 1...
    % Vérifier si le chemin est trouvé
    if isempty(path) || ~(path(1, 1) == start_pos(1) && path(1, 2) == start_pos(2))
        path = []; % Aucun chemin trouvé
    end
end
