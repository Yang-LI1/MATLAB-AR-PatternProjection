function H = homography(p1,p2)
if length(p1)+length(p2) >=4
    %H = zeros(3,3,N)
    b = zeros(8,9);
    
    for i = 1:length(p1)
 
        b(2*(i-1)+1,1) = p1(i,1);  
        b(2*(i-1)+1,2) = p1(i,2);
        b(2*(i-1)+1,3) = 1;
        b(2*(i-1)+1,4:6) = 0;
        b(2*(i-1)+1,7) = -p2(i,1)*p1(i,1);
        b(2*(i-1)+1,8) = -p2(i,1)*p1(i,2);
        b(2*(i-1)+1,9) = -p2(i,1);
        
        b(2*i,1:3) = 0;
        b(2*i,4) = p1(i,1);
        b(2*i,5) = p1(i,2);
        b(2*i,6) = 1;
        b(2*i,7) = -p2(i,2)*p1(i,1);
        b(2*i,8) = -p2(i,2)*p1(i,2);
        b(2*i,9) = -p2(i,2);
           
    end
    
[U S V] = svd(b);
h = V(:,9);
H = reshape(h,3,3)';
H = H./H(3,3);
end
p = H;
end
