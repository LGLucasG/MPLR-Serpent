function [ret] = Jac(X,c)
%J Summary of this function goes here
%   Detailed explanation goes here
[m,n]=size(c);
ret = [];
for i=1:m
    ret = [ret;2*(X'-c(i,:))];
end
end

