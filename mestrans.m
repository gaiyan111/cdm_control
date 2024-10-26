function message = mestrans(id,action,data)

if data >= 0
    data = dec2hex(data,8);
else 
    data = dec2hex(2^32+data,8);
end

data2 = [data(7:8);data(5:6);data(3:4);data(1:2)];
data_new = hex2dec(data2);
data_new = data_new';

if strcmp(action,'M') == 1
    action_new = [153,0];
    message = [08,id,action_new,data_new];
elseif strcmp(action,'GM') == 1
    action_new = [155,0];
    message = [04,id,action_new];
elseif strcmp(action,'PO') == 1 
    action_new = [152,0];
    message = [08,id,action_new,data_new];
elseif strcmp(action,'MR') == 1 
    action_new = [154,0];
    message = [08,id,action_new,data_new];   
elseif  strcmp(action,'GEI') == 1     
    action_new = [210,0];
    message = [04,id,action_new];  
elseif  strcmp(action,'GER') == 1
    action_new = [58,0];
    message = [04,id,action_new];
else
    print('error');
end



end

    
