function [Xs,Xk_temp] = plot_newton_with_steps(X0,c,r,iter_max,color)

    [Xs,Xk_temp] = newton(X0,c,r,iter_max);
    plot(X0(1), X0(2), '.', 'Color', color, 'MarkerSize', 30);
    [m,n] = size(Xk_temp);
    for i=1:n
        plot(Xk_temp(1,i), Xk_temp(2,i), '.', 'Color', color, 'MarkerSize', 10);
    end
    plot(Xs(1), Xs(2), 'x', 'Color', color, 'MarkerSize', 30);

end

