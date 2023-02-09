%Question 3: table for the discussion on stability
format short
clc
clear
close all

TXN = [0.1, 0.5, 30; 0.05, 0.1, 50; 1, 1, 20];
C = [0.05,0.2,0.4,0.5,0.6,0.8,1].';

NumberOfTerms = 7;

format shortE
for k = 1 : 3
    T = TXN(k,1);
    X = TXN(k,2);
    N = TXN(k,3);
    if floor(T*(N^2)./C) ~= T*(N^2)./C
        error('error')
    end
    Error = zeros(length(C),1);
    for c = 1:length(C)
        Numerical = NumericalInsulated(C(c), N ,T);
        Error(c) = InsulatedEndU(X,T,NumberOfTerms)- Numerical(N*X+1);
    end
    Varnames = {'C','Error'};
    Table = table(C, Error, 'VariableNames', Varnames)
end