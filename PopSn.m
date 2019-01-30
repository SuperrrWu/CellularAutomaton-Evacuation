function  [Pop_S,Pop,Env_S,Pop_Snext]=PopSn(Pop_S,Pop,ZAM,Env_S,Dst_S,Wid,Len,L_cell,Exit_S,...
    Pop_Snext,lamda1,lamda2)
Pop_Stemp=[];

% Env_S=Env_S|Dst_S;
for i=1:Pop      %各人员初步确定的下一步移动位置；
    D=ones(9,1);
    a=zeros(9,2);
    A=((Pop_S(i,1)-Exit_S(:,1)).^2+(Pop_S(i,2)-Exit_S(:,2)).^2).^(0.5);
    [K,I]=min(A);%找出口I；
    a=[Pop_S(i,1),-L_cell+Pop_S(i,2);L_cell+Pop_S(i,1),-L_cell+Pop_S(i,2);L_cell+Pop_S(i,1),Pop_S(i,2);...
        L_cell+Pop_S(i,1),L_cell+Pop_S(i,2);Pop_S(i,1),L_cell+Pop_S(i,2);Pop_S(i,1)-L_cell,L_cell+Pop_S(i,2);...
        Pop_S(i,1)-L_cell,Pop_S(i,2);Pop_S(i,1)-L_cell,-L_cell+Pop_S(i,2);Pop_S(i,1),Pop_S(i,2)];
%     a=[L_cell+Pop_S(i,1),Pop_S(i,2);Pop_S(i,1),L_cell+Pop_S(i,2);...
%         ;Pop_S(i,1),-L_cell+Pop_S(i,2)];% -L_cell+Pop_S(i,1),Pop_S(i,2)
jishu=[];
d=ones(9,1);
    for j=1:9%计算邻域点到出口I的距离；
        if  0<a(j,1)&&a(j,1)<=Wid&&0<a(j,2)&&a(j,2)<=Len&&Env_S(a(j,2)/...
                L_cell+0.5,a(j,1)/L_cell+0.5)==0&&Dst_S(a(j,2)/...
                L_cell+0.5,a(j,1)/L_cell+0.5)<1&&ZAM(a(j,2)/...
                L_cell+0.5,a(j,1)/L_cell+0.5)==0%%
            D(j)=(Exit_S(I,1)-a(j,1))^2+(Exit_S(I,2)-a(j,2))^2;
            d(j)=Dst_S(a(j,2)/...
                L_cell+0.5,a(j,1)/L_cell+0.5);
        else
          jishu(end+1)=j;  
        end
    end
    a(jishu,:)=[];
    D(jishu)=[];
    d(jishu)=[];
    D=(D-min(D)+eps)./(max(D)-min(D)+eps);
    D=lamda1*D+lamda2*d;%????????????
    [c d]=min(D);
    II=find(D==c);
    L=length(II);
    if L~=0
    d=II(randi([1 L]));  
        Pop_Stemp(i,:)=a(d,:);
    else
        Pop_Stemp(i,:)=Pop_S(i,:);
       %被困 Pop_beikun=Pop_beikun+1;
    end
end
%%%%%%%%%冲突解决；
Pjc=[];
for i=1:Pop
    if ~isempty(Pop_Snext)
        if  isempty(find(Pop_Snext(:,1)==Pop_Stemp(1,1)))||isempty(find(Pop_Snext(:,2)==Pop_Stemp(1,2)))
            Pop_Snext(end+1,:)=Pop_Stemp(1,:);
            Env_S(Pop_Stemp(1,2)/L_cell+0.5,Pop_Stemp(1,1)/L_cell+0.5)=1;
            Pjc(end+1)=i;
        end
        Pop_Stemp(1,:)=[];
    else
        Pop_Snext=Pop_Stemp(1,:);
        Pjc(end+1)=i;
        Pop_Stemp(1,:)=[];
    end
end
Pop_S(Pjc,:)=[];
[Pop a]=size(Pop_S);
