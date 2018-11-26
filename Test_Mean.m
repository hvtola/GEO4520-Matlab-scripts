Femunden = [Femunden2001, Femunden2002, Femunden2003, Femunden2004, Femunden2005, Femunden2006, Femunden2007, Femunden2008, Femunden2009, Femunden2010, Femunden2011, Femunden2012, Femunden2013, Femunden2014, Femunden2015];

Profile = reshape(Femunden, 5475, 1);
Femunden_Mean = reshape(Femunden, 365, 15);

x_1 = 1:365;
x = reshape(x_1, 365, 1)
y = mean(Femunden, 2, 'omitnan')

%% getting values where y is valid (not NaN)
idxValid = ~isnan(y);
%% fitting
[p,S] = polyfit(x(idxValid),y(idxValid),5);

[y_fit,delta] = polyval(p,x,S);
plot(x,y, 'b.')
hold on
plot(x,y_fit,'r-')
plot(x,y_fit+2*delta,'m--',x,y_fit-2*delta,'m--')
refline(0, 0);
xlim([0, 365])
title('Polynomial^x Fit of Data with 95% Prediction Interval')
legend('Data','Best Fit','95% Prediction Interval')
grid on;

% nlinfit a*sin*period