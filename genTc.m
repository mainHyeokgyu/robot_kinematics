function Tm=genTc(Dhs)
[l c]= size(Dhs);
for i=1:1:l
    if i==1
        Tm(:,:,i)=eye(4)*dh_gyu_1(Dhs(i,:));
    else
        Tm(:,:,i)=Tm(:,:,i-1)*dh_gyu_1(Dhs(i,:));
    end
end