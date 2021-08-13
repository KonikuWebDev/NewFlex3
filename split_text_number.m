function V=split_text_number(T)
V=[];
lasti=1;
for i=1:length(T)
  if strcmp(T(i),' ')
     V=[V,str2double(T(lasti:i-1))] ;
     lasti=i+1; 
  end
end
V=[V,str2double(T(lasti:end))] ;

end