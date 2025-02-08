function [x,y,vx,vy,t] = trjppg(x0,y0,vx0,vy0,t0,dt)
%TRJPPG Summary of this function goes here
% trajectory propagation

x = x0+vx0*dt;
y = y0+vy0*dt;
t = t0+dt;

vx = vx0;
vy = vy0;

end

