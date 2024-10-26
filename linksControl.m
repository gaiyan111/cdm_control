function linksControl(joint_angles_n) 

    global qqdd1;
    global key;

    for t = 1:1:size(joint_angles_n,1)
        
        qqdd1 = zeros(24,1,1);
        if key
            for j = 1:1:size(joint_angles_n,2)/2 %根据传入角度矩阵判断关节数
                singleLinkControl_n(joint_angles_n(t,2*(j-1)+1),joint_angles_n(t,2*(j-1)+2),j);
            end
              motorControl(round(qqdd1));

             pause(0.01);

        else
            break;
        end
       
    end

end    
