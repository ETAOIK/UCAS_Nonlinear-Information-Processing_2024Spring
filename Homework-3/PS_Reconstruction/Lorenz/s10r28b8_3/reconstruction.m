clc
clear
close all

% ���� Chen ʱ������

a = 35;            % Lorenz ���̲��� a = 16 | 10
b = 3;                  %                 b = 4 | 8/3
c = 28;               %                 c = 45.92 | 28        

y = [-1,0,1];           % ��ʼ�� (1 x 3 ��������)
% y = [15.34,13.68,37.91]
h = 0.01;               % ����ʱ�䲽��

k1 = 30000;             % ǰ��ĵ�������
k2 = 5000;              % ����ĵ�������

Chen = @(t,y)[a*(y(2)-y(1));
          (c-a)*y(1)-y(1)*y(3)+c*y(2);
          -b*y(3)+y(1)*y(2)];
T = 0:h:h*(k1+k2);
[T,z] = ode45(Chen,T,y);

% ȥ����̬��
X = z(k1+1:end,:);
x = X(:,1);

% figure
% plot(x);

%% �ع���ռ�
tau = 14;
figure
    temp = x(1:end);
    xx = temp(1:end - 2*tau);
    yy = temp(1 + tau:end - 2*tau + tau);
    zz = temp(1 + 2*tau:end);
    %subplot(1,3,i);
    subplot(1,2,2);
    plot3(xx,yy,zz,'.');
    xlabel('x(t)');
    ylabel('x(t+tau)');
    zlabel('x(t+2*tau)');
    title(['tau = ',num2str(tau)]);


%% ԭʼ��ռ�
% figure
subplot(1,2,1);
plot3(X(1:end,1),X(1:end,2),X(1:end,3),'.');
xlabel('x(t)');
ylabel('y(t)');
zlabel('z(t)');
