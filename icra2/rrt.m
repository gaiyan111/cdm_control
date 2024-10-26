%% 绘制障碍物 
figure;
view(3);
map = zeros(120,85,40);
plotstl('yakeli.STL',55,26,5,0.01);
set(gca,'YDir','reverse');        %将x轴方向设置为反向(从上到下递增)。
xlabel('x');
ylabel('y');
zlabel('z');
hold on;
plotstl('yakeli.STL',55,68,5,0.01);
%% 参数
source=[20 7 20];
goal=[60 60 34];
init_parent=[20 6 20];
RRTree=double([init_parent -1]);
stepsize = 12.85;
threshold = 6;
maxFailedAttempts = 30000;
display = true;
searchSize = [100 80 40];      %探索空间六面体
if ~feasiblePoint3(source,map), error('source lies on an obstacle or outside map'); end
if ~feasiblePoint3(goal,map), error('goal lies on an obstacle or outside map'); end
%% %% 绘制起点和终点
hold on;
scatter3(source(1),source(2),source(3),"filled","b");
scatter3(goal(1),goal(2),goal(3),"filled","r");
tic;  % tic-toc: Functions for Elapsed Time
RRTree = [RRTree; source 1];
failedAttempts = 0;
pathFound = false;
%% 循环
while failedAttempts <= maxFailedAttempts  % loop to grow RRTs
    %% chooses a random configuration
    if rand < 0.5
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
     
        if ~checkPath3(closestNode, newPoint,init_parent,map) % if extension of closest node in tree to the new point is feasible
            failedAttempts = failedAttempts + 1;
            continue;
        end

        if distanceCost(newPoint,goal) < threshold, pathFound = true; break; end % goal reached
        [A, I2] = min( distanceCost(RRTree(:,1:3),newPoint) ,[],1); % check if new node is not already pre-existing in the tree
        if distanceCost(newPoint,RRTree(I2,1:3)) < threshold, failedAttempts = failedAttempts + 1; continue; end 

        RRTree = [RRTree; newPoint I(1)]; % add node
        failedAttempts = 0;
        if display, plot3([closestNode(1);newPoint(1)],[closestNode(2);newPoint(2)],[closestNode(3);newPoint(3)],'LineWidth',1,'Color',[84/255,84/255,84/255]); end
        pause(0.05);
%     else
end

if display && pathFound, plot3([closestNode(1);goal(1)],[closestNode(2);goal(2)],[closestNode(3);goal(3)]); end

if display, disp('click/press any key'); waitforbuttonpress; end
if ~pathFound, error('no path found. maximum attempts reached'); end

%% retrieve path from parent information回溯轨迹
path = goal;
prev = I(1);
while prev > 0
    path = [RRTree(prev,1:3); path];
    prev = RRTree(prev,4);
end
pathLength = 0;
for i=1:length(path(:,1))-1, pathLength = pathLength + distanceCost(path(i,1:3),path(i+1,1:3)); end % calculate path length
plot3(path(:,1),path(:,2),path(:,3),'LineWidth',2,'color','r');
fprintf('processing time=%d \nPath Length=%d \n\n', toc, pathLength); 