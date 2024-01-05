  function iP=th_iP(iTk,kP)
    [tmp,n]=size(kP);
    un=ones(1,n);
    kP_1=[kP;un];   % on rajoute un 1 en dessous de kP, pour former kP_1
    iTkred=iTk(1:3,:);
    iP=iTkred*kP_1;
  end
