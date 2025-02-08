function [ornttn] = ccwrcw(x1, y1, x2, y2, x3, y3)

% clockwise = 1, counterclowise = -1, colinear = 0;

ornttn = 0;

if (y2-y1)*(x3-x2) > (y3-y2)*(x2-x1)
    ornttn = 1;
elseif (y2-y1)*(x3-x2) < (y3-y2)*(x2-x1)
    ornttn = -1;
end

end

