
function out= htf(o,d,a,ai)

out=[cos(o)     -sin(o)*cos(a)  sin(o)*sin(a)	ai*cos(o);
     sin(o)     cos(o)*cos(a)	-cos(o)*sin(a)	ai*sin(o);
     0          sin(a)          cos(a)          d        ;
     0          0               0               1       ];
end