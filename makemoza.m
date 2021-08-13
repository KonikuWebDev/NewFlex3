
rep='res_BAT_1_8_2021';
COMPOUNDS={'comp*PODBLUE*','comp*PODNM*','comp*MF30*'};
%COMPOUNDS={'End*NM100*','End*DC100*','End*MF30*'};

%COMPOUNDS={'Peak-*NM*','Peak-*DC*','Peak-*MF*'};
%COMPOUNDS={'EndpointF0Normal-*EPODNM*','EndpointF0Normal-*EPODBLUE*','EndpointF0Normal-*MF*'};
%COMPOUNDS={'EndpointF0Normal-*NM*','EndpointF0Normal-*DC*','EndpointF0Normal-*MF*'};
%COMPOUNDS={'*HL1*','*HL3*','*HL4*'};

%COMPOUNDS={'EpodBase','EpodNM','EpodNicoNM'};

nplicate=3;
X=[];
MOSA=[];
for j=1:length(COMPOUNDS)
list=dir([rep,'\*',COMPOUNDS{j},'*.png']);
X=[];
for i=1:length(list);
    temp=imread([rep,'/',list(i).name]);
    X=[X;temp(20:620,90:810,:)];
end
MOSA=[MOSA,X];

end

