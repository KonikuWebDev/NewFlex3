function [P,S2,Y]=DIRXML_2_TABLES(foldername)
Y=[];
indi=round(15/1.6); %singledose
indf=indi+round(60/1.6);

C=[];
dirname=['res_',foldername];
mkdir(dirname)
S2=[];

files = dir([foldername,'/*.xml']);

count=0;

P=zeros(8,12);
plate_nameliste={};
DATE={};

for file = files'
    
%this function converts each plate of an experiment into a table.
S=xml2struct([foldername,'/',file.name]);

k=length(S.Experiment.PlateSections);

for i=1:k
    if k==1
        A=S.Experiment(1).PlateSections(i);
    else
        A=S.Experiment(1).PlateSections{i};
    end
    
    if strcmp(A.PlateSection.Attributes.InstrumentInfo(1:4),'Flex')
    
    count=count+1;
    transfertime=A.PlateSection.InstrumentSettings.FluidicSettings.CompoundTransfers.TransferSettings.Attributes.TransferTime;
    transfertime=str2double(transfertime);
    timeinterval=A.PlateSection.InstrumentSettings.KineticSettings.KineticInterval.Text;
    timeinterval=str2double(timeinterval(1:end-5));
    name=A.PlateSection.Attributes.Name;
    name(name=='_')=[];
    name(name=='-')=[];
    name(name==' ')=[];
    name=upper(name);
    plate_nameliste{count}=name;
    XXX=A.PlateSection.TemperatureData.Text;
    TEMP=str2double(XXX(1:4)); %get temperature
    DATE{count}=A.PlateSection.Attributes.ReadTime;
    S2(count,1,1).platename=plate_nameliste{count};
    S2(count,1,1).npoints=0;
    n=length(A.PlateSection.Wavelengths.Wavelength.Wells.Well);
    hold on
    for j=1:n
        COL=str2num(A.PlateSection.Wavelengths.Wavelength.Wells.Well{j}.Attributes.Col);
        ROW=str2num(A.PlateSection.Wavelengths.Wavelength.Wells.Well{j}.Attributes.Row);
        NAME=A.PlateSection.Wavelengths.Wavelength.Wells.Well{j}.Attributes.Name;
        
        F=split_text_number(A.PlateSection.Wavelengths.Wavelength.Wells.Well{j}.RawData.Text);
        F(isnan(F))=350;
        T=split_text_number(A.PlateSection.Wavelengths.Wavelength.Wells.Well{j}.TimeData.Text);
        
        S2(count,ROW,COL).Well=NAME;
        S2(count,ROW,COL).F=F;
        S2(count,ROW,COL).T=T;
        S2(count,1,1).npoints=max(length(F),S2(count,1,1).npoints);
        S2(count,ROW,COL).platename=plate_nameliste{count};
        
        if (T(2)-T(1))<2 && T(end)>45%if time step too big discard data
            temp=find(T>transfertime);     
            indi=temp(1);
            
            %disp(['Index is ',num2str(indi)])
            %filter stim artifact
        
        dF=F(2:end)-F(1:end-1);
        
        m=mean(dF(1:indi)); %includes potential artifact, anormal value is only 1 or 2
        s=std(dF(1:indi));

        indices=find([0,abs(dF(1:indi))]>m+2*s); %find artifact position
        
        for kk=indices  
             dF(kk-1)=0;
        end
        
        F=cumsum([F(1),dF]);
        
        F=F-mean(F(1:indi-1));  
        
        plot(T,F)
       % Y=[Y;F];
        pause(0.01)  
        
        %P(ROW,COL,count)=max(F(indi+1:indf));
        P(ROW,COL,count)=(F(end));
        end

        
        
    end
    end
    
    
end
end

%P(:,7:end,3)=P(:,7:end,4);
%lemax=max(max(max(P)))
%lemin=min(min(min(P)))
plate_nameliste
%P=P-lemin;
%P=P/lemax;
%P(3:end,12,:)=0.45;

%for i=1:count
    %figure
   % colormap(fire)
  %  PP=P(:,:,i);

   % figure('Position',[0,0,150*size(PP,2),800])
  %  imagesc(PP,[lemin,lemax])
    
   % set(gca,'Position',[0.1 0.1 0.8 0.8])
    %imagesc(P(:,:,i),[lemin,lemax])
  %  hold on
    %addORnames(A)
  %  title([DATE{i},' ',plate_nameliste{i}],'interpreter','none');
  %  pause(0.1)
%    saveas(gcf,[dirname,'/','plate_',num2str(i),'_',replacechar(plate_nameliste{i},'/',' over '),'.png'])
  %  csvwrite([dirname,'/','plate_',num2str(i),'_',replacechar(plate_nameliste{i},'/',' over '),'.csv'],P(:,:,i))

%end
end
