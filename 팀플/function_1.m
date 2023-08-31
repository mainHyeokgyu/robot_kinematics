clear all
close all
clc
n=3; %링크 개수
l1=5;
l2=5;
l3=3;

th1=deg2rad(-90);
th2=deg2rad(0);
th3=deg2rad(-90);

d1=l1;
d2=0;
d3=0;

alp1=deg2rad(90);
alp2=deg2rad(0);
alp3=deg2rad(0);

a1=0;
a2=l2;
a3=l3;

dth1=deg2rad(90);
dth2=deg2rad(0);
dth3=deg2rad(0);
dth=[dth1; dth2; dth3];

dt=0.01;
t=3;
L=t/dt;
J = [-sin(th1)*(a2*cos(th2)+a3*cos(th2+th3)), -cos(th1)*(a2*sin(th2)+a3*sin(th2+th3)), -a3*cos(th1)*sin(th2+th3);
      cos(th1)*(a2*cos(th2)+a3*cos(th2+th3)), -sin(th1)*(a2*sin(th2)+a3*sin(th2+th3)), -a3*sin(th1)*sin(th2+th3);
      0                                     , a2*cos(th2)+a3*cos(th2+th3)            ,  a3*cos(th2+3)];

Dhs=[th1, d1 , alp1, a1; th2, d2, alp2, a2; th3, d3, alp3, a3];
[Tc,Tl] = genTm(Dhs);
drawCord(Tc);
drawLink(Tc,Dhs);
axis equal;
axis ([-10 10 -10 10 -10 10]);
P=Tc(:,4,n); % 끝점 Px, Py, Pz 좌표 값
Px=P(1); Py=P(2); Pz=P(3);
for i=1:100
    J = [-sin(th1)*(a2*cos(th2)+a3*cos(th2+th3)), -cos(th1)*(a2*sin(th2)+a3*sin(th2+th3)), -a3*cos(th1)*sin(th2+th3);
        cos(th1)*(a2*cos(th2)+a3*cos(th2+th3)), -sin(th1)*(a2*sin(th2)+a3*sin(th2+th3)), -a3*sin(th1)*sin(th2+th3);
        0                                     , a2*cos(th2)+a3*cos(th2+th3)            ,  a3*cos(th2+th3)];
    dp = J*dth;
    Dhs=[th1, d1 , alp1, a1; th2, d2, alp2, a2; th3, d3, alp3, a3];
    [Tc,Tl] = genTm(Dhs);
    drawCord(Tc);
    axis equal;
    axis ([-10 10 -10 10 -10 10]);
    drawLink(Tc,Dhs);

    Px=Tc(1,4,n); Py=Tc(2,4,n); Pz = Tc(3,4,n); %끝점 좌표
    dPx=dp(1); dPy=dp(2); dPz=dp(3); %해당 위치에서의 속도 벡터
    drawVector3d([Px Py Pz],[dPx*dt*1000 0 0],'linewidth',2, 'color', [1 1 0]);
    drawVector3d([Px Py Pz],[0 dPy*dt*1000 0],'linewidth',2, 'color', [1 1 0]);
    drawVector3d([Px Py Pz],[0 0 dPz*dt*1000],'linewidth',2, 'color', [1 1 0]);
    th1 = th1+dth1*dt; th2 = th2+dth2*dt; th3 = th3+dth3*dt;
    pause(0.0001);
end





