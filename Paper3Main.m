clear;
N = [17, 20, 23];
s = [9,  10,  11];

% lamax = [41, 21, 8.5];
% lamin = [29, 15, 6.5];
% mumax = [4, 2.23, 0.72];
% mumin = [3.35, 1.81, 0.53];

opt = 3;
lam = [34, 19, 7];
lam1 = 1.1*lam;
lam2 = 0.9*lam;

mu = [3.75, 2.08, 0.67];
mu1 = 0.9*mu;
mu2 = 1.1*mu;
D = 0:0.05:1;



%Figure 1-1

for d = 1:length(D)
    q(d) = ServiceQoS(N, s, lam, mu, opt, D(d));  
end

for d = 1:length(D)
    q1(d) = ServiceQoS(N, s, lam1, mu, opt, D(d));  
end

for d = 1:length(D)
    q2(d) = ServiceQoS(N, s, lam2, mu, opt, D(d));  
end

mean_wait= sum(ServiceTime(N, s, lam, mu, opt)/opt);
fix = 0.6930;

figure;
plot(D,q, '-g','color',[0.50,0.70,0.30],'LineWidth',3); hold on
grid on
set(gca, 'FontSize',13,'FontWeight','normal','FontName','Times New Roman','GridAlpha', 0.25);
ylim([0, 1.1])
x = xlabel('QRL');
set(x,'FontName','Times New Roman','FontSize',14,'FontWeight','bold');
y = ylabel('QoS');
set(y,'FontName','Times New Roman','FontSize',14,'FontWeight','bold');

plot([0,1],[0.6930, 0.6930], '-k','color',[0.50,0.50,0.50],'LineWidth',3); hold on
plot([0.6045,0.6045],[0, 0.6930],'--k', 'LineWidth',1)
h = legend('{EUGF-based Method}','{Without considering QRL}','Location','northeast');
set(h,'Interpreter','latex','FontSize',13,'FontWeight','normal')






% Figure 1-2

% figure;
% [x, y] = meshgrid(1:16,0:0.05:1);
% a = 0:0.05:1;
% for i = 1:16
%     for j = 1:21
%         z(j,i) = ServiceQoS(N, [i, s(2), s(3)], lam, mu, opt, a(j));
%     end
% end
% 
% surf(x,y,z);
% A1 = xlabel('Number of Chargers');
% A2 = ylabel('QRL');
% A3 = zlabel('QoS');
% set(gca, 'FontSize',14,'FontWeight','normal','FontName','Times New Roman','GridAlpha', 0.4);
% zlim([0, 1.1])
% set(A1,'FontName','Times New Roman','FontSize',14,'FontWeight','bold')
% set(A2,'FontName','Times New Roman','FontSize',14,'FontWeight','bold')
% set(A3,'FontName','Times New Roman','FontSize',14,'FontWeight','bold')







% Figure 1-3

% figure;
% [lamA, d] = meshgrid(10:28,0:0.05:1);
% b = 0:0.05:1;
% t = 1;
% for i = 10:28
%     for j = 1:21
%         c(j,t) = ServiceQoS(N, s, [lam(1), i, lam(3)], mu, opt, b(j));
%     end
%     t = t + 1;
% end
% 
% surf(lamA,d,c);
% A1 = xlabel('Arrival Rate');
% A2 = ylabel('QRL');
% A3 = zlabel('QoS');
% set(gca, 'FontSize',14,'FontWeight','normal','FontName','Times New Roman','GridAlpha', 0.4);
% zlim([0, 1.1])
% set(A1,'FontName','Times New Roman','FontSize',14,'FontWeight','bold')
% set(A2,'FontName','Times New Roman','FontSize',14,'FontWeight','bold')
% set(A3,'FontName','Times New Roman','FontSize',14,'FontWeight','bold')




% Figure 2-1 (Composition Operator Comparasion)

% figure;
% 
% for d = 1:length(D)
%     qsimave(d) = ServiceQoS(N, s, lam, mu, opt, D(d));  
% end
% 
% for d = 1:length(D)
%     qweiave(d) = WeiAveQoS(N, s, lam, mu, opt, D(d));  
% end
% 
% for d = 1:length(D)
%     qminave(d) = MinQoS(N, s, lam, mu, opt, D(d));  
% end

