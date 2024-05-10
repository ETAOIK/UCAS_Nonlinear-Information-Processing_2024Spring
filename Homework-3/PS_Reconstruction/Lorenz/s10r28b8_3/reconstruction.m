clc
clear
close all

% 产生 Chen 时间序列

a = 35;            % Lorenz 方程参数 a = 16 | 10
b = 3;                  %                 b = 4 | 8/3
c = 28;               %                 c = 45.92 | 28        

y = [-1,0,1];           % 起始点 (1 x 3 的行向量)
% y = [15.34,13.68,37.91]
h = 0.01;               % 积分时间步长

k1 = 30000;             % 前面的迭代点数
k2 = 5000;              % 后面的迭代点数

Chen = @(t,y)[a*(y(2)-y(1));
          (c-a)*y(1)-y(1)*y(3)+c*y(2);
          -b*y(3)+y(1)*y(2)];
T = 0:h:h*(k1+k2);
[T,z] = ode45(Chen,T,y);

% 去除暂态点
X = z(k1+1:end,:);
x = X(:,1);

% figure
% plot(x);

%% 重构相空间
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


%% 原始相空间
% figure
subplot(1,2,1);
plot3(X(1:end,1),X(1:end,2),X(1:end,3),'.');
xlabel('x(t)');
ylabel('y(t)');
zlabel('z(t)');
