function PL=groupPL(PL_1,PL_2)
PL=PL_1;
for row=1:size(PL_1,1)
    for col=1:size(PL_1,2)
        
        PL(row,col).label=[PL(row,col).label,PL_2(row,col).label];
    end
end


end