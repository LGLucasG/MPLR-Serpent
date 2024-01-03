function [Xs,Xk_temp] = newton(X0,c,r,iter_max)
%NEWTON Summary of this function goes here
%   Detailed explanation goes here

Xk = X0;
prev_Xk = 999999;
S = F(Xk,c,r);
iter=0;
Xk_temp = [];
while (norm(S)>=1e-6)&&(iter<iter_max)&&(norm(Xk-prev_Xk)>1e-6)
    j = Jac(Xk,c);
    deltaX = -j\S;
    prev_Xk = Xk;
    Xk = Xk + deltaX;
    S = F(Xk,c,r);
    Xk_temp = [Xk_temp Xk];
    iter = iter+1;
end
Xs = Xk;

if (norm(Xk-prev_Xk)<1e-3)
    fprintf("Xk converged after %d iterations\n", iter);
else if (norm(S)<1e-3)
    fprintf("F converged after %d iterations\n", iter);
else
    fprintf("Iter_max (%d) reached\n",iter_max);
end
end

