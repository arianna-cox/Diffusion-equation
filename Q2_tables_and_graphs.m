%Question 2 tables and plots
format long
clear
clc
close all

%number of terms in the series
N=7;

X = linspace(0,1,9).';
%Evaluate fixed-endpoint-temperature solution at T=0.25
FixedEnd = FixedEndU(X, 0.25, N);

%Evaluate insulated-endpoint-temperature solution at T=0.25
InsulatedEnd = InsulatedEndU(X, 0.25, N);

%Evaluate semi-infinite solution at T=0.25
f = @(X,T) erfc(X/(2*T^0.5));
SemiInfinite = f(X, 0.25);

Varnames = {'X', 'Fixed End U', 'Insulated End U', 'Semi Infinite'};
Table = table(X ,FixedEnd, InsulatedEnd, SemiInfinite, 'VariableNames', Varnames)

%Plot non-dimensionalised temperature profiles, U, agianst X
%for T = 0.05, 0.1, 0.2, 0.5, 1 and 2

X = linspace(0,1);

figure('Name','Graph of U for Fixed-endpoint-temperature problem')
for T = [0.05, 0.1, 0.2, 0.5, 1, 2]
    plot(X, FixedEndU(X,T,N)) 
    hold on
end
xlabel('X')
ylabel('U')
legend('T = 0.05','T = 0.1','T = 0.2','T = 0.5','T = 1.0','T = 2.0')
hold off

figure('Name','Graph of U for Insulated-end problem')
for T = [0.05, 0.1, 0.2, 0.5, 1, 2]
    plot(X, InsulatedEndU(X,T,N))
    hold on
end
xlabel('X')
ylabel('U')
legend('T = 0.05','T = 0.1','T = 0.2','T = 0.5','T = 1.0','T = 2.0')
hold off

figure('Name','Graph of U for semi-infinite problem')
for T = [0.05, 0.1, 0.2, 0.5, 1, 2]
    plot(X,f(X,T))
    hold on
end
xlabel('X')
ylabel('U')
legend('T = 0.05','T = 0.1','T = 0.2','T = 0.5','T = 1.0','T = 2.0')
hold off

%Heat flux for the semi-infite problem
fX0 = @(T) -1./((T.^0.5).*sqrt(pi));

%Plot heat flux for T in the interval (0.05, 2)
T = linspace(0.05,2);
figure('Name','Graph of non-dimensionalised heat flux -U_X at X=0')
plot(T, -FixedEndUX(0,T,N))
hold on
plot(T, -InsulatedEndUX(0,T,N))
plot(T, -fX0(T))
xlabel('T')
ylabel('-U_{X} at X=0')
xlim([0.05 2])
grid on
legend('Fixed End','Insulated End', 'Semi Infinite')
hold off
