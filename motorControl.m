function motorControl(qqdd1)
%输入为24根绳的绳长变化
%tic;
% chans = canChannelList;
%message = [08 42 99 00 40 90 02 00];
canch1 = canChannel('Kvaser','Leaf Light v2 1',1);
%canch1 = canChannel('MathWorks','Virtual 1',1)
start(canch1)
%message = canMessage (66,false,8)
%message.Data = mestrans(66,'M',-168000);
%transmit(canch1,message);
% id = [71,62,67,68,69,70,23,32,66];
% id = 102:1:125;
% id=[109 108 107 106 105 104 103 102   117 116 115 114 113 112 111 110   125 124 123 122 121 120 119 118];
id=[108 107 106 105 104 103 102 125    116 115 114 113 112 111 110 109    124 123 122 121 120 119 118 117];
%%  依时间调整关节角度

for t=1:1:size(qqdd1,3)
    for index=1:1:24
%         if index == 8 || index == 16 || index == 24
%             id(index)
%             qqdd1(index,1,t)
%%
%新机械臂来了去掉if
%         if index == 1 || index == 9 || index == 17
            message(1) = canMessage(id(index),false,8);
            message(1).Data = mestrans(id(index),'M',qqdd1(index,1,t));
            transmit(canch1,message(1));
%         end
if mod(index,6)==0
            pause(0.05)
end
%         end
    end
    % pause(0.01)
end


receive(canch1,5);
stop(canch1);
%toc;
end