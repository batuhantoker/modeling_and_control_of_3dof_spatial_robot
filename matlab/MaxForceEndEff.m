clc
clear
q1i=180;
q1f=-180;
q2i=-45;
q2f=135;
q3i=-135;
q3f=-45;
q1 = deg2rad(linspace(q1i,q1f,60));
q2 = deg2rad(linspace(q2i,q2f,60));
q3 = deg2rad(linspace(q3i,q3f,60));
l1 = 106;
l2 = 98.7;
l3 = 140.25;
a=1;
for i=1:length(q1)
    for j=1:length(q2)
        for k=1:length(q3)

o1=q1(i);
o2=q2(i);
o3=q3(i);



K_Jac=[-cos(q1(i))*(l1 + l3*sin(q2(i) + q3(i)) + l2*sin(q2(i))), -cos(q1(i))*(l3*sin(q2(i) + q3(i)) + l2*sin(q2(i))),-l3*sin(q2(i) + q3(i))*cos(q1(i));-sin(q1(i))*(l1 + l3*sin(q2(i) + q3(i)) + l2*sin(q2(i))),-sin(q1(i))*(l3*sin(q2(i) + q3(i)) + l2*sin(q2(i))),-l3*sin(q2(i) + q3(i))*sin(q1(i));cos(q1(i))*(l3*cos(q2(i) + q3(i))*cos(q1(i)) + l2*cos(q1(i))*cos(q2(i))) + sin(q1(i))*(l3*cos(q2(i) + q3(i))*sin(q1(i)) + l2*cos(q2(i))*sin(q1(i))), cos(q1(i))*(l3*cos(q2(i) + q3(i))*cos(q1(i)) + l2*cos(q1(i))*cos(q2(i))) + sin(q1(i))*(l3*cos(q2(i) + q3(i))*sin(q1(i)) + l2*cos(q2(i))*sin(q1(i))), l3*cos(q2(i) + q3(i))*cos(q1(i))^2 + l3*cos(q2(i) + q3(i))*sin(q1(i))^2;0,sin(q1(i)),                                               sin(q1(i));                                                                                                              0,                                                                                                        -cos(q1(i)),                                              -cos(q1(i));                                                                                                               1,                                                                                                               0,                                                     0];
 
T= [500;500;500];
JT = transpose(K_Jac);

F=pinv(JT)*T; %since JT is not nxn matrix
Force(a)=sqrt(F(1)^2+F(2)^2+F(3)^2);
        a=a+1;
        end
    end
end
max(Force)