function singleLinkControl_n(pitch,yaw,link) %新版函数绳长变化量a俯仰b偏航
    global qqdd1;
    %%新机械臂到了注释掉这里
%     qqdd1 = zeros(24,1,1);
    delta_L1 = [];
     %每个关节俯仰偏航对24根绳的影响
    for i = 1:1:24 %24电机
        angle = cableangle_calc_n(i); %angle用来计算线的坐标值（24个电机顺时针角度）
        delta_L1(i,1,1) = cablelength_calc_n(pitch,yaw,angle); %delta_L为一个关节上的绳长变化量，已水平为初始位置 (俯仰偏航为相对上一关节)
    end        
    dddd1 = delta_L1/4*168000; %丝杆变化4mm为电机转一圈
%     dddd1 = delta_L1;
    %%%%%%%%%%%%%%%%%%%%%%%%%%qqdd1 = zeros(24,1,1); %24*8*n转为24*连杆数*n矩阵
    
    %% 对于link关节需要执行的电机序号
    for i = 1:1:24
        %绳子与关节对应关系：i对应的关节序号为i%8，根部关节序号为1。
%         index = 8 -  mod(i - 1 + 24, 8);
        index = mod(i,8);
        if index == 0
            index = 8;
        end
        %第7个关节对应电机绳长变化受前6个关节影响
        if index >= link
            qqdd1(i,1,1) = qqdd1(i,1,1) + dddd1(i,1,1); 
        end
%         qqdd1(i,1,1) = round(qqdd1(i,1,1));  
    end
%     qqdd1
    %%
    %新机械臂到了注释掉这里
%     round(qqdd1)
%     motorControl(round(qqdd1));
%     pause(0.5);
end        



%% 版本7.16
%     t=  1:1:1;
%     delta_L1 = zeros(24,8,length(t));
%     for i = 1:1:24 %24电机
%         angle = cableangle_calc_n(i); %angle用来计算线的坐标值（24个电机顺时针角度）
%         %第link个关节对24根绳的长度影响
%         delta_L1(i,link,t) = cablelength_calc_n(pitch,yaw,angle); %delta_L为一个关节上的绳长变化量，已水平为初始位置 (俯仰偏航为相对上一关节)
%     end
%     dddd1 = delta_L1/4*168000; %丝杆变化4mm为电机转一圈
%     qqdd1 = round(dddd1);
%     qqdd2 = zeros(24,1,length(t));
%     
% %         for i = 0:1:2
% %             qqdd2(link + 8*i,m) = qqdd1(link + 8*i,m);
% %         end
% 
% % i对应的关节序号为i%8
%     for i = 1:1:24
%         for m = 1:1:length(t)
%             %i对应的关节序号为i%8
%             index = mod(i,8);
%             if index == 0
%                 index=8;
%             end
%             if index >= link
%                 qqdd2(i,1,m) = qqdd2(i,1,m)+qqdd1(i,1,m); 
%             end
%             qqdd2(i,1,m) = round(qqdd2(i,1,m));
%         end
%     end
% 
% 
%     % 将qqdd2送去执行
%     motorControl(qqdd2);



%% 版本7.0        
%      t=  1:1:1;
%      delta_L1 = zeros(24,8,length(t));
%      for i = 1:1:24 %24电机
%         for j = 1:1:8 %8个关节
%             angle = cableangle_calc_n(i); %angle用来计算线的坐标值
%             delta_L1(i,j,t+1) = cablelength_calc_n(0,q,angle); %delta_L为一个关节上的绳长变化量，已水平为初始位置 (俯仰偏航为相对上一关节)
%         end        
%      end
%     dddd1 = delta_L1/4*168000; %丝杆变化4mm为电机转一圈
%     qqdd1 = zeros(24,2); %3*8*n转为24*n矩阵
%     for i = 1:1:24
%         for m = 1:1:2
%             %i对应的关节序号为i%8
%             index = mod(i,8);
%             if index == 0
%                 index=8;
%             end
%             for k = 1:1:8-index+1
%                 qqdd1(i,m) = qqdd1(i,m)+dddd1(i,k,m); 
%             end
%             qqdd1(i,m) = round(qqdd1(i,m));
%         end
%     end
