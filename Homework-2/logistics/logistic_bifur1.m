%% -------------------���ģ��-�ֲ�ͼ-----------
% ���ģ�� x(n+1) = lambda * x(n) * (1 - x(n)) 
% �� lambda �� 3 �� 4 �Ĺ���ͼ��
% �μ�<<���綯��ѧ����>>��ʿ����½�������� P46

clc;
clear;
close all;

lambda = 0:5e-4:2;%ԭ����3:4
x = 0.4*ones(1,length(lambda));
N1 = 800;                   % ǰ��ĵ�������(ԭ����400)
N2 = 200;                   % ����ĵ���������ԭ����100��
f = zeros(N1+N2,length(lambda));
for i = 1:N1+N2
    %x = lambda .* x .* (1 - x);
    x = 1 - lambda .* x .* x;
    f(i,:) = x;
end
f = f(N1+1:end,:);
plot(lambda,f,'k.','MarkerSize',1)
xlabel('\lambda')
ylabel('x');
title('Logistic���ģ��-������Ŧ˵ı仯')