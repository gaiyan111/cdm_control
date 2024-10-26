%% checkPath.m	
function feasible=checkPath(n,newPos,map,circleCenter,r)
feasible=true;
movingVec = [newPos(1)-n(1),newPos(2)-n(2),newPos(3)-n(3)];
movingVec = movingVec/sqrt(sum(movingVec.^2)); 
for R=0:0.5:sqrt(sum((n-newPos).^2))
    posCheck=n + R .* movingVec;
    if ~(feasiblePoint3(ceil(posCheck),map,circleCenter,r) && feasiblePoint3(floor(posCheck),map,circleCenter,r))
        feasible=false;break;
    end
end
if ~feasiblePoint3(newPos,map,circleCenter,r), feasible=false; end
end
