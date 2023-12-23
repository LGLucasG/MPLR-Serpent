function [] = dessin_serpent(q,obstacle)
%DESSIN_SERPENT Dessine le serpent et l'obstacle
%   q : Matrice Nx1, contenant les N degrés de liberté
%   obstacle : Matrice Nx2, contenant les coordonnées des N sommets du
%   polygone correspondant à l'obstacle

% Dessin de l'obstacle
plot(obstacle(:,1)', obstacle(:,2)', 'r');

% Calcul des coordonnées des joints
[m n] = size(q);
X = [0];
Y = [0];
for i=1:m
    R = [cos(q(i)) -sin(q(i)) ; sin(q(i)) cos(q(i))];
    res = [X(end);Y(end)] + (R*[1;0]);
    X = [X res(1)];
    Y = [Y res(2)];
end

% Vérification de collision avec l'obstacle
[mobs nobs] = size(obstacle);
are_intersecting = false;
color = 'b';
for i=1:m
    for j=1:mobs
        seg_1 = [X(i) Y(i) ; X(i+1) Y(i+1)];
        seg_2 = [obstacle(j,:) ; obstacle(mod(j+1,mobs)+1,:)];
        if (segment_intersect(seg_1, seg_2))
            color = 'r';
            are_intersecting = true;
            break
        end
    end
    if (are_intersecting)
        break
    end
end

% Dessine le robot
for i=1:m
    plot(X(i), Y(i), 'o', 'Color', color); % Joints
end
plot(X, Y, color); % Bras
plot(X(end), Y(end), 'x', 'Color', color); % Gripper



end

