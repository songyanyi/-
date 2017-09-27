%% ����m��y0 ��x0 ��alpha1֮��Ĺ�ϵͼ
%���ú���mANDhxalpha���з���
clc
clear besty0 bestx0 alpha1 alpha2
H = 18;
x0 = 20;
m_qiu = 1000;
n = 200;
m_II = 3.2;
v1=12;

figure(1)
v2 = linspace(0, 1.5, 5);
for i = 1:length(v2)
    [besty0(i), bestx0(i), alpha1(i), alpha2(i)] = vANDhxalpha(v2(i));
    [y(:, i), x(:, i), theta(:,i)] = For3Dv(bestx0(i), besty0(i), m_qiu, n, m_II, v1,v2(i));
    plot(x(:, i), y(:, i), '-','color', rand(3,1))
    hold on
end
legend('location', 'best')
xlabel('��ˮ����')
ylabel('ϵͳ״̬')
title('��ˮ���ٶ�ϵͳ״̬��Ӱ��')


clc
clear besty0 bestx0 alpha1 alpha2

v2 = 0.75;
figure(1)
H = linspace(16, 20, 5);
for i = 1:length(H)
    [besty0(i), bestx0(i), alpha1(i), alpha2(i)] = HANDhxalpha(H(i));
    [y(:, i), x(:, i), theta(:,i)] = For3Dv(bestx0(i), besty0(i), m_qiu, n, m_II, v1,v2);
    plot(x(:, i), y(:, i), '-','color', rand(3,1))
    hold on
end
legend('location', 'best')
xlabel('��ˮ����')
ylabel('ϵͳ״̬')
title('ˮ���ϵͳ״̬��Ӱ��')


%%  IENSGAii �������m��ʹ��pi*x^2���͡�alpha1С����alpha1��2�ڷ�Χ��
clear
clc

fitnessfcn = @multi_GA_mn;   
nvars = 2;                     
lb = [500, 100];                  
ub = [6000, 300];                     
A = []; b = [];                 
Aeq = []; beq = [];             
options = gaoptimset('ParetoFraction', 0.3, 'PopulationSize', 100, 'Generations', 150, 'StallGenLimit', 150, 'PlotFcns', {@gaplotpareto, @gaplotbestf});

[x, fval] = gamultiobj(fitnessfcn, nvars, A, b, Aeq, beq, lb, ub, options);

%% GA ��ⵥĿ


clear
clc
fitnessfcn = @GA_mn;           % ��Ӧ�Ⱥ������
nvars = 2;         % ����ı�����Ŀ
lb = [500, 100];
ub = [6000, 300];
options = gaoptimset('PopulationSize',500,'CrossoverFraction',0.75,'Generations',20,'StallGenLimit',40,'PlotFcns',{@gaplotbestf,@gaplotbestindiv}); %��������
[x_best, fval,  exitflag] = ga(fitnessfcn, nvars, [],[],[],[],lb,ub,[],2,options);   % ����ga����

