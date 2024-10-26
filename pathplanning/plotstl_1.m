%正常stl
function [xbounds,ybounds,zbounds] = plotstl_1(filename,x,y,z,scale,surfcolor,alpha)
if ~exist('scale', 'var') ||  isempty(scale)
    scale = 1;
end

if ~exist('surfcolor', 'var') ||  isempty(surfcolor)
    surfcolor = 'black';
end

if ~exist('alpha', 'var') ||  isempty(alpha)
    alpha = 0.15;
end
    
stlFile = filename;
Originalobj=stlread(stlFile);

% Transfer points to a read-write obj and move file to origin
    CustomObj(:,3)=Originalobj.Points(:,1)-min(Originalobj.Points(:,1));
    CustomObj(:,2)=Originalobj.Points(:,2)-min(Originalobj.Points(:,2));
    CustomObj(:,1)=Originalobj.Points(:,3)-min(Originalobj.Points(:,3));
% Move object coordinate frame to the center of the object (except Z)
    CustomObj(:,1)=CustomObj(:,1)-(max(CustomObj(:,1))/2);
    CustomObj(:,2)=CustomObj(:,2)-(max(CustomObj(:,2))/2);
    %CustomObj(:,3)=CustomObj(:,3)-(max(CustomObj(:,3))/2);
% Scale object about center
    CustomObj(:,1)=CustomObj(:,1)*scale;
    CustomObj(:,2)=CustomObj(:,2)*scale;
    CustomObj(:,3)=CustomObj(:,3)*scale;
% Move object to desired location
    CustomObj(:,1)=CustomObj(:,1)+x;
    CustomObj(:,2)=CustomObj(:,2)+y;
    CustomObj(:,3)=CustomObj(:,3)+z;  
% Grab bounds
    xbounds = [min(CustomObj(:,1)),max(CustomObj(:,1))];
    ybounds = [min(CustomObj(:,2)),max(CustomObj(:,2))];
    zbounds = [min(CustomObj(:,3)),max(CustomObj(:,3))];
% Plot everything
    temp=Originalobj.ConnectivityList(:,:);
    TR = triangulation(temp,CustomObj);
     trisurf(TR,'Facecolor',surfcolor,'FaceAlpha',alpha,'EdgeColor','none')
    axis equal
end