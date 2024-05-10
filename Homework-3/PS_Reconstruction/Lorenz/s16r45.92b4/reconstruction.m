clc
clear
close all

% 产生 Lorenz 时间序列

sigma = 16;             % Lorenz 方程参数 a = 16 | 10
b = 4;                  %                 b = 4 | 8/3
r = 45.92;              %                 c = 45.92 | 28        

y = [-1,0,1];           % 起始点 (1 x 3 的行向量)
%y = [15.34,13.68,37.91]
h = 0.01;               % 积分时间步长

k1 = 30000;             % 前面的迭代点数
k2 = 5000;              % 后面的迭代点数

Lorenz = @(t,y)[-sigma*(y(1)-y(2));
          r*y(1)-y(1)*y(3)-y(2);
          -b*y(3)+y(1)*y(2)];
T = 0:h:h*(k1+k2);
[T,z] = ode45(Lorenz,T,y);

% 去除暂态点
X = z(k1+1:end,:);
x = X(:,1);

%% 重构相空间
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


%% 原始相空间
figure
plot3(X(1:end,1),X(1:end,2),X(1:end,3),'.');
xlabel('x(t)');
ylabel('y(t)');
zlabel('z(t)');
