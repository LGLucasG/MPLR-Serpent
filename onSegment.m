function [isOn] = onSegment(p, q, r)
%ONSEGMENT Given three collinear points p, q, r, the function checks if  
% point q lies on line segment 'pr'
if ((q(1) <= max(p(1), r(1))) && (q(1) >= min(p(1), r(1))) && (q(2) <= max(p(2), r(2))) && (q(2) >= min(p(2), r(2))))
    isOn = true;
else
    isOn = false;
end
end

