
clc;
clear;
%Importing images
image1=imread('MC1.JPG');
image2=imread('TPvisonMCtest2.JPG');

load('MCP1.mat')
load('MCP2.mat')

% Selection of points
% [xx,yy]=ginput(4);
% figure(2);
% imshow(image2);
% [xa,ya]=ginput(4);
% Coordinates of the point
% P1=[xx(1) yy(1);
%     xx(2) yy(2);
%     xx(3) yy(3);
%     xx(4) yy(4)];
% P2=[xa(1) ya(1);
%     xa(2) ya(2);
%     xa(3) ya(3);
%     xa(4) ya(4)];
%k = cameraParams.IntrinsicMatrix
%k = k'

H = homography(P1,P2)