% 
% for d = 1:length(D)
%     qmaxave(d) = MaxQoS(N, s, lam, mu, opt, D(d));  
% end
% 
% plot(D,qsimave, '-g','color',[0.50,0.70,0.30],'LineWidth',3); hold on
% plot(D,qweiave, '-b','color',[0.35,0.35,0.65],'LineWidth',3); hold on
% plot(D,qminave, '-r','color',[0.75,0.30,0.30],'LineWidth',3); hold on
% plot(D,qmaxave, '-k','color',[0.50,0.50,0.50],'LineWidth',3); hold on
% 
% x = xlabel('QRL');
% set(x,'FontName','Times New Roman','FontSize',14,'FontWeight','bold')
% y = ylabel('QoS');
% set(y,'FontName','Times New Roman','FontSize',14,'FontWeight','bold')
% ylim([0, 1.1])
% h = legend('{Simple Average}','{Weighted Average}','{Minimum}','{Maximum}','Location','southwest');
% set(h,'Interpreter','latex','FontSize',14,'FontWeight','normal')
% 
% grid on
% set(gca, 'FontSize',14,'FontName','Times New Roman','GridAlpha', 0.3);





% Figure 2-2 

% figure;
% for d = 1:length(D)
%     qd1(d) = TwoStations(N, s, lam, mu, opt, D(d));  
% end
% 
% plot(D, qd1, '-g','color',[0.50,0.70,0.30],'LineWidth',3); hold on
% ylim([0, 1.1])
% grid on
% set(gca, 'FontSize',14,'FontName','Times New Roman','GridAlpha', 0.3);
% x = xlabel('QRL');
% set(x,'FontName','Times New Roman','FontSize',14,'FontWeight','bold')
% y = ylabel('QoS');
% set(y,'FontName','Times New Roman','FontSize',14,'FontWeight','bold')


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
% Figure 3-1 (Fuzzy Version)

% lamax = [39, 21, 7.5];
% lamin = [29, 17, 6.5];
% mumax = [4, 2.23, 0.77];
% mumin = [3.4, 1.93, 0.62];
% 
% % lam = [34, 19, 7];
% % mu = [3.75, 2.08, 0.67];
% D = 0:0.1:1;
% for d = 1:length(D)
%     qg1(d) = ServiceQoS(N, s, lam, mu, opt, D(d));
% end
% 
% for d = 1:length(D)
%     qg2(d) = ServiceQoS(N, s, lamax, mumin, opt, D(d));  
% end
% 
% for d = 1:length(D)
%     qg3(d) = ServiceQoS(N, s, lamin, mumax, opt, D(d));  
% end
% 
% qg4 = qg3 - qg2;
% 
% figure;
% plot(D,qg1, '-g','color',[0.50,0.70,0.30],'LineWidth',3); hold on
% plot(D,qg2, '--b','color',[0.35,0.35,0.65],'LineWidth',2); hold on
% plot(D,qg3, '--r','color',[0.75,0.30,0.30],'LineWidth',2); hold on
% 
% ylim([0, 1.1])
% grid on
% set(gca, 'FontSize',14,'FontWeight','normal','FontName','Times New Roman','GridAlpha', 0.3);
% x = xlabel('QRL');
% set(x,'FontName','Times New Roman','FontSize',14,'FontWeight','bold')
% y = ylabel('QoS');
% set(y,'FontName','Times New Roman','FontSize',14,'FontWeight','bold')
% 
% h = legend('{Crisp Case ($\alpha = 1$)}','{Lower Bound}','{Upper Bound}','Location','southwest');
% set(h,'Interpreter','latex','FontSize',14,'FontWeight','normal')
% 
% % Figure 3-2 (Fuzzy Version)
% 
% figure;
% 
% plot(D,qg4, '-k','color',[0.50,0.50,0.50],'LineWidth',3); hold on
% grid on
% set(gca, 'FontSize',14,'FontWeight','normal','FontName','Times New Roman','GridAlpha', 0.3);
% x = xlabel('QRL');
% set(x,'FontName','Times New Roman','FontSize',14,'FontWeight','bold')
% y = ylabel('Fuzzy Interval Length');
% set(y,'FontName','Times New Roman','FontSize',14,'FontWeight','bold')
% plot([0.7,0.7],[0,0.8246],'--k','LineWidth',1.5);


