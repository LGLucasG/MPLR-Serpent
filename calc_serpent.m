function [joints_X, joints_Y, color] = calc_serpent(q,obstacle,origin)
%CALC_SERPENT Summary of this function goes here
%   Detailed explanation goes here




% Calcul des coordonnées des joints
[mq,nq] = size(q);
joints_X = [origin(1)];
joints_Y = [origin(2)];
for i=1:nq
    R = [cos(q(i)) -sin(q(i)) ; sin(q(i)) cos(q(i))];
    res = [joints_X(end);joints_Y(end)] + (R*[1;0]);
    joints_X = [joints_X res(1)];
    joints_Y = [joints_Y res(2)];
end

% Vérification de collision avec l'obstacle
[mobs nobs] = size(obstacle);
color = 'b';
for i=1:nq
    for j=1:mobs
        seg_1 = [joints_X(i) joints_Y(i) ; joints_X(i+1) joints_Y(i+1)];
        seg_2 = [obstacle(j,:) ; obstacle(mod(j+1,mobs)+1,:)];
        if (segment_intersect(seg_1, seg_2))
            color = 'r';
            return
        end
    end
end

end

