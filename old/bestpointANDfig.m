function [ax, ay, atheta] = bestpointANDfig(v_wind)
%�˺�����ͼ�ⷨ������h
% 
%bestpointANDfig(12)
%bestpointANDfig(24)
%bestpointANDfig(36)
% �˳������������������
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ĳ�ʹ���ڵ�ѡ��II�͵纸ê��22.05m��
% ѡ�õ������������Ϊ1200kg��
% �ֽ����ʹ���ڵ㲼����ˮ��18m��
% ����ƽ̹����ˮ�ܶ�Ϊ1.025��103kg/m3�ĺ���
% ����ˮ��ֹ���ֱ���㺣�����Ϊ12m/s��24m/sʱ��Ͱ��
% ���ڸֹܵ���б�Ƕȡ�ê����״������ĳ�ˮ��Ⱥ��ζ�����
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%

H = 18;

x0 = 20;

y0_fig = linspace(-0.00001, -2, 2000);
for i = 1:length(y0_fig)
    [ynn, xnn, thetann] = For2D(x0, y0_fig(i), v_wind);
    yn_fig(i) =  ynn(end);
    xn_fig(i) =  xnn(end);
    thetan_fig(i) =  thetann(end-1);
end

[~, ind1] = min(abs(yn_fig - (-H)));
besty0 = y0_fig(ind1);
bestx0 = x0 - xn_fig(ind1);

%����bestx0, besty0����µ�ϵͳ��Ϣ��ϵͳͼ��
[besty, bestx, besttheta] = For2D(bestx0, besty0, v_wind);

if nargout > 0
    ax = bestx;
    ay = besty;
    atheta = besttheta;
else
    format long
    disp('���ź�����Ϊ��')
    bestx0

    disp('����������Ϊ��')
    besty0

    disp('���ų�ˮ���Ϊ��')
    abs(besty0)

    disp('�ֹܸ�Ͱˮƽ���Ϊ��')
    besttheta(1:5)
    
    figure
    plot(bestx, besty)
    xlabel('��������')
    ylabel('��ֱ����')
    title(['���ų�ˮ����', num2str(abs(besty0)), 'ʱ��ϵ��ϵͳ����'])
    text(bestx(1)-1, besty(1), [num2str(bestx(1)),',',num2str(besty(1))])

    figure
    plot(y0_fig, yn_fig, 'r*-')
    xlabel('��ˮ���')
    ylabel('ê��ĩ������')
    title('ê��ĩ�����ˮ��ȵı仯����ͼ')
    
    figure
    plot(y0_fig, thetan_fig, 'r*-')
    xlabel('��ˮ���')
    ylabel('ê��ĩ��ˮƽ�н�')
    title('ê��ĩ��ˮƽ�н����ˮ��ȵı仯����ͼ')    
end
end









