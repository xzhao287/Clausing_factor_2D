function move(hfl,xp,yp,x1,y1)
% makes move
% hfl - fill handle (circle)
% xp,yp - initial pointer position
% x1,y1 - initial coodinaties of ball
% kk - scale coefficient between pixels and units of axes

%global xys sp iscnt mth res hc

global hf ha rad x y kkx kky lx ly xd yd
global n vx vy dt tmot hs
global hsl hslm xh yh th


no=get(hfl,'Userdata');

pl=get(0,'PointerLocation');
xpt=pl(1);
ypt=pl(2);

dx=kkx*(xpt-xp);
dy=kky*(ypt-yp);

xl=[0 lx];
yl=[0 ly];

% axis limits:
xlw=[xl(1)+rad(no) xl(2)-rad(no)];
ylw=[yl(1)+rad(no) yl(2)-rad(no)];
if (x1+dx)>xlw(2)
    dx=xlw(2)-x1;
end

if (x1+dx)<xlw(1)
    dx=xlw(1)-x1;
end

if (y1+dy)>ylw(2)
    dy=ylw(2)-y1;
end

if (y1+dy)<ylw(1)
    dy=ylw(1)-y1;
end


    


x(no)=x1+dx;
y(no)=y1+dy;

xdt=xd(:,no)+x(no);
ydt=yd(:,no)+y(no);


set(hfl,'XData',xdt);
set(hfl,'YData',ydt);

% hystory
if hsl<=hslm
    xh=[xh x(no)];
    yh=[yh y(no)];
    th=[th toc];
    hsl=hsl+1;
else
    xh=[xh(2:end) x(no)];
    yh=[yh(2:end) y(no)];
    th=[th(2:end) toc];
    dth=th(end)-th(1);
    vx(no)=(xh(end)-xh(1))/dth;
    vy(no)=(yh(end)-yh(1))/dth;
end
    
    

tmot=tmot+dt; 
balls;	
for nc=1:n
    set(hs(nc),'XData', x(nc)+xd(:,nc),'YData',y(nc)+yd(:,nc));
end
dt=toc-tmot;

drawnow;


