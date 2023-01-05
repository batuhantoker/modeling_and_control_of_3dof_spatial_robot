q1i=180;
q1f=-180;
q2i=-45;
q2f=135;
q3i=-45;
q3f=-135;
q1 = deg2rad(linspace(q1i,q1f,200));
q2 = deg2rad(linspace(q2i,q2f,200));
q3 = deg2rad(linspace(q3i,q3f,200));
l1 = 106;
l2 = 98.7;
l3 = 140.25;
for i=1:length(q1)
    x1(i)=0;
    y1(i)=0;
    z1(i)=0;
    z2(i)=l1;
    x2(i)=0;
    y2(i)=0;
    x3(i)=l2*cos(q1(i))*cos(q2(i));
    y3(i)=l2*sin(q1(i))*cos(q2(i));
    z3(i)=l2*sin(q2(i))+l1;
    x4(i) =  l3*cos(q2(i)+q3(i))*cos(q1(i)) + l2*cos(q1(i))*cos(q2(i));

    y4(i) = l3*cos(q2(i)+q3(i))*sin(q1(i) ) + l2*sin(q1(i))*cos(q2(i));

    z4(i) = l3*sin(q2(i)+q3(i)) + l2*sin(q2(i)) + l1;

end
d=1; %defines velocity 
j=1:d:length(q1); 
for i=1:length(j)


hold off

%plot([x1(j(i)) x2(j(i))],[y1(j(i)) y2(j(i))],'o',[x2(j(i)) x3(j(i))],[y2(j(i)) y3(j(i))],'--rs',[x3(j(i)) x4(j(i))],[y3(j(i)) y4(j(i))],'k')
plot3([x1(j(i)) x2(j(i))],[y1(j(i)) y2(j(i))],[z1(j(i)) z2(j(i))],'--b',[x2(j(i)) x3(j(i))],[y2(j(i)) y3(j(i))],[z2(j(i)) z3(j(i))],'-k',[x3(j(i)) x4(j(i))],[y3(j(i)) y4(j(i))],[z3(j(i)) z4(j(i))],'-r')
title('Motion of 3DoF Spatial Manipulator')

axis([-300 300 -300 300 -300 300]); % last -300 300 will be added when 2D plot is desired
xlabel('x position(mm)')
ylabel('y position(mm)')
zlabel('z position(mm)')
legend('Show')
grid

MM(i)=getframe(gcf);
end

drawnow;

v = VideoWriter('Robotic Movie.mp4','MPEG-4');
open(v)
writeVideo(v,MM)
close(v)

