function singleLinkControl_n(pitch,yaw,link) %�°溯�������仯��a����bƫ��
    global qqdd1;
    %%�»�е�۵���ע�͵�����
%     qqdd1 = zeros(24,1,1);
    delta_L1 = [];
     %ÿ���ؽڸ���ƫ����24������Ӱ��
    for i = 1:1:24 %24���
        angle = cableangle_calc_n(i); %angle���������ߵ�����ֵ��24�����˳ʱ��Ƕȣ�
        delta_L1(i,1,1) = cablelength_calc_n(pitch,yaw,angle); %delta_LΪһ���ؽ��ϵ������仯������ˮƽΪ��ʼλ�� (����ƫ��Ϊ�����һ�ؽ�)
    end        
    dddd1 = delta_L1/4*168000; %˿�˱仯4mmΪ���תһȦ
%     dddd1 = delta_L1;
    %%%%%%%%%%%%%%%%%%%%%%%%%%qqdd1 = zeros(24,1,1); %24*8*nתΪ24*������*n����
    
    %% ����link�ؽ���Ҫִ�еĵ�����
    for i = 1:1:24
        %������ؽڶ�Ӧ��ϵ��i��Ӧ�Ĺؽ����Ϊi%8�������ؽ����Ϊ1��
%         index = 8 -  mod(i - 1 + 24, 8);
        index = mod(i,8);
        if index == 0
            index = 8;
        end
        %��7���ؽڶ�Ӧ��������仯��ǰ6���ؽ�Ӱ��
        if index >= link
            qqdd1(i,1,1) = qqdd1(i,1,1) + dddd1(i,1,1); 
        end
%         qqdd1(i,1,1) = round(qqdd1(i,1,1));  
    end
%     qqdd1
    %%
    %�»�е�۵���ע�͵�����
%     round(qqdd1)
%     motorControl(round(qqdd1));
%     pause(0.5);
end        



%% �汾7.16
%     t=  1:1:1;
%     delta_L1 = zeros(24,8,length(t));
%     for i = 1:1:24 %24���
%         angle = cableangle_calc_n(i); %angle���������ߵ�����ֵ��24�����˳ʱ��Ƕȣ�
%         %��link���ؽڶ�24�����ĳ���Ӱ��
%         delta_L1(i,link,t) = cablelength_calc_n(pitch,yaw,angle); %delta_LΪһ���ؽ��ϵ������仯������ˮƽΪ��ʼλ�� (����ƫ��Ϊ�����һ�ؽ�)
%     end
%     dddd1 = delta_L1/4*168000; %˿�˱仯4mmΪ���תһȦ
%     qqdd1 = round(dddd1);
%     qqdd2 = zeros(24,1,length(t));
%     
% %         for i = 0:1:2
% %             qqdd2(link + 8*i,m) = qqdd1(link + 8*i,m);
% %         end
% 
% % i��Ӧ�Ĺؽ����Ϊi%8
%     for i = 1:1:24
%         for m = 1:1:length(t)
%             %i��Ӧ�Ĺؽ����Ϊi%8
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
%     % ��qqdd2��ȥִ��
%     motorControl(qqdd2);



%% �汾7.0        
%      t=  1:1:1;
%      delta_L1 = zeros(24,8,length(t));
%      for i = 1:1:24 %24���
%         for j = 1:1:8 %8���ؽ�
%             angle = cableangle_calc_n(i); %angle���������ߵ�����ֵ
%             delta_L1(i,j,t+1) = cablelength_calc_n(0,q,angle); %delta_LΪһ���ؽ��ϵ������仯������ˮƽΪ��ʼλ�� (����ƫ��Ϊ�����һ�ؽ�)
%         end        
%      end
%     dddd1 = delta_L1/4*168000; %˿�˱仯4mmΪ���תһȦ
%     qqdd1 = zeros(24,2); %3*8*nתΪ24*n����
%     for i = 1:1:24
%         for m = 1:1:2
%             %i��Ӧ�Ĺؽ����Ϊi%8
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
