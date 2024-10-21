function baseControl(d)
        %d为距离，d/10*168000
        dd = d/10*168000;
        dd = round(dd);
        global key;
        key=1;
        if key
            canch1 = canChannel('Kvaser','Leaf Light v2 1',1);  
            start(canch1)
            id = 44;
            message(1) = canMessage(id,false,8);
            message(1).Data = mestrans(id,'M',dd);
            transmit(canch1,message(1));
            stop(canch1);
        end
end