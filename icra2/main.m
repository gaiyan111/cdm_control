%% 清空变量 
clear
clc 
%% 绘制障碍物
figure;
view(3);
map = zeros(120,85,40);
plotstl('yakeli.STL',55,26,5,0.1);
set(gca,'YDir','reverse');        %将x轴方向设置为反向(从上到下递增)。
xlabel('x');
ylabel('y');
zlabel('z');
hold on;
plotstl('yakeli.STL',55,68,5,0.1); %两个并排放
%% 1绘制起点和终点
hold on;
GG = [20 7 20;60 60 34;80 70 40];%目标点坐标，有多个目标点就将每个目标点坐标放在这里,第一个是起点
%画出所有点
for i = 1:1:size(GG)
    scatter3(GG(i,1),GG(i,2),GG(i,3),'filled','b')
    hold on
end
% rrt算法部分
PATH = [];L=[];DL=[];DPATH1=[];
start0 = GG(1,:);
goal0 = GG(2,:);
[DP01,path01] = RRTreal(map,start0,goal0,circleCenter,r);
u=length(path01);
parent=path01(u-1,:)
start1 = GG(2,:);
goal1 = GG(3,:);
[DP02,path02] = RRTnotreal(map,start1,parent,goal1);
waitforbuttonpress; 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%画一条路径的图
% figure;
% [x,y,z]=sphere;
% for i = 1:length(circleCenter(:,1))
%     mesh(r(i)*x+circleCenter(i,1),r(i)*y+circleCenter(i,2),r(i)*z+circleCenter(i,3));hold on;
% end
% axis equal
% %优化路径
% scatter3(start0(1),start0(2),start0(3),"filled","b");hold on;
% scatter3(start1(1),start1(2),start1(3),"filled","b");hold on;
% scatter3(goal1(1),goal1(2),goal1(3),"filled","b");hold on;
% plot3(DP01(:,1),DP01(:,2),DP01(:,3),'LineWidth',2,'color','r');hold on;
% plot3(DP02(:,1),DP02(:,2),DP02(:,3),'LineWidth',2,'color','r');
% set(gca,'ydir','reverse');
% DPATH1=[DP01;DP02];
% 
% %% 
% figure;
% [x,y,z]=sphere;
% for i = 1:length(circleCenter(:,1))
%     mesh(r(i)*x+circleCenter(i,1),r(i)*y+circleCenter(i,2),r(i)*z+circleCenter(i,3));hold on;
% end
% axis equal   % 图像坐标轴可视化间隔相等  
% 
% % axis([0 2000 0 2000 0 2000 ])   %设置图像的可视化范围
% 
% %% 2绘制起点和终点
% hold on;
% xlabel('x');   
% ylabel('y');
% zlabel('z');
% set(gca,'ydir','reverse');
% Path=[];DPATH2=[];L2=[];DL2=[];
% for k4 = 1:size(GG,1)-1
%         start = GG(1,:);
%         goal = GG(k4+1,:);
%         [DP2,path1] = RRTreal(circleCenter,r,start,goal);%每次找到最好路径存放在这个变量里
%         l2=size(path1,1);L2=[L2;l2];
%         Dl2=size(DP2,1);DL2=[DL2;Dl2];
%         Path = [Path;path1];DPATH2 = [DPATH2;DP2];
% end
% %% 数据处理
% figure; 
% [x,y,z]=sphere;
% for i = 1:length(circleCenter(:,1))
%     mesh(r(i)*x+circleCenter(i,1),r(i)*y+circleCenter(i,2),r(i)*z+circleCenter(i,3));hold on;
% end
% axis equal
% set(gca,'ydir','reverse');
% m2=DL2(1); %路径1的点数
% n2=DL2(2); %路径2的点数
% mn2=DL2(1)+DL2(2);
% scatter3(start0(1),start0(2),start0(3),"filled","b");hold on;
% scatter3(start1(1),start1(2),start1(3),"filled","b");hold on;
% scatter3(goal1(1),goal1(2),goal1(3),"filled","b");hold on;
% plot3(DPATH2(1:m2,1),DPATH2(1:m2,2),DPATH2(1:m2,3),'LineWidth',2,'color','r');hold on;
% plot3(DPATH2(m2+1:mn2,1),DPATH2(m2+1:mn2,2),DPATH2(m2+1:mn2,3),'LineWidth',2,'color','b');
% 
% % a=size(path1,1); %路径2点的个数
% % b=size(Path,1)-a; %路径1点的个数
% % plot3(path1(:,1),path1(:,2),path1(:,3),'LineWidth',2,'color','b');%plot路径2
% % plot3(Path(1:b,1),Path(1:b,2),Path(1:b,3),'LineWidth',2,'color','r');%plot路径1
%  
% %% 路径离散
% p1 = DPATH2(1:m2,:); %路径1
% p2 = DPATH2(m2+1:mn2,:); %路径2
% s = GG(1,:); %起点
% c = p1(m2,1)-p1(1,1);
% d = p2(n2,1)-p2(1,1);
% %区间上限     
% if c > d
%     lth = d;
% else
%     lth = c;
% end
% RouteA = interpolation(p1,0.1);
% RouteB = interpolation(p2,0.1);
% % figure;
% % plot3(RouteA(:,1),RouteA(:,2),RouteA(:,3),'o');
% % n = 20;
% % l=lth/n;
% Angle_between=[];
% COS=[];
% %% 余弦相似度计算
% for i = 1:size(RouteA,1)
%     n1 = RouteA(i,:);
%     n2 = RouteB(i,:);
%     c1=[n1(1)-s(1) n1(2)-s(2) n1(3)-s(3)];
%     c2=[n2(1)-s(1) n2(2)-s(2) n2(3)-s(3)];
%     %     Cos=dot([n1(1)-s(1),n1(2)-s(2),n1(3)-s(3)],[n2(1)-s(1),n2(2)-s(2),n2(3)-s(3)]) ...
% %     /(norm([n1(1)-s(1),n1(2)-s(2),n1(3)-s(3)])/norm([n2(1)-s(1),n2(2)-s(2),n2(3)-s(3)]));
%     Cosine = getCosineSimilarity(c1,c2);
%     COS=[COS Cosine];
%     angle = acos(Cosine); Angle = angle*180/pi;%夹角
%     if Angle > 45
%         fprintf('第 %d 个点 超出限制 \n', i); 
%         break;
%     end
%     Angle_between=[Angle_between Angle];
%     if ~checkPath(n1,n2,circleCenter,r)
%         fprintf('第 %d 个点有碰 \n', i); 
%         break;
%     end
% % fprintf('第 %d 段 angle=%d \n', i, angle_between); 
% end