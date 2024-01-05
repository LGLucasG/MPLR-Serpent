function [qs,qk_temp] = newton(q_start, pos_target, obstacle, origin, iter_max)
%NEWTON Summary of this function goes here
%   
%   q_start: position initiale du robot (angles des articulations)
%   pos_target: position cible de l'effecteur
%   obstacle: position de l'obstacle
%   origin: position de l'origine du robot (souvent [0 0])
%   iter_max: nombre max d'itérations avant arrêt du programme
%RETOUR
%   qs: Solution (angles des articulations)
%   qk_temp: tableau contenant toutes les approximations successives
%   calculées au cours de l'exécution

qk = q_start;
prev_qk = 999999;
S = F(q_start,pos_target,obstacle,origin);
iter=0;
qk_temp = [];
while (norm(S)>=1e-6)&&(iter<iter_max)&&(norm(qk-prev_qk)>1e-6)
    j = Jac(qk);
    deltaq = -j\S;
    prev_qk = qk;
    qk = qk + deltaq;
    S = F(qk,pos_target,obstacle,origin);
    qk_temp = [qk_temp qk];
    iter = iter+1;
end
qs = qk;

if (norm(qk-prev_qk)<1e-3)
    fprintf("Xk converged after %d iterations\n", iter);
else if (norm(S)<1e-3)
    fprintf("F converged after %d iterations\n", iter);
else
    fprintf("Iter_max (%d) reached\n",iter_max);
end
end

