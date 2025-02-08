function [cdf] = cdf(pdfx, pdfp)
%   calculate the cumulative distribution function from density function

N = length(pdfx);
cdf = zeros(N,1);

for i = 1:N
    cdf(i) = sum(pdfp(1:i));
end

end

