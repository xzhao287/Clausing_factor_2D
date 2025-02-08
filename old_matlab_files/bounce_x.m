function [x,y] = bounce_x(x0,y0,a1,b1,a2,b2)

% find the mirror of a point r0, r, with respect to a segment (a1, b1)->
% (a2, b2)

% get the generic line equation Ay + Bx + C = 0

    A = a2 - a1;
    B = b1 - b2;
    C = a1*b2 - a2*b1;

    AB2p = A^2 + B^2;
    AB2m = A^2 - B^2;

    x = (x0*AB2m - 2*B*(A*y0 + C))/AB2p;
    y = (-y0*AB2m - 2*A*(B*x0 + C))/AB2p;
end

