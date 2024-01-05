function [ret] = Jac(q_current)
%JAC Retourne la jacobienne de la fonction F (méthode de Newton)

[m,n]=size(q_current);
ret = [];

C = 0;
S = 0;
aggr = 0;
for i=1:n
    aggr = aggr + q_current(i);
    C = C + cos(aggr);
    S = S + sin(aggr);
end

aggr = 0;
for i=1:n
    aggr = aggr + q_current(i);
    col_i = [S ; -C];
    ret = [ret, col_i];
    C = C - cos(aggr);
    S = S - sin(aggr);
end
end

