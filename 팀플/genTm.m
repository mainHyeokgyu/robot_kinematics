function [Tc,Tl] = genTm(Dhs)
    [l c] = size(Dhs);
    for i = 1:1:l
        if (i==1)
            Dhs(i,:);
            Tl(:,:,i)=DH(Dhs(i,:));
            Tc(:,:,i)=eye(4)*DH(Dhs(i,:));
        else
            Tl(:,:,i)=DH(Dhs(i,:));
            Tc(:,:,i)=Tc(:,:,i-1)*Tl(:,:,i);
        end
    end
end