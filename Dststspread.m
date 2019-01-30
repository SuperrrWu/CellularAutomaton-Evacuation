function [Dst_S]=Dststspread(Dst_S,ZAM,row,col,p)
%Dst_SÔÖº¦ÒòËØ¾ØÕó£»pÀ©É¢¸ÅÂÊ£»
Dst_S1=Dst_S;
[I1 I2]=find(Dst_S==1);
for i=1:length(I1)
    a=[I1(i),I2(i)-1;I1(i),I2(i)+1;...
        I1(i)-1,I2(i);I1(i)+1,I2(i);...
        I1(i)+1,I2(i)-1;I1(i)+1,I2(i)+1;...
        I1(i)-1,I2(i)-1;I1(i)-1,I2(i)+1];
    %     b=ones(8,1);
    for j=1:8
        if a(j,1)>0&&a(j,1)<=row&&a(j,2)>0&&a(j,2)<=col&&ZAM(a(j,1),a(j,2))==0
            if rand<p
                Dst_S1(a(j,1),a(j,2))=1;
            end
        end
    end
end
% for i=1:row
%     for j=1:col
%         if Dst_S(i,j)==1||
[I1 I2]=find(Dst_S==1);
for i=1:length(I1)
     a=[I1(i),I2(i)-1;I1(i),I2(i)+1;...
        I1(i)-1,I2(i);I1(i)+1,I2(i);...
        I1(i)+1,I2(i)-1;I1(i)+1,I2(i)+1;...
        I1(i)-1,I2(i)-1;I1(i)-1,I2(i)+1;...
        I1(i)+2,I2(i)-2;I1(i)+2,I2(i)-1;I1(i)+2,I2(i);I1(i)+2,I2(i)+1;I1(i)+2,I2(i)+2;...
        I1(i)-2,I2(i)-2;I1(i)-2,I2(i)-1;I1(i)-2,I2(i);I1(i)-2,I2(i)+1;I1(i)-2,I2(i)+2;...
        I1(i)-1,I2(i)-2;I1(i)-1,I2(i)-1;I1(i)-1,I2(i);I1(i)-1,I2(i)+1;...
        I1(i)+1,I2(i)-2;I1(i)+1,I2(i)-1;I1(i)+1,I2(i);I1(i)+1,I2(i)+1];
    for j=1:8
        if a(j,1)>0&&a(j,1)<=row&&a(j,2)>0&&a(j,2)<=col
        Dst_S1(a(j,1),a(j,2))=max(0.5, Dst_S1(a(j,1),a(j,2)));
        end
    end
    for j=9:24
        if a(j,1)>0&&a(j,1)<=row&&a(j,2)>0&&a(j,2)<=col
        Dst_S1(a(j,1),a(j,2))=max(0.4, Dst_S1(a(j,1),a(j,2)));
        end
    end
end
Dst_S=Dst_S1;





