background=1:40;
SS=[];
DD=D(1:3,1:6,2);
BB=B(1:3,1:6,2);
DD=reshape(DD,[1,numel(DD)])
BB=reshape(BB,[1,numel(BB)])

for b = background
    SS=[SS,std(DD./(BB-b))./mean(DD./(BB-b))];
end
plot(SS)
  