function singleLinkControl_n(pitch,yaw,link) 
    global qqdd1;
    delta_L1 = [];
    for i = 1:1:24 
        angle = cableangle_calc_n(i); 
        delta_L1(i,1,1) = cablelength_calc_n(pitch,yaw,angle);
    end        
    dddd1 = delta_L1/4*168000; 
    for i = 1:1:24
        index = mod(i,8);
        if index == 0
            index = 8;
        end
        if index >= link
            qqdd1(i,1,1) = qqdd1(i,1,1) + dddd1(i,1,1); 
        end
    end
end        

