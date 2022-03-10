function q = TwoStations(N, s, lam, mu, opt, D)

% N = [17, 20, 23];
% s = [9,  10,  11];
% opt = 3;
% lam = [34, 19, 7];
% mu = [3.75, 2.08, 0.67];
% D = 0.7;

rou = lam./mu;
rous = rou./s;

pie0 = zeros(opt,1); % Probability of State 0
L = zeros(opt, 1); % Queuing Length
n = zeros(opt, 1); % Occupied Servers
loss = zeros(opt, 1); 

q = 0;


% 计算QoS
for i = 1:opt
    for k = 0:s(i)-1
        pie0(i) = pie0(i) + rou(i)^k/factorial(k);
    end
    
    pie0(i) = pie0(i) + rou(i)^s(i)*(1-rous(i)^(N(i)-s(i)+1))/(factorial(s(i))*(1-rous(i)));
    pie0(i) = 1/pie0(i);
    
    % 计算稳态分布
    for k = 0:N(i)
        if k <= s(i)
            piek(k+1,i) = (1/factorial(k))*rou(i)^k*pie0(i);
        else
            piek(k+1,i) = (rou(i)^k)*pie0(i)/(factorial(s(i))*s(i)^(k-s(i)));
        end
    end
    
    % 计算排队长度
    for k = 1:N(i)+1
        if k > s(i)+1
            L(k,i) = k-s(i)-1;
        end
    end
    
    % 计算等待时间
    for k = 1:N(i)+1
        if k > s(i)+1
            W(k,i) = L(k,i)/(lam(i)*(1-piek(N(i)+1,i)));
        end
    end
    
    % 计算每个charging system的QoS(service performance)
    for k = 1:N(i)+1
        if k > s(i)+1
            Q(k,i) = 1 - W(k,i)/W(N(i)+1,i);
        else
            Q(k,i) = 1;
        end
    end
    
    % 计算排队系统内的人数
    for k = 0:s(i)-1
        n(i) = n(i) + piek(k+1,i)*(k+1);
    end
    for k = s(i):N(i)
        n(i) = n(i) + piek(k+1,i)*s(i);
    end
    
    % 计算客户损失率
    if lam(i) <= mu(i)*n(i)
        loss(i) = 0;
    else
        loss(i) = (lam(i) - mu(i)*n(i))/lam(i);
    end
    
end

for p = 1:N(1)+1
    for w = 1:N(2)+1
        for e = 1:N(3)+1
            for r = 1:N(1)+1
                for t = 1:N(2)+1
                    for y = 1:N(3)+1
                        g1 = (lam(1)*Q(p,1)+lam(2)*Q(w,2))/(lam(1)+lam(2));
                        g2 = max([g1,Q(e,3)]);
                        g3 = (Q(r,1)+Q(t,2)+Q(y,3))/3;
                        %  if (lam(1)*Q(p,1)+lam(2)*Q(w,2)+lam(3)*Q(e,3))/sum(lam) < D
                        if min([g1,g2,g3]) < D
                            continue
                        end
                         q = q + piek(p,1)*piek(w,2)*piek(e,3)*piek(r,1)*piek(t,2)*piek(y,3); 
                    end
                end
            end
        end      
    end
end


