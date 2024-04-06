clc
clear

N = -2:0.001:2;
[Re,Im] = meshgrid(N);
Z = Re+Im*1i;
C = 0.156i-0.8;
J = 0;

for n = 1:500
    
    J = J+(abs(Z)<=2);
    Z = Z.^2+C;
    imagesc(J);
    colormap('jet');
    axis equal
    axis off
    drawnow;
end