function [are_intersecting] = segment_intersect(seg_1, seg_2)
prod_1 = (seg_1(1,1) - seg_1(2,1)) * (seg_2(1,2) - seg_1(1,2)) - (seg_2(1,1) - seg_1(1,1)) * (seg_1(1,2) - seg_1(2,2));
prod_2 = (seg_1(1,1) - seg_1(2,1)) * (seg_2(2,2) - seg_1(1,2)) - (seg_2(2,1) - seg_1(1,1)) * (seg_1(1,2) - seg_1(2,2));

if (prod_1 * prod_2 < 0)
    are_intersecting = true;
else
    are_intersecting = false;
end
end

