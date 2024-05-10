function aa
clear all; close all; clc;
global A B omega alpha;
A = 0.4;
B = 1.2;
omega=0.89;
alpha=0.07;

x0=[1;1];
tspan = 0:0.1*2*pi/omega:100000;
% h=0.1T
[t,y]=ode45(@Brusselator,tspan,x0);
m=zeros(10000,1);
n=zeros(10000,1);
for i=1:10000
    m(i,1)=y(10*i,1);
    n(i,1)=y(10*i,2);
end
% t=10h=T, 10*i+1/2/3
plot(m,n,'k.','markersize',1);

function dx=Brusselator(t,x)
global A B omega alpha;
dx=[A-(B+1)*x(1)+x(1)^2*x(2)+alpha*cos(omega*t);B*x(1)-[x(1)]^2*[x(2)]];