% Figure 3-3 (Fuzzy Version)

% lamax = [39, 21, 7.5];
% lamin = [29, 17, 6.5];
% mumax = [4, 2.23, 0.77];
% mumin = [3.4, 1.93, 0.62];
% 
% for i = 1:11
%     lamnow1(i) = (i-1)*(lam(1)-lamin(1))/10 + lamin(1);
%     lamnow2(i) = (i-1)*(lam(2)-lamin(2))/10 + lamin(2);
%     lamnow3(i) = (i-1)*(lam(3)-lamin(3))/10 + lamin(3);
%     
%     lamnow1(22-i) = lamax(1)-(i-1)*(lamax(1)-lam(1))/10;
%     lamnow2(22-i) = lamax(2)-(i-1)*(lamax(2)-lam(2))/10;
%     lamnow3(22-i) = lamax(3)-(i-1)*(lamax(3)-lam(3))/10;
%     
%     munow1(i) = (i-1)*(mu(1)-mumin(1))/10 + mumin(1);
%     munow2(i) = (i-1)*(mu(2)-mumin(2))/10 + mumin(2);
%     munow3(i) = (i-1)*(mu(3)-mumin(3))/10 + mumin(3);
%     
%     munow1(22-i) = mumax(1)-(i-1)*(mumax(1)-mu(1))/10;
%     munow2(22-i) = mumax(2)-(i-1)*(mumax(2)-mu(2))/10;
%     munow3(22-i) = mumax(3)-(i-1)*(mumax(3)-mu(3))/10;
% end
% 
% alpha = [0:0.1:1, 0.9:-0.1:0];
% 
% for i = 1:length(lamnow1)
%     qf(i) = ServiceQoS(N, s, [lamnow1(i),lamnow2(i),lamnow3(i)], [munow1(i),munow2(i),munow3(i)], opt, 0.6);
% end


% figure;
% 
% plot([0.7001, 0.7001],[0,1],'--b','LineWidth',1.5); hold on
% plot([0.7111, 0.7001],[0,1],'--r','LineWidth',1.5); hold on
% plot(qf,alpha, '-k','color',[0.50,0.50,0.50],'LineWidth',3); hold on
% x = xlabel('QoS');
% set(x,'FontName','Times New Roman','FontSize',14,'FontWeight','bold')
% y = ylabel('$\alpha$-cuts Level');
% set(y,'Interpreter','Latex','FontSize',14,'FontWeight','bold')
% grid on
% set(gca, 'FontSize',14,'FontWeight','normal','FontName','Times New Roman','GridAlpha', 0.3);
% 
% 
% h = legend('{Mean of Maximum}','Weighted Average Membership','Location','northeast');
% set(h,'Interpreter','latex','FontSize',14,'FontWeight','normal')

% Figure 6

% piek = SteadyState(N, s, lam, mu, opt, 1);  
% t = 1;
% for i = 1:24
%     if mod(i,2)~=0
%        piekk(t,:)=piek(i,:);
%        t=t+1;
%     end
% end
% a = 1:12;
% figure;
% bar(a,piekk);
% grid on
% h = legend('System #1','System #2','System #3','Location','northwest');
% set(h,'FontName','Times New Roman','FontSize',13,'FontWeight','normal')
% ylim([0,0.1])
% xticklabels({0,2,4,6,8,10,12,14,16,18,20,22})
% set(gca, 'FontSize',12,'FontWeight','normal','FontName','Times New Roman','GridAlpha', 0.2);
% x = xlabel('Queuing State');
% set(x,'FontName','Times New Roman','FontSize',14,'FontWeight','bold')
% y = ylabel('Probability ');
% set(y,'FontName','Times New Roman','FontSize',14,'FontWeight','bold')
