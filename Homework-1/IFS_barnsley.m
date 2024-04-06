clear all;
close all;
clc;

n=100000;
x=zeros(n,1);
y=zeros(n,1);
for k=2:n
    p=rand(1);
    if p < 0.05
        y(k)=0.5*y(k-1);
    elseif p < 0.45
        x(k)=0.42*x(k-1)-0.42*y(k-1);
        y(k)=0.42*x(k-1)+0.42*y(k-1)+0.2;
    elseif p < 0.85
        x(k)=0.42*x(k-1)+0.42*y(k-1);
        y(k)=-0.42*x(k-1)+0.42*y(k-1)+0.2;
    else
        x(k)=0.1*x(k-1);
        y(k)=0.1*y(k-1)+0.2;        
    end
end

plot(x,y,'.');