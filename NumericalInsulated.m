function [AtTimeT] = NumericalInsulated(C,N,T)
%The program finds a numerical solution at time T to the
%insulated-end problem. It uses N spatial intervals and
%Courant number, C.

%The number of time intervals between time 0 and time T
M = (T*N^2/C);

%Initial condition means at T=0, U(1)=0.5 and U(n)=0 for all other n
Ustore = zeros(N+2,1);
Ustore(1) = 0.5;

U = zeros(N+2,1);
%The program completes M time steps to find the numerical solution at time
%T
for m = 1:M
    %The following for loop finds the numerical solution at time T = m*dT
    for n = 2:N+1
       U(n) = Ustore(n) + C*(Ustore(n+1) - 2*Ustore(n) + Ustore(n-1));
    end
    %The boundary conditions give us the first and last entries of U
    U(1) = 1;
    U(N+2) = U(N);
    %Overwrite the solution at time T=(m-1)*dT with the new solution at
    %time T=m*dT (in order to speed up calculations)
    Ustore = U;
end

AtTimeT = U(1:N+1);
end

