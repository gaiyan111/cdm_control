clear
clc 
fileName = 'yakeli.stl';
Originalobj=stlread(fileName);
% circleCenter_1 = Originalobj.Points;
% R=ones(5648,1);
% xbs = [min(Originalobj.Points(:,1)),max(Originalobj.Points(:,1))];
% ybs = [min(Originalobj.Points(:,2)),max(Originalobj.Points(:,2))];
% zbs = [min(Originalobj.Points(:,3)),max(Originalobj.Points(:,3))];
% circleCenter(:,1) = Originalobj.Points(:,1)+50*R;
% circleCenter(:,2) = Originalobj.Points(:,2)+50*R;
% circleCenter(:,3) = Originalobj.Points(:,3)-520*R;
% r=4*R;
circleCenter_1 = [0 0 0;0 0 4; 0 0 8;0 0 12;0 0 16;0 0 20;0 0 24; 0 0 28;0 0 32;0 0 36;0 0 40;0 0 44;
    4 0 0;4 0 4; 4 0 8;4 0 12;4 0 16;4 0 20;4 0 24; 4 0 28;4 0 32;4 0 36;4 0 40;4 0 44;
    8 0 0;8 0 4; 8 0 8;8 0 12;8 0 16;8 0 20;8 0 24; 8 0 28;8 0 32;8 0 36;8 0 40;8 0 44;
    32 0 0;32 0 4; 32 0 8;32 0 12;32 0 16;32 0 20;32 0 24; 32 0 28;32 0 32;32 0 36;32 0 40;32 0 44;
    36 0 0;36 0 4; 36 0 8;36 0 12;36 0 16;36 0 20;36 0 24; 36 0 28;36 0 32;36 0 36;36 0 40;36 0 44;
    40 0 0;40 0 4; 40 0 8;40 0 12;40 0 16;40 0 20;40 0 24; 40 0 28;40 0 32;40 0 36;40 0 40;40 0 44;
    60 0 0;60 0 4; 60 0 8;60 0 12;60 0 16;60 0 20;60 0 24; 60 0 28;60 0 32;60 0 36;60 0 40;60 0 44;
    64 0 0;64 0 4; 64 0 8;64 0 12;64 0 16;64 0 20;64 0 24; 64 0 28;64 0 32;64 0 36;64 0 40;64 0 44;
    68 0 0;68 0 4; 68 0 8;68 0 12;68 0 16;68 0 20;68 0 24; 68 0 28;68 0 32;68 0 36;68 0 40;68 0 44;
    92 0 0;92 0 4; 92 0 8;92 0 12;92 0 16;92 0 20;92 0 24; 92 0 28;92 0 32;92 0 36;92 0 40;92 0 44;
    96 0 0;96 0 4; 96 0 8;96 0 12;96 0 16;96 0 20;96 0 24; 96 0 28;96 0 32;96 0 36;96 0 40;96 0 44;
    100 0 0;100 0 4; 100 0 8;100 0 12;100 0 16;100 0 20;100 0 24; 100 0 28;100 0 32;100 0 36;100 0 40;100 0 44;
    12 0 0;12 0 4; 12 0 8;12 0 12;12 0 16;12 0 28;12 0 32;12 0 36;12 0 40;12 0 44;
    16 0 0;16 0 4; 16 0 8;16 0 12;16 0 32;16 0 36;16 0 40;16 0 44;
    20 0 0;20 0 4; 20 0 8;20 0 12;20 0 32;20 0 36;20 0 40;20 0 44;
    24 0 0;24 0 4; 24 0 8;24 0 12;24 0 32;24 0 36;24 0 40;24 0 44;
    28 0 0;28 0 4; 28 0 8;28 0 12;28 0 16;28 0 28;28 0 32;28 0 36;28 0 40;28 0 44;
    44 0 0;44 0 4; 44 0 8;44 0 12;44 0 32;44 0 36;44 0 40;44 0 44;
    48 0 0;48 0 4; 48 0 8;48 0 12;48 0 32;48 0 36;48 0 40;48 0 44;
    50 0 0;50 0 4; 50 0 8;50 0 12;50 0 32;50 0 36;50 0 40;50 0 44;
    52 0 0;52 0 4; 52 0 8;52 0 12;52 0 32;52 0 36;52 0 40;52 0 44;
    56 0 0;56 0 4; 56 0 8;56 0 12;56 0 32;56 0 36;56 0 40;56 0 44;
    72 0 0;72 0 4; 72 0 8;72 0 12;72 0 16;72 0 28;72 0 32;72 0 36;72 0 40;72 0 44;
    76 0 0;76 0 4; 76 0 8;76 0 12;76 0 32;76 0 36;76 0 40;76 0 44;
    80 0 0;80 0 4; 80 0 8;80 0 12;80 0 32;80 0 36;80 0 40;80 0 44;
    84 0 0;84 0 4; 84 0 8;84 0 12;84 0 32;84 0 36;84 0 40;84 0 44;
    88 0 0;88 0 4; 88 0 8;88 0 12;88 0 16;88 0 28;88 0 32;88 0 36;88 0 40;88 0 44];
circleCenter_2(:,1)=circleCenter_1(:,1);
w = length(circleCenter_1);
circleCenter_2(:,2)=circleCenter_1(:,2)+42*ones(w,1);
circleCenter_2(:,3)=circleCenter_1(:,3);
circleCenter=[circleCenter_1;circleCenter_2];
R=ones(2*w,1);r=4*R;
figure;

view(3);
map = zeros(120,80,40);
plotstl('yakeli.STL',50,20,0,0.1);
set(gca,'YDir','reverse');      
xlabel('x');
ylabel('y');
zlabel('z');
hold on;
plotstl('yakeli.STL',50,62,0,0.1); 
GG = [20 2 22;48 27 20;70 35 15;45 65 22];
start = GG(1,:);
goal = GG(2,:);
[ap1,p1] = RRTreal(map,start,goal,circleCenter,r);
lp1 = size(p1,1); lap1 = size(ap1,1);
start2 = GG(2,:);
goal2 = GG(3,:);
parent = ap1(lap1-1,:);
[ap2,p2] = RRTnotreal(map,start2,parent,goal2,circleCenter,r);

goal3 = GG(4,:);
[ap3,p3] = RRTreal(map,start,goal3,circleCenter,r);
hold on 

plot3(start(1),start(2),start(3),'o',...
    'MarkerSize',13,...        
    'MarkerFaceColor',[255 174 0]/255,... 
    'MarkerEdgeColor','k')    
hold on
    plot3(goal(1),goal(2),goal(3),'p',...
    'MarkerSize',17,...        
    'MarkerFaceColor',[255 174 0]/255,...  
    'MarkerEdgeColor','k')     
hold on
        plot3(goal2(1),goal2(2),goal2(3),'p',...
    'MarkerSize',17,...        
    'MarkerFaceColor',[255 174 0]/255,...  
    'MarkerEdgeColor','k')    
hold on
            plot3(goal3(1),goal3(2),goal3(3),'p',...
    'MarkerSize',17,...        
    'MarkerFaceColor',[255 174 0]/255,...  
    'MarkerEdgeColor','k')   
figure; 
view(3);
map = zeros(120,85,40);
plotstl('yakeli.STL',50,20,0,0.1);hold on;
plotstl('yakeli.STL',50,62,0,0.1); hold on;

for i = 1:1:size(GG)
    scatter3(GG(i,1),GG(i,2),GG(i,3),'filled','b')
    hold on
end

set(gca,'YDir','reverse');   
xlabel('x');
ylabel('y');
zlabel('z');
