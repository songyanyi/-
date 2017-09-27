function [y, x, theta] = For2D(x0, y0, v_wind)
%
% �˺������ڸ���x0��y0�����ϵ��ϵͳ��״̬�����Լ��յ����� xn,yn
% ����x0,y0Ϊ��ʼ������
% ���yn,xnΪ�յ�����
%


%x0 = 20;y0 = -1;

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

%v_wind = 12;%���� m/s
S_wind = D*(h0-h);%��������� 
F_wind = 0.625*S_wind*v_wind^2;%����

theta1 = atan((F0-G0)/F_wind);%�ֹ�1��ˮƽ�н�
T1 = sqrt((F0-G0)^2+(F_wind)^2);%�ֹ�1������

T(1) = T1; theta(1) = theta1;

%�ֹ���������
for i = 1:4
    m(i) = 10;%�ֹ����� kg
    G(i) = m(i)*g;%�ֹ�����
    
    l(i) = 1;%�ֹܳ��� m
    d(i) = 50/1000;%�ֹ�ֱ�� m
    F(i) = rho*g*pi*(d(i)/2)^2*l(i);%�ֹܸ���
    
    T(i+1) = (  (F(i)-G(i)+T(i)*sin(theta(i)))^2  +...
        (T(i)*cos(theta(i)))^2    )^(1/2);
    
    theta(i+1) = atan(  (  (F(i)-G(i)+T(i)*sin(theta(i)))/...
        (T(i)*cos(theta(i)) ))   );
    
    %�ֹ�i�����꣨xi,yi��
    y(i+1) = y(i) - l(i)*sin(theta(i));
    x(i+1) = x(i) - l(i)*cos(theta(i));
end

%��Ͱ��������
m_tong = 100;%��Ͱ������ kg
G_tong = m_tong*g;%��Ͱ����
m_qiu = 1200;%���������� kg
G_qiu = m_qiu*g;%����������

l_tong = 1;%��Ͱ�� m
D_tong = 30/100;%��Ͱ�׳�
F_tong = rho*g*pi*(D_tong/2)^2*l_tong;%��Ͱ����

T_tong = ( (F_tong-G_tong-G_qiu+T(5)*sin(theta(5)))^2 + ...
                (T(5)*cos(theta(5)))^2)^(1/2);
theta_tong = atan( ((F_tong-G_tong-G_qiu+T(5)*sin(theta(5)))...
                      /(T(5)*cos(theta(5)))) );
T(6) = T_tong;
theta(6) = theta_tong;

y(6) = y(5) - l_tong*sin(theta(5));
x(6) = x(5) - l_tong*cos(theta(5)); 

%ê���߷���
L = 22.05;%ê������ m
II = 105/1000;%ê��ÿ�ڳ��� m
n = round(L/II);
m_II = 7;%��λ���ȵ����� kg/m
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











