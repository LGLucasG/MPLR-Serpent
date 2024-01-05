 function iV=th_iV(iTk,kV)
    [tmp,n]=size(kV);
    z=zeros(1,n);
    kV_0=[kV;z];   % on rajoute un 0 en dessous de kV, pour former kV_0
    iTkred=iTk(1:3,:);
    iV=iTkred*kV_0;
  end
