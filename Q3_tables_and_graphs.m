%Question 3 tables and graphs for part i) and ii)
clc
close all
clear

C=0.5
N=10
NumberOfTerms = 20
X = linspace(0,1,N+1).';
for T = [0.1, 0.2, 0.5, 1]
    Varnames = {'X','Numerical Solution','Analytic solution','Error'};
    table(X, NumericalInsulated(C,N,T), InsulatedEndU(X,T,NumberOfTerms), InsulatedEndU(X,T,NumberOfTerms)-NumericalInsulated(C,N,T), 'VariableNames', Varnames)
end

for T = [0.05, 0.1, 0.2, 0.5, 1, 2]
     figure('Name',['Graph of solution to the Insulated End problem at time T= ',num2str(T)])
     plot (X, NumericalInsulated(C, N, T))
     hold on
     plot(X,InsulatedEndU(X,T,NumberOfTerms))
     xlabel('X')
     ylabel(['Solution at T= ',num2str(T)])
     legend('Numerical Solution','Analytic Solution')
     hold off
end