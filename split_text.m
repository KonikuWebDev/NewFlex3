function L=split_text(T,SEP)
%SEP is separator
L=[];
lasti=1;
count=1;
for i=1:length(T)
  if strcmp(T(i),SEP)
     L{count}=T(lasti:i-1);
     count=count+1;
     lasti=i+1; 
  end
end
 L{count}=T(lasti:end);

end