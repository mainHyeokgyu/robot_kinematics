%%D-H Parameter
function T=DH(Dhs)
    th = Dhs(1);
    d = Dhs(2);
    alp = Dhs(3);
    a = Dhs(4);
T=[ cos(th),  -sin(th)*cos(alp),  sin(th)*sin(alp), a*cos(th);...
    sin(th),  cos(th)*cos(alp),   -cos(th)*sin(alp), a*sin(th);...
      0,         sin(alp),            cos(alp),         d;...
      0,            0,                   0,             1];

end