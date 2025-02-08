function [x, Fx] = dis_generator(pdfx,cdf,N)
%   generate a random variable that follows the input distribution

Fx = rand(N,1);

x = interp1(cdf, pdfx, Fx);

end

