function [x0,y0] = normlz_vct(x,y)

    length_xy = sqrt(x^2+y^2);
    x0 = x/length_xy;
    y0 = y/length_xy;

end

