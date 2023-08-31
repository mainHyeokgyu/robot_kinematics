function drawCord(A)
[l c w]=size(A);
for i = 1:1:w
    A_1 = A(:,:,i);
    V_x = createVector([0,0,0],[A_1(1,1),A_1(2,1),A_1(3,1)]);
    V_y = createVector([0,0,0],[A_1(1,2),A_1(2,2),A_1(3,2)]);
    V_z = createVector([0,0,0],[A_1(1,3),A_1(2,3),A_1(3,3)]);
    drawVector3d([A_1(1,4),A_1(2,4),A_1(3,4)],V_x,'LineWidth',3,'Color',[0,0,1]);
    hold on;
    drawVector3d([A_1(1,4),A_1(2,4),A_1(3,4)],V_y,'LineWidth',3,'Color',[0,0,1]);
    drawVector3d([A_1(1,4),A_1(2,4),A_1(3,4)],V_z,'LineWidth',3,'Color',[0,0,1]);
    grid on;
end
end