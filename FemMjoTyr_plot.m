% Mjosa = [Mjosa2001; Mjosa2002; Mjosa2003; Mjosa2004; Mjosa2005; Mjosa2006; Mjosa2007; Mjosa2008; Mjosa2009; Mjosa2010; Mjosa2011; Mjosa2012; Mjosa2013; Mjosa2014; Mjosa2015];
% Mjosa = reshape(Mjosa, 365, 15);
% Mjosa_mean = mean(Mjosa, 2, 'omitnan');
% 
% Tyri = [Tyri2001, Tyri2002, Tyri2003, Tyri2004, Tyri2005, Tyri2006, Tyri2007, Tyri2008, Tyri2009, Tyri2010, Tyri2011, Tyri2012, Tyri2013, Tyri2014, Tyri2015];
% Tyri = reshape(Tyri, 365, 15);
% Tyri_mean = mean(Tyri, 2, 'omitnan');
% 
% Femunden = [Femunden2001, Femunden2002, Femunden2003, Femunden2004, Femunden2005, Femunden2006, Femunden2007, Femunden2008, Femunden2009, Femunden2010, Femunden2011, Femunden2012, Femunden2013, Femunden2014, Femunden2015];
% Femunden = reshape(Femunden, 365, 15);
% Femunden_mean = mean(Femunden, 2, 'omitnan');

Mjosa = [Mjosa00_01; Mjosa01_02; Mjosa02_03; Mjosa03_04; Mjosa04_05; Mjosa05_06; Mjosa06_07; Mjosa07_08; Mjosa08_09; Mjosa09_10; Mjosa10_11; Mjosa11_12; Mjosa12_13; Mjosa13_14; Mjosa14_15];
Mjosa = reshape(Mjosa, 196, 15);
Mjosa_mean = mean(Mjosa, 2, 'omitnan');

Tyri = [Tyri00_01;Tyri01_02;Tyri02_03;Tyri03_04;Tyri04_05;Tyri05_06;Tyri06_07;Tyri07_08;Tyri08_09;Tyri09_10;Tyri10_11;Tyri11_12;Tyri12_13;Tyri13_14;Tyri14_15];
Tyri = reshape(Tyri, 196, 15);
Tyri_mean = mean(Tyri, 2, 'omitnan');

Femunden = [Femunden00_01;Femunden01_02;Femunden02_03;Femunden03_04;Femunden04_05;Femunden05_06;Femunden06_07;Femunden07_08;Femunden08_09;Femunden09_10;Femunden10_11;Femunden11_12;Femunden12_13;Femunden13_14;Femunden14_15];
Femunden = reshape(Femunden, 196, 15);
Femunden_mean = mean(Femunden, 2, 'omitnan');