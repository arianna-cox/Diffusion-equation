%Question 3: tables and graphs for the discussion on accuracy
clc
clear
close all
format short

NumberOfTerms = 7;
Nvector = [10:2:100];
C = 0.1;

T = 0.25;
X = 0.5;
ErrorN = zeros(length(Nvector),1);
for n = 1:length(Nvector)
    Numerical = NumericalInsulated(C, Nvector(n),T);
    ErrorN(n) = InsulatedEndU(X,T,NumberOfTerms)- Numerical((Nvector(n)/2)+1);
end

%Plotting a log-log graph of absolute error at X=0.5, T=0.25 against N for
%fixed C
figure
plot(log(Nvector), log(abs(ErrorN)), 'r.')
hold on
xlabel('log N')
ylabel('log|Error|')
hold off

%Using linear regression to find the gradient of the graph
LinearRegression = fitlm(log(Nvector), log(abs(ErrorN)));
gradientN = LinearRegression.Coefficients.Estimate(2)


%Finding the gradient of the log-log graph of absolute error
%against N for different values of X, T and C
TXC = [0.1, 0.5, 0.4; 0.5, 0.2, 0.1; 0.7, 0.9, 0.2; 0.9, 0.1, 0.25; 1, 1, 0.01];
N1 = [20:10:100];

gradient = zeros(5,1);
for k = 1 : 5
    T = TXC(k,1);
    X = TXC(k,2);
    C = TXC(k,3);
    if floor(T.*(N1.^2)./C) ~= T.*(N1.^2)./C
        error('error')
    end    
    Error = zeros(length(N1),1);
    for n = 1:length(N1)
        Numerical = NumericalInsulated(C, N1(n),T);
        Error(n) = InsulatedEndU(X,T,NumberOfTerms)- Numerical(N1(n)*X+1);
    end
    %Using linear regression to find the gradient of the graph
    LinearRegression = fitlm(log(N1), log(abs(Error)));
    gradient(k) = LinearRegression.Coefficients.Estimate(2);
    
    %figure
    %plot(log(N1), log(abs(Error)), 'r.')
end
Varnames = {'T','X','C','Gradient'}
table(TXC(:,1),TXC(:,2),TXC(:,3),gradient, 'VariableNames', Varnames)

N = 100;
T = 0.25;
X = 0.5;
Cvector = T*N^2./[5000:500:50000];
ErrorC = zeros(length(Cvector),1);
if floor(T*(N^2)./C) ~= T*(N^2)./C
   error('error')
end  
for c = 1:length(Cvector)
    Numerical = NumericalInsulated(Cvector(c),N,T);
    ErrorC(c) = InsulatedEndU(X,T, NumberOfTerms) - Numerical((N/2)+1);
end

%Plotting a log-log graph of absolute error at X=0.5, T=0.25 against C for
%fixed N
figure
plot(log(Cvector + 1), log(abs(ErrorC)), 'r.')
hold on
xlabel('log (C+1)')
ylabel('log|Error|')
hold off