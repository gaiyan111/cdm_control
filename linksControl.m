function linksControl(joint_angles_n) 

    global qqdd1;
    global key;

    for t = 1:1:size(joint_angles_n,1)
        
        qqdd1 = zeros(24,1,1);
        if key
            for j = 1:1:size(joint_angles_n,2)/2 %���ݴ���ǶȾ����жϹؽ���
                singleLinkControl_n(joint_angles_n(t,2*(j-1)+1),joint_angles_n(t,2*(j-1)+2),j);
            end
%               disp(qqdd1);
              motorControl(round(qqdd1));

             pause(0.01);

        else
            break;
        end
       
    end

     %% �ص�ԭλ���ڽ����ƶ��²�ִ��
%     if key
%         joint_angles_n = flipud(joint_angles_n);
%         for t = 1:1:size(joint_angles_n,1)
%             qqdd1 = zeros(24,1,1);
%             if key
%                 for j = 1:1:size(joint_angles_n,2)/2 %���ݴ���ǶȾ����жϹؽ���
%                     %disp('��������');
%                     singleLinkControl_n(joint_angles_n(t,2*(j-1)+1),joint_angles_n(t,2*(j-1)+2),j);
%                     %pidControl_n(joint_angles_n(t,2*(j-1)+1),joint_angles_n(t,2*(j-1)+2),j);
%                 end
%                 motorControl(round(qqdd1));
%                 pause(0.25);
% %                 qqdd1
%             else
%                 %disp('�ƶ�');
%                 break;
%             end
%         end
% %         for t = 1:1:length(joint_angles_n)
% %             pause(0.5);
% %             for j = 1:1:size(joint_angles_n,2)/2 %���ݴ���ǶȾ����жϹؽ���       
% %                 singleLinkControl_n(joint_angles_n(t,2*(j-1)+1),joint_angles_n(t,2*(j-1)+2),j);
% %                 %pidControl_n(joint_angles_n(t,2*(j-1)+1),joint_angles_n(t,2*(j-1)+2),j);
% %             end
% %         end
%     end
    
%%
%      delta_L1 = [];
%      %ÿ���ؽڸ���ƫ����24������Ӱ��
%      for t=  1:1:length(qt)    
%         for j = 1:1:size(qt,2)/2 %���ݴ���ǶȾ����жϹؽ���       
%             for i = 1:1:24 %24���
%                 angle = cableangle_calc_n(i); %angle���������ߵ�����ֵ��24�����˳ʱ��Ƕȣ�
%                 %��j���ؽڶ�24�����ĳ���Ӱ��
%                 delta_L1(i,j,t) = cablelength_calc_n(joint_angles_n(t,2*(j-1)+1),joint_angles_n(t,2*(j-1)+2),angle); %delta_LΪһ���ؽ��ϵ������仯������ˮƽΪ��ʼλ�� (����ƫ��Ϊ�����һ�ؽ�)
%             end        
%         end
%      end
% 
%     dddd1 = delta_L1/4*168000; %˿�˱仯4mmΪ���תһȦ
%     qqdd1 = zeros(24,1,length(qt)); %24*8*nתΪ24*������*n����
%     %% ���ؽ�
%     for link = 1:1:size(qt,2)/2
%         for l = 1:1:3
%             i = 8 - link + 8*(l - 1);
%             for m = 1:1:length(qt)
%                 %������ؽڶ�Ӧ��ϵ��i��Ӧ�Ĺؽ����Ϊi%8�������ؽ����Ϊ1��
%                 index = 8 - mod(i,8);
%                 %��7���ؽڶ�Ӧ��������仯��ǰ6���ؽ�Ӱ��
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