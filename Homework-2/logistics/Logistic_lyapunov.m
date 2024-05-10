figure
subplot(2,1,1);
% clear;clf; axis([0,2,0,1]);grid
hold on
for r=0:0.005:2
    x=[0.2];
    for i=2:150
        x(i)=1-r*x(i-1)*x(i-1);
    end
%     pause(0.1)
    fprintf('r=%.3f\n',r)
    for i=101:150
        plot(r,x(i),'k.');
    end
end
xlabel('\lambda')
ylabel('x');
title('Logistic���ģ��-������Ŧ˵ı仯')

subplot(2,1,2);
% clear;clc;close all;
n=10000;
a=0.0:0.001:100;   %����ȡ��0.001
len=length(a);
a=reshape(a,len,1);
sum=zeros(len,1);
unit=ones(len,1);
x=unit*0.1;
 
for i=1:n
    y=a.*(unit-2*x);
    sum=sum+log(abs(y));
    x=1-a.*x.*x;
end
lamuda=sum/1000;%���������޸Ĺ�
plot(a,lamuda)
grid on
 
xlabel('\fontsize{16}a')
ylabel('\fontsize{16}Lyapunov\fontname{����}ָ��')
 
title('\fontsize{16}\lambda\fontname{����}��Lyapunov\fontname{����}ָ���Ĺ�ϵ����')
