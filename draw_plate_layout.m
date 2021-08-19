hold off
plot([0,0],[0,8])
hold on
for i=1:12
    plot([i,i],[0,8],'k') 
end
for j=0:8
    plot([0,12],[j,j],'k') 
end
ax = gca;
ax.YDir = 'reverse';
set(gca,'xtick',0.5+0:12)
set(gca,'xticklabels',{'1','2','3','4','5','6','7','8','9','10','11','12'})

set(gca,'ytick',0.5+0:8)
set(gca,'yticklabels',{'A','B','C','D','E','F','G','H'})


for row=1:size(PL,1)
    for col=1:size(PL,2)
        if ~isempty(PL(row,col).label)
            text(col-0.9,row-0.5,PL(row,col).label)
        end
    end
end
    
    