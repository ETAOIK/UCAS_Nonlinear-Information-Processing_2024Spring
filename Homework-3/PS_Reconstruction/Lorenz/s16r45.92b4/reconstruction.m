clc
clear
close all

% ���� Lorenz ʱ������

sigma = 16;             % Lorenz ���̲��� a = 16 | 10
b = 4;                  %                 b = 4 | 8/3
r = 45.92;              %                 c = 45.92 | 28        

y = [-1,0,1];           % ��ʼ�� (1 x 3 ��������)
%y = [15.34,13.68,37.91]
h = 0.01;               % ����ʱ�䲽��

k1 = 30000;             % ǰ��ĵ�������
k2 = 5000;              % ����ĵ�������

Lorenz = @(t,y)[-sigma*(y(1)-y(2));
          r*y(1)-y(1)*y(3)-y(2);
          -b*y(3)+y(1)*y(2)];
T = 0:h:h*(k1+k2);
[T,z] = ode45(Lorenz,T,y);

% ȥ����̬��
X = z(k1+1:end,:);
x = X(:,1);

%% �ع���ռ�
tau = 12;
figure
    temp = x(1:end);
    xx = temp(1:end - 2*tau);
    yy = temp(1 + tau:end - 2*tau + tau);
    zz = temp(1 + 2*tau:end);
    %subplot(1,3,i);
    plot3(xx,yy,zz,'.');
    xlabel('x(t)');
    ylabel('x(t+tau)');
    zlabel('x(t+2*tau)');
    title(['tau = ',num2str(tau)]);


%% ԭʼ��ռ�
figure
plot3(X(1:end,1),X(1:end,2),X(1:end,3),'.');
xlabel('x(t)');
ylabel('y(t)');
zlabel('z(t)');
