function manual(link) 
    disp('manual');
    global anchor; 
    for i = 1:16
        theatList(i) = anchor(i) * pi/60;
    end
%     for i = 1:6
%         theatList(i)
%     end
    global key;
    key = 1;
    linksControl(theatList); 
end    