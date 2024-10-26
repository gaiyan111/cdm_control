function [PATH,path] = RRTreal(map,start,goal,circleCenter,r)
init_parent=start-[0 1 0];
RRTree=double([init_parent -1]);
stepsize = 12.85;
threshold = 7;
maxFailedAttempts = 30000;
display = true;
searchSize = [100 80 40]; 
if ~feasiblePoint3(start,map,circleCenter,r), error('source lies on an obstacle or outside map'); end
if ~feasiblePoint3(goal,map,circleCenter,r), error('goal lies on an obstacle or outside map'); end
%%
hold on;
scatter3(start(1),start(2),start(3),"filled","r");
scatter3(goal(1),goal(2),goal(3),"filled","r");
tic;  % tic-toc: Functions for Elapsed Time
RRTree = [RRTree; start 1];
failedAttempts = 0;
pathFound = false;
rng('shuffle')
while failedAttempts <= maxFailedAttempts  % loop to grow RRTs
    %% chooses a random configuration
    if rand < 0.4
        sample = rand(1,3) .* searchSize;   % random sample
    else
        sample = goal; % sample taken as goal to bias tree generation to goal
    end
    %% selects the node in the RRT tree that is closest to qrand
    [A, I] = min( distanceCost(RRTree(:,1:3),sample) ,[],1); % find the minimum value of each column
    closestNode = RRTree(I,1:3);
    closestNode = round(closestNode);
    if ((RRTree(I,4)<0))
        failedAttempts=failedAttempts+1;
        continue;
    else
        init_parent=RRTree((RRTree(I,4)),1:3);
    end
    %% moving from qnearest an incremental distance in the direction of qrand
    movingVec = [sample(1)-closestNode(1),sample(2)-closestNode(2),sample(3)-closestNode(3)];
    movingVec = movingVec/sqrt(sum(movingVec.^2));  %单位化
    newPoint = double(int32(closestNode(1:3) + stepsize * movingVec));
    newPoint = round(newPoint);
%     newPoint = closestNode + stepsize * movingVec;
     
        if ~checkPath3(closestNode, newPoint,init_parent,map,circleCenter,r) % if extension of closest node in tree to the new point is feasible
            failedAttempts = failedAttempts + 1;
            continue;
        end

        if distanceCost(newPoint,goal) < threshold, pathFound = true; break; end % goal reached
        [A, I2] = min( distanceCost(RRTree(:,1:3),newPoint) ,[],1); % check if new node is not already pre-existing in the tree
        if distanceCost(newPoint,RRTree(I2,1:3)) < threshold, failedAttempts = failedAttempts + 1; continue; end 

        RRTree = [RRTree; newPoint I(1)]; % add node
        failedAttempts = 0;
        if display, plot3([closestNode(1);newPoint(1)],[closestNode(2);newPoint(2)],[closestNode(3);newPoint(3)],'-o','LineWidth',0.8,'Color',[84/255,84/255,84/255],'MarkerSize',3); end
        pause(0.05);
%     else
end

if display && pathFound, plot3([closestNode(1);goal(1)],[closestNode(2);goal(2)],[closestNode(3);goal(3)]); end

if display, disp('click/press any key'); waitforbuttonpress; end
if ~pathFound, error('no path found. maximum attempts reached'); end

%% retrieve path from parent information
path = goal;
prev = I(1);
while prev > 0
    path = [RRTree(prev,1:3); path];
    prev = RRTree(prev,4);
end
pathLength = 0;
path = round(path,1);
q = size(path,1);
path = path(2:q,:);  
for i=1:length(path(:,1))-1, pathLength = pathLength + distanceCost(path(i,1:3),path(i+1,1:3)); end % calculate path length
plot3(path(:,1),path(:,2),path(:,3),'--','LineWidth',2.5,'color','b');
fprintf('processing time=%d \nPath Length=%d \n\n', toc, pathLength); 
ax = path(:,1)';
ay = path(:,2)';
az = path(:,3)';
% plot3(ax,ay,az,'LineWidth',1,'color','r');
%% ASTAR
dis=zeros(size(path,1),size(path,1));
fea=zeros(size(path,1),size(path,1));
for j=1:size(dis,1)
    for k=1:size(dis,2)
          dis(j,k)=distanceCost(path(j,:),path(k,:));
          if ~checkPath(path(j,:),path(k,:),map,circleCenter,r),fea(j,k)=inf;end
    end   
end
%
start=1;
n=length(dis);
Dis=dis(start,:)+dis(n,:);
parent=path(1,:)-[0 1 0];
anglecheck0=zeros(1,size(path,1));
COS=[];
for i=1:n
    a0 = path(1,:)-parent;
    b0 = path(i,:)-path(1,:);
    if ~checkcos(a0,b0),anglecheck0(1,i)=inf;end
end
D0 = Dis+anglecheck0+fea(1,:);
visit=ones(1,n); visit(start)=0;
temp0=[];point=[start];
for j=1:n 
    if visit(j)
        temp0 = [temp0 D0(j)];
    else 
        temp0 = [temp0 inf];
    end
end
[value,index]=min(temp0);
for v=1:n
    if temp0(v)<=temp0(index)+dis(v,index)
        index=v;
    end
end
visit(1:index)=0;
x0=index;
point=[point x0];
position=1;
for p=1:n
    temp=[];
    anglecheck=zeros(1,size(path,1));
    for q=1:n
        pp=point(position);
        a=path(x0,:)-path(pp,:);
        b=path(q,:)-path(x0,:);
        if ~checkcos(a,b),anglecheck(1,q)=inf;end
%         position=position+1
    end
    D = Dis+anglecheck+fea(x0,:);
    for g=1:n 
    if visit(g)
        temp = [temp D(g)];
    else 
        temp = [temp inf];
    end
    end
    [value,index]=min(temp);
    for k=1:n
        if temp(k)<=temp(index)+dis(k,index)
            index=k;
        end
    end
    x0=index;
    visit(1:index)=0;
    point=[point x0];
    if x0 == n
        break;
    end
    position=position+1
end
shortestpath=point;
for p=1:length(shortestpath)
   PATH(p,:)=path(shortestpath(p),:);
   plot3(PATH(:,1),PATH(:,2),PATH(:,3),'LineWidth',2.5,'Color','r');
   F=getframe;
end
PATHlength=0;
for i=1:length(PATH(:,1))-1, PATHlength = PATHlength + distanceCost(PATH(i,1:3),PATH(i+1,1:3)); end % calculate path length
fprintf('PATH=%d \n\n', PATHlength); 
end
