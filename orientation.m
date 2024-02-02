function [orientation] = orientation(p, q, r)
%ORIENTATION Returns the orientation of an ordered triplet :
%   0: Collinear
%   1: Clockwise
%   2: Counterclockwise
% See https://www.geeksforgeeks.org/orientation-3-ordered-points/amp/ 
% for details of below formula.
val = ((q(2) - p(2)) * (r(1) - q(1))) - ((q(1) - p(1)) * (r(2) - q(2)));
if (val > 0)
    % Clockwise orientation
    orientation = 1;
elseif (val < 0)
    % Counterclockwise orientation
    orientation = 2;
else
    % Collinear orientation
    orientation = 0;
end
end

