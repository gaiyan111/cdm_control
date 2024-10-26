function L = cablelength_calc_n(a,b,n) 
d = 17.25;
x = 22*sin(n);y = 22*cos(n);
T1 = [cos(a) -sin(a) 0 0;sin(a) cos(a) 0 0;0 0 1 0;0 0 0 1];%rotz(a)
T2 = [cos(b) -sin(b) 0 0;sin(b) cos(b) 0 0;0 0 1 0;0 0 0 1];%rotz(b)
T3 = [1 0 0 0;0 0 1 0;0 -1 0 0;0 0 0 1];%rotx(-90)
T4 = [1 0 0 d;0 1 0 0;0 0 1 0;0 0 0 1];%T(d 0 0)
TT1 = T4*T1*T3*T2*T4;
p1 = [0;y;x;1];p2 = [0;-x;y;1];
cable_1 = TT1*p2-p1;
L = norm(cable_1)-34.5;

end
