
import numpy as np

def orient_3p(p, q, r):
    x1, y1 = p
    x2, y2 = q
    x3, y3 = r
    val = (y2 - y1) * (x3 - x2) - (x2 - x1) * (y3 - y2)
    # comparing the slopes of pq and qr
    if val == 0:
        return 0
    # collinear
    elif val > 0:
        return 1
    # clockwise
    else:
        return -1
    # counterclockwise

def check_collision(coord0, coord1, seg):
    xb, yb = seg[0]
    # print(seg[0], seg[1])
    xe, ye = seg[1]
    x0, y0 = coord0
    x1, y1 = coord1

    o_01b = orient_3p((x0, y0), (x1, y1), (xb, yb))
    o_01e = orient_3p((x0, y0), (x1, y1), (xe, ye))
    o_be0 = orient_3p((xb, yb), (xe, ye), (x0, y0))
    o_be1 = orient_3p((xb, yb), (xe, ye), (x1, y1))

    def in_between(p, q ,r):
        # determine if q is between p and r
        xp, yp = p
        xq, yq = q
        xr, yr = r
        return (( xp <= xq <= xr or xr <= xq <= xp)
                and ( yp <= yq <= yr or yr <= yq <= yp))

    if o_01b != o_01e and o_be0 != o_be1:
        return True
    if o_be1 == 0 :
        if in_between([xb, yb], [x1, y1], [xe, ye]):
            return True
    if o_01e == 0:
        if in_between([x0, y0], [xe, ye], [x1, y1]):
            return True
    if o_01b == 0:
        if in_between([x0, y0], [xb, yb], [x1, y1]):
            return True
    if o_be0 == 0:
        if in_between([xb, yb], [x0, y0], [xe, ye]):
            return True
    return False

def prop(pos, vel, dt):
    pos_new = pos + vel * dt
    return pos_new, vel

def reflect_x(pos, seg):
    # reflect the position of the particle on the segment
    # find the perpendicular foot of the particle on the segment
    # then double the distance from the particle to the foot
    xb, yb = seg[0]
    xe, ye = seg[1]
    x0, y0 = pos

    xd, yd = xe - xb, ye - yb
    xv, yv = x0 - xb, y0 - yb
    # d is the segment vector and v is the vector from point to segment beginning end
    d2 = xd*xd + yd*yd

    if d2 == 0:
    # if the segment is a point
        return 2*xb - x0, 2*yb - y0

    dot = xv*xd + yv*yd
    project_ = dot / d2
    xpf, ypf = xb + project_*xd, yb + project_*yd
    # coord of perpendicular foot

    xr, yr = 2*xpf - x0, 2*ypf - y0
    return xr, yr

def reflect_v(vel, seg):
    # reflect the velocity of the particle on the segment
    # find the parallel and perpendicular components of the velocity
    # add the negative of perpendicular component to the parallel component
    xb, yb = seg[0]
    xe, ye = seg[1]
    vx, vy = vel

    xd, yd = xe - xb, ye - yb
    d2 = xd*xd + yd*yd

    dot = vx*xd + vy*yd
    vx_r = 2*dot*xd/d2 - vx
    vy_r = 2*dot*yd/d2 - vy
    # v_r = v_parallel - v_perpendicular
    #     = v_parallel - (v - v_parallel)
    #     = 2*v_parallel - v
    return vx_r, vy_r

# print(check_collision((9,10), (11,10), [[10,10],[10,-10],0.0,0]))



