 function  [Pop_S,Pop,Pop_Snext]=ShuSanDieDai(Pop_S,Pop,ZAM,Env_S,Dst_S,Wid,Len,...
 L_cell,Exit_S,lamda1,lamda2)
%��Ա��ɢ����������
%Pop_Sδ��ɢ��Աλ����Ϣ��Env_SΪ������Ϣ��PopΪδ��ɢ������Pop_Cδ��ɢ��Ա��������,
%WidΪ���������LenΪ���򳤣�L_cellԪ���߳�;Exit_S������Ϣ��
W=Wid/L_cell;
L=Len/L_cell;
Pop_Snext=[];
for i=1:100
    if ~isempty(Pop_S)
[Pop_S,Pop,Env_S,Pop_Snext]=PopSn(Pop_S,Pop,ZAM,Env_S,...
    Dst_S,Wid,Len,L_cell,Exit_S,Pop_Snext,lamda1,lamda2);
   
    else
        break
    end
    
end








