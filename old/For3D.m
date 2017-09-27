function [y, x, theta] = For3D(x0, y0, m_qiu, n, m_II)
%
% �˺������ڸ���x0��y0�����ϵ��ϵͳ��״̬�����Լ��յ����� xn,yn
% ����x0,y0Ϊ��ʼ������
% ���yn,xnΪ�յ�����
%m_II����������


x(1) = x0; 
y(1) = y0;

h = abs(y(1));%�����ˮ���

%��������
rho = 1.025*10^3;%��ˮ���ܶ�  kg/m^3
g = 9.8;%�������ٶ� N/kg
D = 2;%Բ���������ֱ�� m
h0 = 2;%Բ������߶� m
m0= 1000;%�������� kg

F0 = rho*g*pi*(D/2)^2*h;%���긡��
G0 = m0*g;%��������

H = 18;%ˮ��
v1 = 36;%����
v2 = 1.5;%ˮ��
F_wind = 0.625*(D*(h0 - h))*v1^2;%����
Fs1 = 374*(D*h)*v2^2;


theta1 = atan((F0-G0)/(F_wind+Fs1));%�ֹ�1��ˮƽ�н�
T1 = sqrt((F0-G0)^2+(F_wind+Fs1)^2);%�ֹ�1������

T(1) = T1; theta(1) = theta1;

%�ֹ���������
for i = 1:4
    m(i) = 10;%�ֹ����� kg
    G(i) = m(i)*g;%�ֹ�����
    
    l(i) = 1;%�ֹܳ��� m
    d(i) = 50/1000;%�ֹ�ֱ�� m
    F(i) = rho*g*pi*(d(i)/2)^2*l(i);%�ֹܸ���
    
    Fs(i) = 374*(l(i)*sin(theta(i))*d(i))*v2^2;
    
    T(i+1) = (  (F(i)-G(i)+T(i)*sin(theta(i)))^2  +...
        (T(i)*cos(theta(i)) + Fs(i))^2    )^(1/2);
    
    theta(i+1) = atan(    (F(i)-G(i)+T(i)*sin(theta(i)))/...
        (T(i)*cos(theta(i))  + Fs(i))   );
    
    %�ֹ�i�����꣨xi,yi��
    y(i+1) = y(i) - l(i)*sin(theta(i));
    x(i+1) = x(i) - l(i)*cos(theta(i));
end

%��Ͱ��������
m_tong = 100;%��Ͱ������ kg
G_tong = m_tong*g;%��Ͱ����
% m_qiu = 1200;%���������� kg
G_qiu = m_qiu*g;%����������

l_tong = 1;%��Ͱ�� m
D_tong = 30/100;%��Ͱ�׳�
F_tong = rho*g*pi*(D_tong/2)^2*l_tong;%��Ͱ����

Fs_tong = 374*(l_tong*sin(theta(5))*D_tong)*v2^2;

T_tong = ( (F_tong-G_tong-G_qiu+T(5)*sin(theta(5)))^2 + ...
                (Fs_tong+T(5)*cos(theta(5)))^2)^(1/2);
theta_tong = atan( ((F_tong-G_tong-G_qiu+T(5)*sin(theta(5)))...
                      /(Fs_tong+T(5)*cos(theta(5)))) );
T(6) = T_tong;
theta(6) = theta_tong;

y(6) = y(5) - l_tong*sin(theta(5));
x(6) = x(5) - l_tong*cos(theta(5)); 

%ê���߷���

switch m_II 
    case 3.2
       II = 78/1000;%ê��ÿ�ڳ��� m    
    case 7
       II = 105/1000;%ê��ÿ�ڳ��� m
    case 12.5
       II = 120/1000;
    case 19.5
        II = 150/1000;
    case 28.12
        II = 180/1000;
end

G_mao = II*m_II*g;%��λ��������

for i = 6 : 6+n-1
    if  theta(i) - 0 >0.001
        T(i+1) = T(i) - G_mao*sin(theta(i));
        theta(i+1) = theta(i) - (G_mao*cos(theta(i)))/(T(i)-G_mao*sin(theta(i))); 
        y(i+1) = y(i) - sin(theta(i))*II;
        x(i+1) = x(i) - cos(theta(i))*II; 
    else 
        T(i+1) = 0;
        theta(i+1) = 0;
        y(i+1) = y(i);
        x(i+1) = x(i) - II;
    end
end

% T = T(1:end-1);
% theta = theta(1:end-1);











