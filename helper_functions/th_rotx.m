  function T=th_rotx(theta_rad)
    c=cos(theta_rad); s=sin(theta_rad);
    T=[[ 1, 0, 0,0]
       [ 0, c,-s,0]
       [ 0, s, c,0]       
       [ 0, 0, 0,1]       
      ]; 
  end
