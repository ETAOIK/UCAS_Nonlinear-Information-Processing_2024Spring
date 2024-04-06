clc
clear

N = -2:0.001:2;
[Re,Im] = meshgrid(N);
Z = Re+Im*1i;
C = -1.3-1.25i;
J = 0;

for n = 1:50
    t = abs(Z)<=2;
    J = J+t;
    Z = Z.^2+C;
end

imagesc(J);
colormap('jet');
axis equal
axis off