function S = group_results(P,PL)
S=[];%structure to rearrange data per label
for row=1:size(PL,1)
    for col=1:size(PL,2)
        lek=0;
        if ~isempty(PL(row,col).label) && ~prod(strcmp(PL(row,col).label,'')) %find preexisting label
            for k=1:length(S)
                
                if length(PL(row,col).label)==length(S(k).label) && prod(strcmp(PL(row,col).label,S(k).label))
                    lek=k;
                    break
                end
            end
            if lek>0
                S(lek).D=[S(lek).D,P(row,col)];  %add data to existing label
            else
                S(end+1).label=PL(row,col).label; %create label
                S(end).D=P(row,col);
            end
        end
        
    end
end

end