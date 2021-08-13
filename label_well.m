draw_plate_layout

DD=ceil(ginput(2));
colrange=DD(1,1):DD(2,1);
rowrange=DD(1,2):DD(2,2);
lelabel=input('Enter Label : ');
for col=colrange
    for row=rowrange     
        PL(row,col).label='';
    end
end
for col=colrange
    for row=rowrange
        
        
        PL(row,col).label=lelabel;
    end
end

draw_plate_layout

