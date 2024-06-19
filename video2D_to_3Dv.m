clc;
clear;
%Read video
videoReader = VideoReader('videoTest.MOV');
videoPlayer = vision.VideoPlayer('Position',[100,100,680,520]);
%Create a video file to store the processed video
writerObj = VideoWriter('test.mp4','MPEG-4')
open(writerObj)

objectFrame = readFrame(videoReader);
%Display the coordinates of the four selected points
P1 = [256.0000  478.0000
  494.0000  526.0000
  446.0000  762.0000
  220.0000  740.0000];
point_ago = P1;

%Display the specified four points on the picture
pointImage = insertMarker(objectFrame,P1,'+','Color','white');
figure;
imshow(pointImage);
title('Detected interest points');
%Use vision.PointTracker to automatically track specified points
tracker = vision.PointTracker('MaxBidirectionalError',1);
initialize(tracker,P1,objectFrame);

while hasFrame(videoReader)
      frame = readFrame(videoReader);
      gap = 2;
      %frame = frame(1:gap:end,1:gap:end,:);
      [points,validity] = tracker(frame);
      
      out = insertMarker(frame,points(validity, :),'+');
      po1 = points(validity, 1);
      po2 = points(validity, 2);

      load('K.mat');
      H = homography(point_ago,points(validity, :));
      p22 = zeros(4,2);
      z = 200;
      for i = 1:4
        [p22x,p22y]= projection_function(point_ago(i,1),point_ago(i,2),z,K,H);
        p22(i,1) = p22x;
        p22(i,2) = p22y;
        
      end
%Connects the originally selected point with the projected point
      point_ago = points(validity, :);
      drawpo = [po1(1) po2(1) po1(2) po2(2) po1(3) po2(3) po1(4) po2(4) po1(1) po2(1)];
      drawpo2 = [p22(1,1) p22(1,2) p22(2,1) p22(2,2) p22(3,1) p22(3,2) p22(4,1) p22(4,2) p22(1,1) p22(1,2)];
      drawline1 = [po1(1) po2(1) p22(1,1) p22(1,2)];
      drawline2 = [po1(2) po2(2) p22(2,1) p22(2,2)];
      drawline3 = [po1(3) po2(3) p22(3,1) p22(3,2)];
      drawline4 = [po1(4) po2(4) p22(4,1) p22(4,2)];
%Show the drawn lines in the video
      outliner1 = insertShape(frame,"line",{drawpo ,drawpo2,drawline1,drawline2,drawline3,drawline4}, 'Color',{'red','yellow','green','green','green','green'},'LineWidth', 5);
 
      videoPlayer(outliner1);
      frame1 = getframe;
      writeVideo(writerObj,outliner1)
   
end
close(writerObj);
release(videoPlayer);
      
 