syms q1 q2 q3 i4 i5 i6 a1 a2 a3 l1 l2 l3 l4 l5 l6 d1 d2 d3 d4 d5 d6 fi

%% Configuration of denavit hartenberg
d=[106;0;0] ;
theta=str2sym('[q1;q2;q3]');
a=[0;99;140];
alpha=str2sym('[pi/2;0;0]');

DH=str2sym('[d theta a alpha]');
numberoflinks=length(d);
%%
%%Transformation matrix declaration through link i to i+1
for i=1:numberoflinks
    H_{i}=[cos(theta(i)) -sin(theta(i))*cos(alpha(i)) sin(theta(i))*sin(alpha(i)) a(i)*cos(theta(i));
    sin(theta(i))     cos(theta(i))*cos(alpha(i))   -cos(theta(i))*sin(alpha(i)) a(i)*sin(theta(i));
    0 sin(alpha(i)) cos(alpha(i)) d(i);
    0 0 0 1];
end
%%
%%Transformation matrix through the end effector
Ha=1;
for i=1:numberoflinks
    Ha=Ha*cell2sym(H_(i)); 
    Hb{i}=Ha
end

%%Kinematic jacobian
links=[0 0 0]
J=sym(zeros(6,length(links)));
p0=[0;0;0]
p1=str2sym('[0 ; 0 ;l1]')
p2=str2sym('[l2*cos(q1)*cos(q2); l2*sin(q1)*cos(q2);l2*sin(q2)+l1]')
p3=str2sym('[l3*cos(q2+q3)*cos(q1)+l2*cos(q1)*cos(q2); l3*cos(q2+q3)*sin(q1)+l2*sin(q1)*cos(q2); l3*sin(q2+q3)+l2*sin(q2)+l1]')
P=[p0 p1 p2 p3];
for i=1:1%whole jacobian
    if links(i)==1 %prismatic
        H=cell2sym(Hb(i));
        J(:,i)=[H(1:3,1:3)*[0;0;1];  [0;0;0]];
    end
    if links(i)==0%revolute
        H=cell2sym(Hb(i));
        J(:,i)=[cross((H(1:3,1:3)*[0;0;1]),(P(:,2)-P(:,i))) ;  H(1:3,1:3)*[0;0;1]];
        
    end
    J(4:6,1)=[0;0;1];
    J
end

        
       
%%