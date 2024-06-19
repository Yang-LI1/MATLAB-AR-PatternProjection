load('K.mat')
load H;
R1 = K\H(:,1);
R2 = K\H(:,2);
T = K\H(:,3);
R3 = cross(R1,R2);

R = [R1 R2 R3];
a = power(det(R),1/4);

r1a = R1/a;
r2a = R2/a;
ta = T/a;
r3a = R3/(a^2);
RT = [r1a r2a r3a ta];
KRT = K*RT;

H_Initial.img1=imread('MC1.JPG');
H_Initial.img2=imread('TPvisonMCtest2.JPG');

%Changing the value of z allows for 2D to 3D conversions
z = 0;
figure(1);imshow(H_Initial.img1);hold on;plot(P1(:,1),P1(:,2),'r.');
[P11x, P11y] = ginput(1);

P11 = [P11x; P11y; z;1];hold on;plot(P11(1),P11(2),'gp','MarkerSize', 12);


P22 = a*KRT*P11;
P22 = P22./[P22(3, :); P22(3,:); P22(3, :)];
P22 = P22';
figure(2)
imshow(H_Initial.img2);hold on;plot(P2(:,1),P2(:,2),'r.');
hold on;
plot(P22(1), P22(2), 'gp', 'MarkerSize', 12);

