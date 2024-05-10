function df=dafen(t,x,flag,alpha)
global A B omega;
%df=[x(2);force*cos(1.2*t)-x(1)^3+x(1)-0.3*x(2)];
df=[A-(B+1)*x(1)+x(1)^2*x(2)+alpha*cos(omega*t);B*x(1)-[x(1)]^2*[x(2)]];