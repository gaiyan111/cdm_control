function Cosine = getCosineSimilarity(x,y)
    Cosine = [];
    xy   = dot(x,y);
    nx   = norm(x);
    ny   = norm(y);
    nxny = nx*ny;
    Cs   = xy/nxny;
    Cosine = [Cosine Cs];
%     angle = acos(Cos); Angle = angle*180/pi;%夹角
%     Angle_between=[Angle_between Angle];
% fprintf('第 %d 段 angle=%d \n', i, angle_between); 
end


