p.x = [2.173 3.752]';
p.y = [3.564 4.623]';
p.vx = [-32.126 -23.517]';
p.vy = [-17.123 -48.214]';
p.t = zeros(2)';

T = 40;
dt = 0.004;
for t = 1:dt:T

plot(bdy(:,1),bdy(:,2));
hold on

scatter(p.x, p.y,12,'black','filled');

for i = 1:2
     [p1.x, p1.y, p1.vx, p1.vy, p1.t] = trjppg(p.x(i),p.y(i),p.vx(i),p.vy(i),p.t(i),dt);

    for b = 1:B
        a1 = bdy(b,1);
        b1 = bdy(b,2);
        a2 = bdy(b,3);
        b2 = bdy(b,4);
        intsct_test = seg_intsc(p1.x, p1.y,p.x(i),p.y(i),a1,b1,a2,b2);

        if intsct_test == true
            absrb_ornt = absrb_test(bdy(b,5));
            if absrb_ornt == true
                    p1.x = 1.317;
                    p1.y = 0.621;
                    p1.vx = -rand*60;
                    p1.vy = +rand*60;
                    p1.t = 0;
                    
                    bdy(b,6) = bdy(b,6) + 1;
            elseif absrb_ornt == false

            [p1.x,p1.y] = bounce_x(p1.x,p1.y,a1,b1,a2,b2);

            seg_a = a1-a2;
            seg_b = b1-b2;
            [l0x,l0y] = normlz_vct(seg_a,seg_b);
            [n0x,n0y] = normal_vct(seg_a,seg_b);
            [p1.vx,p1.vy] = bounce_v(p1.vx,p1.vy,l0x,l0y,n0x,n0y);


            end
            
        end

    end


    if p1.t > tmax

        p1.x = 2.351;
        p1.y = 2.621;
        p1.vx = -rand*60;
        p1.vy = +rand*60;
        p1.t = 0;
    end
    
    p.x(i) = p1.x;
    p.y(i) = p1.y;
    p.vx(i) = p1.vx;
    p.vy(i) = p1.vy;
    p.t(i) = p1.t;

end

    pause(0.001);

hold off

end

