clc
clear
close all
alpha=0:0.001:0.1;
w=5;
A=0.4;
B=1.2;
T=2.*pi/w;
figure
hold on
subplot(1,2,1)
for j=1:length(alpha)
disp(j);
date=[alpha(j),w,A,B];
%data is a group of 5 parameters
[t1,y1]=ode45(@(t1,y1)weifen(t1,y1,date),[0:T/100.:200.*T],[0.1,0]);
i=15001:100:20000;
plot(alpha(j),y1(i,1),'b.','markersize',1)
end
xlabel('alpha');
ylabel('x');
set(gca,'FontSize',15)

subplot(1,2,2)
for j=1:length(alpha)
date=[alpha(j),w,A,B];
%data is a group of 5 parameters
[t1,y1]=ode45(@(t1,y1)weifen(t1,y1,date),[0:T/100.:200.*T],[0.1,0]);
i=15001:100:20000;
plot(alpha(j),y1(i,2),'b.','markersize',1)
end
xlabel('alpha');
ylabel('y');
set(gca,'FontSize',15)
