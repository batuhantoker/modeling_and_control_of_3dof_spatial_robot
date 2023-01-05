clc
clear
q1i=180;
q1f=-180;
q2i=-45;
q2f=135;
q3i=-135;
q3f=-45;
q1 = deg2rad(linspace(q1i,q1f,20));
q2 = deg2rad(linspace(q2i,q2f,20));
q3 = deg2rad(linspace(q3i,q3f,20));
l1 = 106;
l2 = 98.7;
l3 = 140.25;
a=1;
for i=1:length(q1)
    for j=1:length(q2)
        for k=1:length(q3)

        x(a,1) =  l3*cos(q2(j)+q3(k))*cos(q1(i)) + l2*cos(q1(i))*cos(q2(j));

        y(a,1) = l3*cos(q2(j)+q3(k))*sin(q1(i) ) + l2*sin(q1(i))*cos(q2(j));

        z(a,1) = l3*sin(q2(j)+q3(k)) + l2*sin(q2(j)) + l1;
        a=a+1;
        end
    end
end
scatter3(x,y,z)
xyz=[x,y,z];
B = unique(round(xyz,4),'rows');
if length(xyz)==length(B)
    singularity=0 %there is no singularity
else
    singularity=length(xyz)-length(B) %there are singularity at infinity point. this number shows number of singularity for pre-defined angles
end
clear q1 q2 q3
syms q1 q2 q3
J=str2sym('[- l3*cos(q2 + q3)*sin(q1) - l2*cos(q2)*sin(q1),- l3*sin(q2 + q3)*cos(q1) - l2*cos(q1)*sin(q2),-l3*sin(q2 + q3)*cos(q1); l3*cos(q2 + q3)*cos(q1) + l2*cos(q1)*cos(q2),- l3*sin(q2 + q3)*sin(q1) - l2*sin(q1)*sin(q2),-l3*sin(q2 + q3)*sin(q1);0,l3*cos(q2 + q3) + l2*cos(q2),l3*cos(q2 + q3)]');
M=inv(J*transpose(J));
q1i=150;
q1f=-150;
q2i=-45;
q2f=125;
q3i=-125;
q3f=-45;
q1l = deg2rad(linspace(q1i,q1f,3));
q2l = deg2rad(linspace(q2i,q2f,3));
q3l = deg2rad(linspace(q3i,q3f,3));
a=1;
for i=1:length(q1l)
    for j=1:length(q2l)
        for k=1:length(q3l)
            q1=q1l(i);
            q2=q2l(j);
            q3=q3l(k);
            Man(a,:)=eig(eval(M));
            thet=eig(eval(M)).*[1 0 0]';
            theta(a)=acos(thet(1));
            a=a+1;
        end
    end
end
for i=1:length(Man);
    ra(i)=min(Man(i,:));
    rb(i)=max(Man(i,:));
end
% figure
% hold
% for i=1:length(ra)
% [x, y, z] = ellipsoid(0,0,0,ra(i),rb(i),0,30);
% aa(:,:,i)=x;
% ab(:,:,i)=y;
% ac(:,:,i)=z;
% S=surfl(x,y,z)
% 
% end
clear x y z
w=1;
t=linspace(1,100,1000);
k=zeros(1,length(t));
l=k;
for i=1:length(ra)
k(i,:)=ra(i)*sin(w*t);
l(i,:)=rb(i)*cos(w*t);
plot(k(i,:),l(i,:))
hold on
end


