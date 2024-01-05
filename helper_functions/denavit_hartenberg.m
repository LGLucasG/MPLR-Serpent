function [iTj] = denavit_hartenberg(thetai,ai,di,alphai)
iTj = th_rotz(thetai)*th_trans(ai,0,di)*th_rotx(alphai);
end

