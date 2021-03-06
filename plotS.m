function plotS(S,order)
leslabels={};
lesmeans=[];
lesstds=[];
hold off
figure
for k=1:length(S)
    leslabels=[leslabels,{S(k).label}];
    lesmeans=[lesmeans,mean(S(k).D)];
    lesstds=[lesstds,std(S(k).D)];   
end

lymin=min(lesmeans(order)-lesstds(order));
lesmeans=lesmeans;
bar(lesmeans(order))
hold on
count=1;

for k=order
    plot([count,count],[-1,1]*lesstds(k)+lesmeans(k),'-k','linewidth',2)
    count=count+1;
end

set(gca,'xticklabels',{[]})

%set(gca,'XTickLabelRotation',45)



count=1;
for k=order
    ypos =lesmeans(k)+lesstds(k)+0.05
    text(count,ypos,leslabels{k},'rotation',0,'HorizontalAlignment', 'center','fontsize',8)
    count=count+1;
end
title('Response from samples')
ylabel('Response amplitude (A.U.)','fontsize',12)
%xlabel('log[Amphetamin] (g/mL)','position',[4,-5],'fontsize',12)
axis([0.5 length(order)+0.5 -0.05 0.6])
end