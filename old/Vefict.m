%���ٶ�ϵͳ״̬��Ӱ��
clc
clear
v = 10:5:40;
figure(1)
for i = 1:length(v)
    [ax(:, i), ay(:, i), atheta(:, i)] = bestpointANDfig(v(i));
    plot(ax(:, i), ay(:, i),'-', 'color', rand(3, 1))
    hold on
end
legend('location', 'best')
xlabel('����')
ylabel('ϵͳ״̬')
title('������С��ϵͳ״̬��Ӱ��')

figure(2)
for i = 1:length(v)
    plot(atheta(:, i), '-', 'color', rand(3, 1))
    hold on
end
legend('location', 'best')
xlabel('����')
ylabel('ϵͳ������ˮƽ�н�')
title('������С��ϵͳ������ˮƽ�нǵ�Ӱ��')

