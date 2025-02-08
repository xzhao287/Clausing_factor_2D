m = 16;
T = 300;
[v,pv] = MB_generator_1D(m, T, 'L');
% used for MB of leaving the surface
[vn,pvn] = MB_generator_1D(m, T, 'N');
vMB_cum = cdf(v,pv);
vnMB_cum = cdf(vn,pvn);

N = 50;
p.x = rand(N,1)*10.5-5.5;
p.y = rand(N,1)*5;
p.vx = dis_generator(v,vMB_cum,N);
p.vy = dis_generator(v,vMB_cum,N);
p.t = zeros(N)';
% p.t_max = rand(N*6);

T = 1000;
dt = 0.02;
step = 0;
time_record = [];
ratio_return_record = [];
ratio_clausing_record = [];
for t = 1:dt:T
step = step + 1;
if rem(step, 100) == 0
    time_record = [time_record t];
    ratio_return_record = [ratio_return_record ratio_return];
    ratio_clausing_record = [ratio_clausing_record ratio_clausing];
end
ratio_return = 0;
ratio_clausing = 0;
if tube_enter > 0
    ratio_return = tube_escaper/tube_enter;
    ratio_clausing = bdy(12,6)/tube_enter;
end
plot(bdy(:,1),bdy(:,2));
xlim([-5 7])
ylim([-10 5])
hold on

scatter(p.x, p.y,12,'black','filled');

legend_str = sprintf('Time %.3f\nEscape %.4f\nStick Bottom%.4f',t, ratio_return, ratio_clausing);
lgd = legend(legend_str);
lgd.Location = 'southeast';

for i = 1:N
     [p1.x, p1.y, p1.vx, p1.vy, p1.t] = trjppg(p.x(i),p.y(i),p.vx(i),p.vy(i),p.t(i),dt);
      p1_tmax = T/20*rand;
      if p.y(i) > 0 && p1.y < 0 && p1.x > 0 && p1.x < 1
          tube_enter = tube_enter + 1;
      end
      if p.y(i) < 0 && p1.y > 0 && p.x(i) > 0 && p.x(i) < 1
          tube_escaper = tube_escaper + 1;
      end
    for b = 1:B
        a1 = bdy(b,1);
        b1 = bdy(b,2);
        a2 = bdy(b,3);
        b2 = bdy(b,4);
        intsct_test = seg_intsc(p1.x, p1.y,p.x(i),p.y(i),a1,b1,a2,b2);

        if intsct_test == true
            absrb_ornt = absrb_test(bdy(b,5));
            if absrb_ornt == true
                    p1.x = rand*10.5-5.5;
                    p1.y = rand*5;
                    p1.vx = dis_generator(v,vMB_cum,1);
                    p1.vy = dis_generator(v,vMB_cum,1);
                    p1.t = 0;
                    
                    bdy(b,6) = bdy(b,6) + 1;
            elseif absrb_ornt == false
            [p1.x,p1.y] = bounce_x(p1.x,p1.y,a1,b1,a2,b2);
            seg_a = a1-a2;
            seg_b = b1-b2;
            [l0x,l0y] = normlz_vct(seg_a,seg_b);
            [n0x,n0y] = normal_vct(seg_a,seg_b);
            [p1.vx,p1.vy] = bounce_v(p1.vx,p1.vy,l0x,l0y,n0x,n0y);
                if (p1.y < 0 && (p1.x <0 || p1.x > 2)) || (p1.x < -5 || p1.x > 6)
                    p1.x = rand*10.5-5.5;
                    p1.y = rand*5;
                    p1.vx = dis_generator(v,vMB_cum,1);
                    p1.vy = dis_generator(v,vMB_cum,1);
                    p1.t = 0;
                end
            end
        end
    end


    if p1.t > p1_tmax

        p1.x = rand*10.5-5.5;
        p1.y = rand*5;
        p1.vx = dis_generator(v,vMB_cum,1);
        p1.vy = dis_generator(v,vMB_cum,1);
        p1.t = 0;
    end
    
    p.x(i) = p1.x;
    p.y(i) = p1.y;
    p.vx(i) = p1.vx;
    p.vy(i) = p1.vy;
    p.t(i) = p1.t;

end

    pause(0.0001);

hold off

end

