function [ret] = F(q_current, pos_target, obstacle, origin)
%F Fonction dont on recherche le zéro (methode de Newton)
%   Ici, on cherche à résoudre les équations ci-dessous (établies dans 
%   `serpent_MGI_equations.m`) :
% xd - cos(q1 + q2 + q3) - cos(q1 + q2 + q3 + q4) - cos(q1 + q2) - cos(q1) == 0
% yd - sin(q1 + q2 + q3) - sin(q1 + q2 + q3 + q4) - sin(q1 + q2) - sin(q1) == 0
%
%   La fonction F retournée est donc :
% [
% xd - cos(q1 + q2 + q3) - cos(q1 + q2 + q3 + q4) - cos(q1 + q2) - cos(q1);
% yd - sin(q1 + q2 + q3) - sin(q1 + q2 + q3 + q4) - sin(q1 + q2) - sin(q1)
% ]

[m,n] = size(q_current);
C = 0;
S = 0;
aggr = 0;
for i=1:n
    aggr = aggr + q_current(i);
    C = C + cos(aggr);
    S = S + sin(aggr);
end

X = pos_target(1) - C - origin(1);
Y = pos_target(2) - S - origin(2);
ret = [X;Y];

end