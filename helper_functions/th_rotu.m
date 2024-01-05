  function T=th_rotu(u,theta)    
    u=[u(1);u(2);u(3)] ; % u forcement en colonne
    ux=u(1);uy=u(2);uz=u(3);
    Su=[ [0  ,-uz,uy ]
        [uz ,0  ,-ux]
        [-uy,ux ,0  ]        
      ];  
    c=cos(theta);
    s=sin(theta);
    R=u*u.'*(1-c) +eye(3,3)*c+Su*s;
    T=[R,[0;0;0]];
    T=[T;[0,0,0,1]];
  end
