fid = fopen('E:\pathr1.txt','r');
PATH=fscanf(fid,'%f',[3,40]);
fclose(fid);
PATHlength=0
for i=1:length(PATH(1,:))-1, PATHlength = PATHlength + distanceCost(PATH(1:3,i),PATH(1:3,i+1)); end % calculate path length
fprintf('PATH=%d \n\n', PATHlength);