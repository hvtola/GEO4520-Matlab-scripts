% Mean00_01(isnan(Mean00_01))=-273.15;
% Mean01_02(isnan(Mean01_02))=-273.15;
% Mean02_03(isnan(Mean02_03))=-273.15;
% Mean03_04(isnan(Mean03_04))=-273.15;
% Mean04_05(isnan(Mean04_05))=-273.15;
% Mean05_06(isnan(Mean05_06))=-273.15;
% Mean06_07(isnan(Mean06_07))=-273.15;
% Mean07_08(isnan(Mean07_08))=-273.15;
% Mean08_09(isnan(Mean08_09))=-273.15;
% Mean09_10(isnan(Mean09_10))=-273.15;
% Mean10_11(isnan(Mean10_11))=-273.15;
% Mean11_12(isnan(Mean11_12))=-273.15;
% Mean12_13(isnan(Mean12_13))=-273.15;
% Mean13_14(isnan(Mean13_14))=-273.15;
% Mean14_15(isnan(Mean14_15))=-273.15;
% 
% Average_Mean = [Mean00_01 + Mean01_02 + Mean02_03 + Mean03_04 + Mean04_05 + Mean05_06 + Mean06_07 + Mean07_08 + Mean08_09 + Mean09_10 + Mean10_11 + Mean11_12 + Mean12_13 + Mean13_14 + Mean14_15];
% 
% 
% allData = cat(15,Mean00_01,Mean01_02,Mean02_03,Mean03_04,Mean04_05,Mean05_06,Mean06_07,Mean07_08,Mean08_09,Mean09_10,Mean10_11,Mean11_12,Mean12_13,Mean13_14,Mean14_15);
% nanmean(allData,15);

% Plot
[long, lat] = sin2ll_MOD(1200,18,2);
worldmap([60 60.2],[10 10.5])
surfm(lat, long, mean)
colorbar
title(colorbar,'°C','FontSize',14);
title('Tyrifjorden', 'FontSize', 24);