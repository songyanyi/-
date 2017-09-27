function f = multi_GA_mn(m_qiu, n)
%�˺������ڽ����������������ڵ�Ŀ�꺯��
% 
% �˳������������������
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ������1�ļ����£�
% ���㺣�����Ϊ36m/sʱ��Ͱ�͸��ڸֹܵ���б�Ƕȡ�
% ê����״�͸�����ζ�����
% ������������������ʹ�ø�Ͱ����б�ǶȲ�����5�ȣ�
% ê����ê���뺣���ļнǲ�����16�ȡ�
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%

m_II = 3.2;
H = 18;

x0 = 20;
y0_fig = linspace(-0.00001, -2, 100);
for i = 1:length(y0_fig)
    [ynn, xnn, thetann] = For3D(x0, y0_fig(i), m_qiu, n, m_II);
    yn_fig(i) =  ynn(end);
    xn_fig(i) =  xnn(end);
    thetan_fig(i) =  thetann(end-1);
end

[~, ind1] = min(abs(yn_fig - (-H)));
besty0 = y0_fig(ind1);
bestx0 = x0 - xn_fig(ind1);

%����bestx0, besty0����µ�ϵͳ��Ϣ��ϵͳͼ��
[~, ~, besttheta] = For3D(bestx0, besty0, m_qiu, n, m_II);

alpha1 = pi/2 - besttheta(5);
alpha2 = besttheta(end-1);

f(1) = abs(besty0);
f(2) = pi*bestx0^2 + 10*alpha1;
end









