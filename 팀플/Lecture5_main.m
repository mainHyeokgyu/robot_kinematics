clear all
close all
clc

Dhs=[pi/6, 0 , 0, 1;pi/2, 0, 0, 5];
[Tc,Tl] = genTm(Dhs)
drawCord(Tc);
drawLink(Tc,Dhs);
axis equal;
axis ([-7 7 -7 7]);