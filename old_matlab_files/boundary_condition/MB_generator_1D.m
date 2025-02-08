function [v,pv] = MB_generator_1D(m, T, range)
%   generate 1D maxwellian distribution
%   400 bins for v and pv, covering -4σ~+4σ for lateral velocity of a
%   molecule scattering off a surface and 0~+4σ for normal velocity of a
%   molecule scattering off a surface.  

sigma = sqrt(2*8.314*T/(m/100))/10;
%   standard deviation of the speed in Å/ns
dv = sigma/50;
%   velocity step in plotting the distribution

vmax = 4*sigma;
v = -vmax:dv:vmax;
v = v';

if  range == 'N'
    v = (v+vmax)/2;
end

pv = zeros(401,1);
for i = 1:401
    pv(i) = exp(-v(i).^2/sigma^2);
end
pv = pv./sum(pv);

end

