clc;clf;close all;
y=[ ];
x=0.2; y=[y,x];
plot(0,x,'k.','markersize',10)
r=0.0;                %改变取值得到相应的图形
hold on
axis([0 100 0 1.2])
for k=1:100
    x=1-r*x*x;y=[y,x];
    plot(k,x,'k.','markersize',20)
    fprintf('x(%d)=%.10f\n',k,x)
end
t=0:100;
plot(t,y,'k-');
grid

