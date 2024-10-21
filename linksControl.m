function linksControl(joint_angles_n) 

    global qqdd1;
    global key;

    for t = 1:1:size(joint_angles_n,1)
        
        qqdd1 = zeros(24,1,1);
        if key
            for j = 1:1:size(joint_angles_n,2)/2 %根据传入角度矩阵判断关节数
                singleLinkControl_n(joint_angles_n(t,2*(j-1)+1),joint_angles_n(t,2*(j-1)+2),j);
            end
%               disp(qqdd1);
              motorControl(round(qqdd1));

             pause(0.01);

        else
            break;
        end
       
    end

     %% 回到原位：在紧急制动下不执行
%     if key
%         joint_angles_n = flipud(joint_angles_n);
%         for t = 1:1:size(joint_angles_n,1)
%             qqdd1 = zeros(24,1,1);
%             if key
%                 for j = 1:1:size(joint_angles_n,2)/2 %根据传入角度矩阵判断关节数
%                     %disp('正常运行');
%                     singleLinkControl_n(joint_angles_n(t,2*(j-1)+1),joint_angles_n(t,2*(j-1)+2),j);
%                     %pidControl_n(joint_angles_n(t,2*(j-1)+1),joint_angles_n(t,2*(j-1)+2),j);
%                 end
%                 motorControl(round(qqdd1));
%                 pause(0.25);
% %                 qqdd1
%             else
%                 %disp('制动');
%                 break;
%             end
%         end
% %         for t = 1:1:length(joint_angles_n)
% %             pause(0.5);
% %             for j = 1:1:size(joint_angles_n,2)/2 %根据传入角度矩阵判断关节数       
% %                 singleLinkControl_n(joint_angles_n(t,2*(j-1)+1),joint_angles_n(t,2*(j-1)+2),j);
% %                 %pidControl_n(joint_angles_n(t,2*(j-1)+1),joint_angles_n(t,2*(j-1)+2),j);
% %             end
% %         end
%     end
    
%%
%      delta_L1 = [];
%      %每个关节俯仰偏航对24根绳的影响
%      for t=  1:1:length(qt)    
%         for j = 1:1:size(qt,2)/2 %根据传入角度矩阵判断关节数       
%             for i = 1:1:24 %24电机
%                 angle = cableangle_calc_n(i); %angle用来计算线的坐标值（24个电机顺时针角度）
%                 %第j个关节对24根绳的长度影响
%                 delta_L1(i,j,t) = cablelength_calc_n(joint_angles_n(t,2*(j-1)+1),joint_angles_n(t,2*(j-1)+2),angle); %delta_L为一个关节上的绳长变化量，已水平为初始位置 (俯仰偏航为相对上一关节)
%             end        
%         end
%      end
% 
%     dddd1 = delta_L1/4*168000; %丝杆变化4mm为电机转一圈
%     qqdd1 = zeros(24,1,length(qt)); %24*8*n转为24*连杆数*n矩阵
%     %% 三关节
%     for link = 1:1:size(qt,2)/2
%         for l = 1:1:3
%             i = 8 - link + 8*(l - 1);
%             for m = 1:1:length(qt)
%                 %绳子与关节对应关系：i对应的关节序号为i%8，根部关节序号为1。
%                 index = 8 - mod(i,8);
%                 %第7个关节对应电机绳长变化受前6个关节影响
%                 for k = 1:1:index
%                     qqdd1(i,1,m) = qqdd1(i,1,m)+dddd1(i,k,m); 
%                 end
%                 qqdd1(i,1,m) = round(qqdd1(i,m));
%             end
%         end
%     end
%     %%
%     motorControl(qqdd1);
%     pause(15);
%     for i = 1:1:24
%         for m = 1:1:length(qt)
%             qqdd2(i,1,m) = qqdd1(i,1,length(qt) - m + 1);
%         end
%     end
%     motorControl(qqdd2);
end    