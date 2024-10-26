function feasible = checkcos(x,y)
    feasible=true;
    xy   = dot(x,y);
    nx   = norm(x);
    ny   = norm(y);
    nxny = nx*ny;
    Cs   = xy/nxny;
    angle = acos(Cs)*180/pi;
    if angle > 40
        feasible = false;
    end
end