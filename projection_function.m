function [p22x,p22y] = projection_function(P11x, P11y,z,K,H)


R1 = K\H(:,1);
R2 = K\H(:,2);
T = K\H(:,3);
R3 = cross(R1,R2);

R = [R1 R2 R3];
a = power(det(R),1/4);
%a = nthroot(det(R),4);
r1a = R1/a;
r2a = R2/a;
ta = T/a;
r3a = R3/(a^2);
RT = [r1a r2a r3a ta];
KRT = K*RT;

% H_Initial.img1=imread('MC1.JPG');
% H_Initial.img2=imread('TPvisonMCtest2.JPG');

%P1=H_Initial.Point(:,1:2);P2=H_Initial.Point(:,3:4);
%H = CalcH(P1, P2);
P1 = [P11x,P11y];
%z = 1000
% figure(1);imshow(H_Initial.img1);hold on;plot(P1(:,1),P1(:,2),'r.');
%[P11x, P11y] = ginput(1);

P11 = [P11x; P11y; z;1];
%hold on;plot(P11(1),P11(2),'gp','MarkerSize', 12);

%P22 = H * P11
%a = 0.25
%P_i = KRT
%P22 = a*P_i + (1-a)*P_i*P11;
P22 = a*KRT*P11;
P22 = P22./[P22(3, :); P22(3,:); P22(3, :)];
P22 = P22';
p22x = P22(1);
p22y = P22(2);
% figure(2)
% imshow(H_Initial.img2);hold on;
% plot(p22x, p22y, 'gp', 'MarkerSize', 12);

end

