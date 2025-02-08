A = 20000;
x = zeros(A,1);

for i = 1:A
    x(i) = dis_generator(pdfx, cdf);
end

histogram(x,50);
