function drawLink(A,Dhs)
[l,c,w] = size(A);
    for i=1:1:w
        if (i==1)
            x=A(1,4,i);
            y=A(2,4,i);
            z=A(3,4,i);
            drawEdge3d([0 0 0 x y z],'Color',[1 0 0],'LineWidth',5);
        else
            x0=A(1,4,i-1);
            y0=A(2,4,i-1);
            z0=A(3,4,i-1);
            x1=A(1,4,i);
            y1=A(2,4,i);
            z1=A(3,4,i);
            drawEdge3d([x0 y0 z0 x1 y1 z1],'Color',[0 1 0],'LineWidth',5);
        end
    end
end