function [vx,vy] = bounce_v(v1x,v1y,l0x,l0y,n0x,n0y)
% find the mirror of a vector v1 over another unit vector l0, whose normal
% vector is n0

    vl = v1x*l0x + v1y*l0y;
    vn = v1x*n0x + v1y*n0y;

    vx = vl*l0x - vn*n0x;
    vy = vl*l0y - vn*n0y;
    
end