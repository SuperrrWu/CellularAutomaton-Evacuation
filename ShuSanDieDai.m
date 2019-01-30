 function  [Pop_S,Pop,Pop_Snext]=ShuSanDieDai(Pop_S,Pop,ZAM,Env_S,Dst_S,Wid,Len,...
 L_cell,Exit_S,lamda1,lamda2)
%人员疏散迭代函数；
%Pop_S未疏散人员位置信息；Env_S为环境信息；Pop为未疏散人数；Pop_C未疏散人员个体特性,
%Wid为场所区域宽；Len为区域长；L_cell元胞边长;Exit_S出口信息；
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








