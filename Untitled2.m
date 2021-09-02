set(gca, 'Xticklabel',{'A-200ng/mL','M-200ng/ml','KN1','KN2','KN3','KN4','KN5','KN6','KN7','KN8','KN9','KN10'})
set(gca, 'Yticklabel',{'1/2','1/4','1/8','1/16','1/32','1/64','1/128','1/256'})
xlabel('Sample')
ylabel('Dilution')
set(gca, 'Xtick',[1:12])

set(gca, 'XScale', 'log')