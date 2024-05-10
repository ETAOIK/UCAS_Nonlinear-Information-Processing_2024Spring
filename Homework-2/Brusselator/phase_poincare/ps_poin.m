clear all; close all; clc;
global A B omega alpha;
A = 0.4;
B = 1.2;
omega=0.8;
alpha=0.04713;
options=odeset('RelTol',1e-7);
%定义误差精度的，系统默认1e-3，如果改为1e-3，X将等于0 
tt=2*pi/1.2
%定义步长 h=T/100
[t,x]=ode45(@dafen,[0:tt/100:80*tt],[1,1],options,[],alpha);

% draw phase diagram
h1 = figure;
plot(x(2000:end,1),x(2000:end,2),'-')

% draw poincare section t=100h=T
%hold on
%i=2000:100:3000
%plot(x(i,1),x(i,2),'*')

% draw time series
% h2 = figure
% plot(t, x(:,1),'-');