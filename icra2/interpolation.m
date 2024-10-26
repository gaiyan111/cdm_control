function X= interpolation(path,l)
x=path(:,1);
y=path(:,2);
z=path(:,3);
point1=[];point2=[];point3=[];
% figure;
for i = 1:1:length(x)-1
    if x(i)< x(i+1)
        F = 1;
    else
        F = -1;
    end
    xq = x(i):F*l:x(i+1);
    vy = interp1(x(i:i+1),y(i:i+1),xq,'linear');
    vz = interp1(x(i:i+1),z(i:i+1),xq,'linear');
%     plot3(xq,vy,vz,'o-');hold on
    point1=[point1 xq];
    point2=[point2 vy];
    point3=[point3 vz];
end
if xq~=x(length(path),1)
    point1=[point1 x(length(path),1)];
    point2=[point2 y(length(path),1)];
    point3=[point3 z(length(path),1)];
else
end
Y=[point1;point2;point3];
X=Y';
% plot3(x,y,z,'r');