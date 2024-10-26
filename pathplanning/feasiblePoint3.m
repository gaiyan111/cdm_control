%% feasiblePoint3.m
% function feasible=feasiblePoint3(point,map)
% feasible=true;
% % check if collission-free spot and inside maps
% if ~(point(1)>=1 && point(1)<=size(map,1) && point(2)>=1 && point(2)<=size(map,2) && point(3)>=1 && point(3)<=size(map,3))&&map(point(1),point(2),point(3))==1
%     feasible=false;
% end
% end
function feasible=feasiblePoint3(point,map,circleCenter,r)
feasible=true;
% check if collission-free spot and inside map
for row = 1:length(circleCenter(:,1))
% if ~(point(1)>=1 && point(1)<=size(map,1) && point(2)>=1 && point(2)<=size(map,2) && point(3)>=1 && point(3)<=size(map,3))&& map(point(1),point(2),point(3))==1
 if (sqrt(sum((circleCenter(row,:)-point).^2)) <= r(row))|| point(1)<0 || point(1)>size(map,1) ||point(2)<0 || point(2)>size(map,2)||point(3)<0 || point(3)>size(map,3)
    feasible=false;
 end
end
end

