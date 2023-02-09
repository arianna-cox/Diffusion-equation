function [U] = FixedEndU(X,T,N)
%This function sums the first N terms in the series of the analytic
%solution to the fixed-endpoint-temperature problem.
sum=0;
for k = 1:N
    sum = sum - 2*exp(-k^2*pi^2*T)*sin(k*pi*X)/(pi*k);
end

U = 1 - X + sum;
end

