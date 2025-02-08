function clsn_test = seg_intsc(x0,y0,x,y,a1,b1,a2,b2)
%CLSN_WLL Summary of this function goes here
%   Detailed explanation goes here
clsn_test = false;

    if ((ccwrcw(x,y,a1,b1,a2,b2)*ccwrcw(x0,y0,a1,b1,a2,b2)<0) ...
            && (ccwrcw(a1,b1,x0,y0,x,y)*ccwrcw(a2,b2,x0,y0,x,y)<0))
        clsn_test = true;
    end

end

