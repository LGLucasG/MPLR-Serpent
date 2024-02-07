function path = dijkstra_wrapper(graph, start_pos, goal_pos)
    start_pos = start_pos + [1,1];
    goal_pos = goal_pos + [1,1];
    path = dijkstra_grid(graph, start_pos, goal_pos);
    path = path - ones(size(path));
end
