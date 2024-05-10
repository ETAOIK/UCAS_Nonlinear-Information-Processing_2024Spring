function dy=weifen(t,x,date)
dy=zeros(2,1);
alpha=date(1);
w=date(2);
A=date(3);
B=date(4);
df=[A-(B+1).*x(1)+x(1).^2*x(2)+alpha.*cos(w.*t);B.*x(1)-x(1)^2.*[x(2)]];