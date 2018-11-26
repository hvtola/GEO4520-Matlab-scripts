y = Tyri_mean;
% y = reshape(z, 365, 1);
values = -60:1:135;
x = reshape(values, 196, 1);

%% getting indices where y is valid (not NaN)
idxValid = ~isnan(y);
%% fitting
[p,S] = polyfit(x(idxValid),y(idxValid),2);

[y_fit,delta] = polyval(p,x,S);
plot(x,y, 'k+')
hold on
plot(x,y_fit,'k-')
% plot(x,y_fit+2*delta,'g--',x,y_fit-2*delta,'g--')
% refline(0, 0);
% xlim([0, 135])
% ylim([150, 200])
title('Mean LST (2000-2015)')
xlabel('Days from 1^t^h of January', 'FontSize', 24)
ylabel('°C', 'FontSize', 24);
grid on;