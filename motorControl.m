function motorControl(qqdd1)
canch1 = canChannel('Kvaser','Leaf Light v2 1',1);
start(canch1)
id=[108 107 106 105 104 103 102 125    116 115 114 113 112 111 110 109    124 123 122 121 120 119 118 117];
for t=1:1:size(qqdd1,3)
    for index=1:1:24
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
