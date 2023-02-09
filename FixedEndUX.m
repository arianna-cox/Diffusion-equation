function [U_X] = FixedEndUX(X,T,N)
%This function sums the first N terms in the series of the partial
%derivative U_X for the fixed-endpoint-temperature problem.
sum=0;
for k = 1:N
    sum = sum - 2*exp(-k^2*pi^2*T)*cos(k*pi*X);
end

U_X = - 1 + sum;
end

