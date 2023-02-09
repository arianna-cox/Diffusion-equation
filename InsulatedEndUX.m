function [U_X] = InsulatedEndUX(X,T,N)
%This function sums the first N terms in the series of the partial
%derivative U_X for the insulated-end problem.
sum=0;
for k = 1:N
    sum = sum - 2*exp(-(k-(1/2))^2*pi^2*T)*cos((k-(1/2))*pi*X);
end

U_X = sum;
end


