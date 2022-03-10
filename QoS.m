function [Q, piek] = QoS(lam, mu)

% Flam = [13,16,19];
% Fmu = [2,2.5,3];
% 
% lam = Flam(1);
% mu = Fmu(3);

N = 23;
s = 11;
rou = lam/mu;
rous = rou/s;

pie0 = 0;
for k = 0:s-1
    pie0 = pie0 + rou^k/factorial(k);
end
pie0 = pie0 + rou^s*(1-rous^(N-s+1))/(factorial(s)*(1-rous));
pie0 = 1/pie0;

% pie_k
piek = zeros(N+1,1);
for k = 0:N
   if k <= s
      piek(k+1) = (1/factorial(k))*rou^k*pie0; 
   else
      piek(k+1) = (rou^k)*pie0/(factorial(s)*s^(k-s));
   end
end

L = zeros(N+1,1);
W = zeros(N+1,1);
% queuing length

for k = 1:N+1
    if k > s+1
        L(k) = k-s-1;
    end
end


% waiting time
roue = lam*(1-piek(N+1));
for k = 1:N+1
    if k > s+1
        W(k) = L(k)/roue;
    end
end

% W_mean = sum(piek.*W);

Q = ones(N+1,1);
for k = 1:N+1
    if k > s+1
        Q(k) = 1 - W(k)/W(N+1);
    end
end

