function [ret] = F(X,c,r)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

[m,n] = size(c);
ret = [];
for i=1:m
    % ret = [ret; (norm(X-c(i,:)')^2)-(r(i)^2)];
    ret = [ret; (norm(X-c(i,:)')^2)-(r(i)^2)];
end
end

