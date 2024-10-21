function angle = cableangle_calc_n(i)
%%
%为什么I= 1，J=1时是109号电机。
%%
%一组3根绳，a = 1，2，3；b表示从基座开始的关节index
%一圈24个孔，角度间隔15°；
% angle = (a-1)*(2/3*pi)+(b-1)*(1/12*pi);
% motor = (a-1)*8 + b +1;
if i <=8
    angle = -(i - 1)*(1/12*pi);
elseif i <= 16
    angle = -(i - 1 - 8)*(1/12*pi) + 2/3*pi;
else
    angle = -(i - 1 - 16)*(1/12*pi) + 4/3*pi;
end
%%
% function angle = cableangle_calc_n(i)
% %%
% %为什么I= 1，J=1时是109号电机。
% %%
% %一组3根绳，a = 1，2，3；b表示从基座开始的关节index
% %一圈24个孔，角度间隔15°；
% % angle = (a-1)*(2/3*pi)+(b-1)*(1/12*pi);
% % motor = (a-1)*8 + b +1;
% if i <=8
%     angle = -(i - 1)*(1/18*pi) - 3*(1/18*pi);
% elseif i <= 16
%     angle = -(i - 1 - 8)*(1/18*pi) + 2/3*pi - 3*(1/18*pi);
% else
%     angle = -(i - 1 - 16)*(1/18*pi) + 4/3*pi - 3*(1/18*pi);
% end