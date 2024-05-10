clear;clf; axis([0,2,0,1]);grid
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
