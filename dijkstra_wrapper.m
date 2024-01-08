function path = dijkstra_wrapper(graph, start_pos, goal_pos)
    start_pos = start_pos + [1,1]
    goal_pos = goal_pos + [1,1]
    path = dijkstra_grid(graph, start_pos, goal_pos);
    [nRows, nCols] = size(path);
    for i=1:nRows
        for j=1:nCols
            path(i,j) = path(i,j) - 1;
        end
    end
end
