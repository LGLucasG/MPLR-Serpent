function [are_intersecting] = segment_intersect(seg_1, seg_2)
% RETOURNE un booléen, vrai si les segment seg_1 et seg_2 s'intersectent,
% faux sinon
% SOURCE : https://www.geeksforgeeks.org/check-if-two-given-line-segments-intersect/

% Find the 4 orientations required for  
% the general and special cases 
p1 = seg_1(1,:);
q1 = seg_1(2,:);
p2 = seg_2(1,:);
q2 = seg_2(2,:);
o1 = orientation(p1, q1, p2);
o2 = orientation(p1, q1, q2);
o3 = orientation(p2, q2, p1);
o4 = orientation(p2, q2, q1);

% General case 
if ((o1 ~= o2) && (o3 ~= o4))
    are_intersecting = true;
% p1 , q1 and p2 are collinear and p2 lies on segment p1q1
elseif ((o1 == 0) && onSegment(p1, p2, q1))
    are_intersecting = true;
% p1 , q1 and q2 are collinear and q2 lies on segment p1q1
elseif ((o2 == 0) && onSegment(p1, q2, q1))
    are_intersecting = true;
% p2 , q2 and p1 are collinear and p1 lies on segment p2q2 
elseif ((o3 == 0) && onSegment(p2, p1, q2))
    are_intersecting = true;
% p2 , q2 and q1 are collinear and q1 lies on segment p2q2 
elseif ((o4 == 0) && onSegment(p2, q1, q2))
    are_intersecting = true;
% None of the above
else
    are_intersecting = false;
end

end

