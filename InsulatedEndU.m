function [U] = InsulatedEndU(X,T,N)
%This function sums the first N terms in the series of the analytic
%solution to the insulated-end problem.
sum=0;
for k = 1:N
    sum = sum - 2*exp(-(k-(1/2))^2*pi^2*T)*sin((k-(1/2))*pi*X)/(pi*(k-(1/2)));
end

U = 1 + sum;
end