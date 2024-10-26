%% checkPath3.m	
function feasible=checkPath3(n,newPos,init_father,map,circleCenter,r)
feasible=true;
angle_between=acos(dot([n(1)-init_father(1),n(2)-init_father(2),n(3)-init_father(3)],[newPos(1)-n(1),newPos(2)-n(2),newPos(3)-n(3)]) ...
    /(norm([n(1)-init_father(1),n(2)-init_father(2),n(3)-init_father(3)])*norm([newPos(1)-n(1),newPos(2)-n(2),newPos(3)-n(3)])));
movingVec = [newPos(1)-n(1),newPos(2)-n(2),newPos(3)-n(3)];
movingVec = movingVec/sqrt(sum(movingVec.^2)); %单位化
for R=0:0.5:sqrt(sum((n-newPos).^2))
    posCheck=n + R .* movingVec;
    if ~(feasiblePoint3(ceil(posCheck),map,circleCenter,r) && feasiblePoint3(floor(posCheck),map,circleCenter,r))
        
%         && ...
%             feasiblePoint3([ceil(posCheck(1)) ceil(posCheck(2)) floor(posCheck(3))],map) && feasiblePoint3([ceil(posCheck(1)) floor(posCheck(2)) ceil(posCheck(3))],map) && ...
%             feasiblePoint3([ceil(posCheck(1)) floor(posCheck(2)) floor(posCheck(3))],map) && ...
%             feasiblePoint3([floor(posCheck(1)) ceil(posCheck(2)) ceil(posCheck(3))],map) && feasiblePoint3([floor(posCheck(1)) ceil(posCheck(2)) floor(posCheck(3))],map) && ...
%             feasiblePoint3([floor(posCheck(1)) floor(posCheck(2)) ceil(posCheck(3))],map) 
        feasible=false;break;
    end
end
if ~feasiblePoint3(newPos,map,circleCenter,r), feasible=false; end
if angle_between>((40*pi)/180)
    feasible=false;
end
end