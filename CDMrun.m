load('joint1.mat');load('dbase1.mat');load('zy.mat');
angle1 = rot90(joint1,-1);
joint_angles_n1 = fliplr(angle1);
zy = rot90(zy,-1);
joint_angles_zy = fliplr(zy);
d_base1 = rot90(dbase1,-1);
d_base1 = fliplr(d_base1);
D_base1 = flipud(d_base1);
joint=joint1*180/pi;
global key;
key = 1; 
for i = 1:1:60 
    linksControl(joint_angles_n1(i,:));
    baseControl(d_base1(i,:));
    pause(0.2)
end
for i = 61:1:length(d_base1) 
    linksControl(joint_angles_n1(i,:));
    baseControl(d_base1(i,:));
    pause(0.2)
end
joint1_2 = flipud(joint_angles_n1);
for i = 1:1:77 
    linksControl(joint1_2(i,:));
    baseControl(D_base1(i,:));
    pause(0.2)
end
for i = 1:1:length(joint_angles_zy)
    linksControl(joint_angles_zy(i,:));
    pause(0.2)
end
load('joint2.mat');load('dbase2.mat');
angle8 = rot90(joint2,-1);
joint_angles_n2 = fliplr(angle8);
d_base2 = rot90(dbase2,-1);
d_base2 = fliplr(d_base2);
D_base2 = flipud(d_base2);

for i = 37:1:length(d_base2)  
    linksControl(joint_angles_n2(i,:));
    baseControl(d_base2(i,:));
    pause(0.2)
end

joint22 = flipud(joint_angles_n2);
for i = 1:1:length(D_base2)
    linksControl(joint22(i,:));
    baseControl(D_base2(i,:));
    pause(0.1)
end
