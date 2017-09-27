
v_wind = 36;
bestpointANDfig(v_wind)
[ax, ay, atheta] = bestpointANDfig(v_wind);
alpha1 = pi/2-atheta(5);
alpha2 = atheta(end-1);
%% ����m��y0 ��x0 ��alpha1֮��Ĺ�ϵͼ
%���ú���mANDhxalpha���з���
clc
clear besty0 bestx0 alpha1 alpha2

m = linspace(1000, 6000, 100);
for i = 1:length(m)
    [besty0(i), bestx0(i), alpha1(i), alpha2(i)] = mANDhxalpha(m(i));
end

figure(1)
plot(m, -besty0, 'r*-')
xlabel('����������')
ylabel('��ˮ���')
title('��ˮ����������������仯����')

figure(2)
plot(m, bestx0, 'c<-')
xlabel('����������')
ylabel('��Ư����')
title('��Ư�����������������仯����')

figure(3)
plot(m, alpha1, 'bo-')
xlabel('����������')
ylabel('��Ͱ��ֱ����н�')
title('��Ͱ��ֱ����н��������������仯����')

figure(4)
plot(m, alpha2, 'gs-')
xlabel('����������')
ylabel('ê���׶�ˮƽ����н�')
title('ê���׶�ˮƽ����н��������������仯����')

%% ȷ��m��ȡֵ��Χ
%alpha1 2Ҫ����Ҫ��
alpha1_max = 5/90*(pi/2);
alpha2_max = 16/90*(pi/2);

[~, ind1] = min(abs(alpha1 - alpha1_max));
m1 = m(ind1);
[~, ind2] = min(abs(alpha2 - alpha2_max));
m2 = m(ind2);

  % s.t.  max{m1, m2}  <  m  
  
%%  IENSGAii �������m��ʹ��pi*x^2���͡�alpha1С����alpha1��2�ڷ�Χ��
clear
clc

fitnessfcn = @multi_GA_m;   
nvars = 1;                     
lb = [1000];                  
ub = [6000];                     
A = []; b = [];                 
Aeq = []; beq = [];             
options = gaoptimset('ParetoFraction', 0.3, 'PopulationSize', 100, 'Generations', 150, 'StallGenLimit', 150, 'PlotFcns', {@gaplotpareto, @gaplotbestf});

[x, fval] = gamultiobj(fitnessfcn, nvars, A, b, Aeq, beq, lb, ub, options);













