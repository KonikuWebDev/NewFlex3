
Y=Yold;
Y=Y-repmat(mean(Y,1),[size(Y,1),1]);
Y=Y./repmat(sqrt(mean(Y.^2,1)),[size(Y,1),1]);
M=cov(Y);
[V,D] = eig(M);

PC1=V(:,end);
PC2=V(:,end-1);
PC3=V(:,end-2);

Z=Y*V;
figure
hold on
%positive menthol
scatter3(Z(1:96:end,end),Z(1:96:end,end-1),Z(1:96:end,end-2),'or')
scatter3(Z(25:96:end,end),Z(25:96:end,end-1),Z(25:96:end,end-2),'or')
%negative menthol
scatter3(Z(13:96:end,end),Z(13:96:end,end-1),Z(13:96:end,end-2),'sr')
scatter3(Z(37:96:end,end),Z(37:96:end,end-1),Z(37:96:end,end-2),'sr')

%negative TATP
scatter3(Z(49:96:end,end),Z(49:96:end,end-1),Z(49:96:end,end-2),'sb')
scatter3(Z(73:96:end,end),Z(73:96:end,end-1),Z(73:96:end,end-2),'sb')
%positive TATP
scatter3(Z(61:96:end,end),Z(13:96:end,end-1),Z(13:96:end,end-2),'ob')
scatter3(Z(85:96:end,end),Z(37:96:end,end-1),Z(37:96:end,end-2),'ob')

scatter3(Z(:,end),Z(:,end-1),Z(:,end-2),'.k')
axis equal
Zp=Z(:,end-2:end);

Zp(1:12:end,:)=[];
Zp=reshape(Zp',[1,length(Zp)*3]);

Zp=reshape(Zp,[(88*3),length(Zp)/(88*3)]);
Zp=Zp'

M2=cov(Zp);
[V2,D2] = eig(M2);

PC1b=V2(:,end);
PC2b=V2(:,end-1);
PC3b=V2(:,end-2);

Z2=Zp*V2;

RMind=[1 2 3];
AMind=[4 5 6];
ACind=[7 8 9];

figure
hold on

for i=AMind
    scatter3(Z2(i,end),Z2(i,end-1),Z2(i,end-2),'or')
end

for i=ACind
    scatter3(Z2(i,end),Z2(i,end-1),Z2(i,end-2),'og')
end

for i=RMind
    scatter3(Z2(i,end),Z2(i,end-1),Z2(i,end-2),'ob')
end

axis equal



figure
hold on
for i=AMind
    scatter(Z2(i,end-1),Z2(i,end-2),'or')
end

for i=ACind
    scatter(Z2(i,end-1),Z2(i,end-2),'og')
end

for i=RMind
    scatter(Z2(i,end-1),Z2(i,end-2),'ob')
end

axis equal