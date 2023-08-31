clc; clear all; close all

% teample

% 초기값
theta_1 = deg2rad(-90); theta_2 = 0; theta_3 = deg2rad(-90);
d_1 = 5; d_2 =0; d_3=0;
alpha_1 = deg2rad(90); alpha_2 = 0; alpha_3 = 0;
a_1 = 0; a_2 = 5; a_3 = 3;
th12 = theta_1+theta_2; th23 = theta_2+theta_3; th13 = theta_1+theta_2+theta_3;

dt=0.1;
t = [0+dt:dt:3];
L = length(t);
drawPoint3d(0,-5,2)
hold on;
% dotpx = 20; dotpy = 20; dotpz = 20;
% th = Dhs(1);
% d = Dhs(2);
% alp = Dhs(3);
% a = Dhs(4);

[X,Y,Z] = sphere;
axis equal
r = 3;
X2 = X * r;
Y2 = Y * r;
Z2 = Z * r;
surf(X2,Y2-10,Z2+2)
hold on
dy=33/103;
% dy = 33/103
% dz = 0.1;
YY = [-15+dy:dy:-5];
Lz = length(YY);
syms y
z = -8/5*y-6;
zz = 8/5*y+26;
z0 = double(subs(z,y,-5));
z1 = double(subs(zz,y,-10));

zp = zeros(1,(Lz-1)/2); % 저장용도
for i=1:(Lz-1)/2
    z0(i)= zp(i) + double(subs(z,y,-5-dy*i));
    z1(i)= zp(i) + double(subs(zz,y, -10-dy*i));
end

% dz/dt, dy/dt

for i=2:(Lz-1)/2
    dzt1(i) = (z0(i)-z0(i-1))/dt;
    dzt2(i) = (z1(i)-z1(i-1))/dt;
end

dotpz = zeros(1,Lz-1);
dotpz(1:(Lz-1)/2) = dzt1;
dotpz((Lz-1)/2+1:Lz-1) = dzt2;

for i=2:Lz-1
    dotpy(i) = (YY(i)-YY(i-1))/dt;
end

dotpx = zeros(1,Lz-1);

%%
for i=2:L
    J = [-sin(theta_1(i-1))*(a_2*cos(theta_2(i-1))+a_3*cos(th23(i-1))), -cos(theta_1(i-1))*(a_2*sin(theta_2(i-1))+a_3*sin(th23(i-1))), -a_3*cos(theta_1(i-1))*sin(th23(i-1));
        cos(theta_1(i-1))*(a_2*cos(theta_2(i-1))+a_3*cos(th23(i-1))), -sin(theta_1(i-1))*(a_2*sin(theta_2(i-1))+a_3*sin(th23(i-1))), -a_3*sin(theta_1(i-1))*sin(th23(i-1));
        0                                  , a_2*cos(theta_2(i-1))+a_3*cos(th23(i-1))            , a_3*cos(th23(i-1))];
    dth(i,:) = inv(J)*[dotpx(i); dotpy(i); dotpz(i)];
    dth1(i,1) = dth(i,1);
    dth2(i,1) = dth(i,2);
    dth3(i,1) = dth(i,3);
    theta_1(i) = theta_1(i-1)+dth1(i,1)*dt;
    theta_2(i) = theta_2(i-1)+dth2(i,1)*dt;
    theta_3(i) = theta_3(i-1)+dth3(i,1)*dt;
    theta(i,:) = [theta_1(i), theta_2(i), theta_3(i)];
    th23(i) = theta_2(i)+theta_3(i);
    Dhs=[theta_1(i), d_1, alpha_1, a_1;
        theta_2(i), d_2, alpha_2, a_2;
        theta_3(i), d_3, alpha_3, a_3];

    [Tc,Tl] = genTm(Dhs);
    drawCord(Tc);
    drawLink(Tc);
%     axis equal;

    axis ([-7 7 -7 7]);
    pause(0.5);
    
end


% Dhs=[deg2rad(th1), d1, deg2rad(alp1), a1;
%     deg2rad(th2), d2, deg2rad(alp2), a2;
%     deg2rad(th3), d3, deg2rad(alp3), a3];
%
% [Tc,Tl] = genTm(Dhs);
% drawCord(Tc);
% drawLink(Tc,Dhs);
% axis equal;
% axis ([-7 7 -7 7]);

% T1 = DH(Dhs(1,:));
% T2 = DH(Dhs(2,:));
% T3 = DH(Dhs(3,:));
% px1 = DH(Dhs(1,1));
% py1 = DH(Dhs(1,2));
% pz1 = DH(Dhs(1,3));
% p1 = [px1 py1 pz1];
% px2 = DH(Dhs(2,1));
% py2 = DH(Dhs(2,2));
% pz2 = DH(Dhs(2,3));
% p2 = [px2 py2 pz2];
%
% px3 = DH(Dhs(3,1));
% py3 = DH(Dhs(3,2));
% pz3 = DH(Dhs(3,3));
% p3 = [px3 py3 pz3];
%
% Px1 = d1*(cos(th1))+a2*(cos(th12));
% Py1 = d1*(sin(th1))+a2*(sin(th12));
%
% Px2 = d1*(cos(th1))+a2*(cos(th12))+a3*(cos(th13));
% Py2 = d1*(sin(th1))+a2*(sin(th12))+a3*(sin(th13));
% Pz2 =

% J = [-sin(th1)*(a2*cos(th2)+a3*cos(th23)), -cos(th1)*(a2*sin(th2)+a3*sin(th23)), -a3*cos(th1)*sin(th23);
%       cos(th1)*(a2*cos(th2)+a3*cos(th23)), -sin(th1)*(a2*sin(th2)+a3*sin(th23)), -a3*sin(th1)*sin(th23);
%       0                                  , a2*cos(th2)+a3*cos(th23)            , a3*cos(th23)];