function [nx,ny] = normal_vct(x,y)
% find the normal vector of a vector (x,y)

    length_xy = sqrt(x^2+y^2);
    nx = -y/length_xy;
    ny = x/length_xy;

end

