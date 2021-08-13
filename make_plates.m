%dirname='artifact_removal'
%dirin='BAT_0122'
%dirout='HL2'
%[P1,S1]=DIRXML_2_TABLES(dirin);
%close all
%dirname='res_BAT3'
%dirname='res_BAT5'
plates=1:size(S1,1);
Y=[];
P=[];
for plate=plates
    %if   strcmp(S1(plate,1,1).platename,S2(plate,1,1).platename)
        for row=1:size(S1(plate,:,:),2)
            for col=1:size(S1(plate,:,:),3)
                row
                col
                if ~isempty(S1(plate,row,col).F)
                condition='AUC-';P(row,col,plate)=sum(S1(plate,row,col).F-S1(plate,row,col).F(1));
                
              %  condition='AUCCCNormal-';P(row,col,plate)=sum((S1(plate,row,col).F-S1(plate,row,col).F(1))./S2(plate,row,col).count);
                
              %  condition='AUCF0Normal-';P(row,col,plate)=sum((S1(plate,row,col).F-S1(plate,row,col).F(1))./(S1(plate,row,col).F(1)-15));
                
              %  condition='Peak-';P(row,col,plate)=max(S1(plate,row,col).F-S1(plate,row,col).F(1));
                
              %  condition='PeakCCNormal-';P(row,col,plate)=max((S1(plate,row,col).F-S1(plate,row,col).F(1))./S2(plate,row,col).count);
                
              %  condition='PeakF0Normal-';P(row,col,plate)=max((S1(plate,row,col).F-S1(plate,row,col).F(1))./S1(plate,row,col).F(1));
                
                
               %condition='Endpoint-';P(row,col,plate)=(S1(plate,row,col).F(end)-S1(plate,row,col).F(1));
                
             %   condition='EndpointCCNormal-';P(row,col,plate)=(S1(plate,row,col).F(end)-S1(plate,row,col).F(1))./S2(plate,row,col).count;
                
               %condition='EndpointF0Normal-';P(row,col,plate)=(mean(S1(plate,row,col).F(end-5:end))-mean(S1(plate,row,col).F(1:5)))./mean(S1(plate,row,col).F(1:5));
             %  F=S1(plate,row,col).F;
              % F=F(1:min(94,length(F)));
              % F0=mean(S1(plate,row,col).F(1:5));
              % Ff=mean(S1(plate,row,col).F(end-5:end));
              % [~,ind]=max(abs(F-F0));
             %  Fmax=F(ind);
               
              % condition='compensation-';P(row,col,plate)=((Ff-F0)./F0)*exp(-1*abs(Fmax-Ff)/abs(Fmax-F0));

             %  condition='PoststimNorm-';P(row,col,plate)=(S1(plate,row,col).F(end)-S1(plate,row,col).F(13))./S1(plate,row,col).F(13);

               %condition='CellCount-';%P(row,col,plate)=S2(plate,row,col).count;
                
                %condition='F0-';P(row,col,plate)=S1(plate,row,col).F(1); 
               %Y=[Y;F/F0-1];
                end
            end
        end
       % lemin=min(min(P(:,1,plate)));
      %  P(:,:,plate)=P(:,:,plate)-lemin;
       % lemax=max(max(P(:,1,plate)));
       % P(:,:,plate)=P(:,:,plate)/lemax;
        figure
        imagesc(P(:,:,plate),[-0.5,1])
        title([condition,S1(plate,1,1).platename])
       % saveas(gcf,[dirout,'/',dirin,condition,S1(plate,1,1).platename,'.png'])
       % csvwrite([dirout,'/',dirin,condition,S1(plate,1,1).platename,'.csv'],P(:,:,plate))  

   % end
end
%close all