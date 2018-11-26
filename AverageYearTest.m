clear all;

path = '/Users/hvtola/Desktop/MODIS/';
tile = 'h18v02';

start_year = 2001;
end_year = 2016;

for year = start_year:10:end_year
    start_date = datenum(start_year,1,1);
    end_date = datenum(end_year,12,31);

    accumulated_LST = zeros(1200,1200);
    number_of_LST = zeros(1200,1200);


    % To find matrix value, go here: https://landweb.modaps.eosdis.nasa.gov/cgi-bin/developer/tilemap.cgi
    target1 = [945 659]; %%%
    % Create an empty matrix
    results1_day =[]; %%%
    results1_night =[]; %%%

    target2 = [945 669]; %%%
    % Create an empty matrix
    results2_day =[]; %%%
    results2_night =[]; %%%

    for date = start_date:10:end_date
        fname = generateFileName(date, 0, path, tile);
        % If fname does exist, then calculate. The value 0 is equal to no file.
        if fname ~=0
            LST_Day_1km = hdfread(fname, '/MODIS_Grid_Daily_1km_LST/Data Fields/LST_Day_1km', 'Index', {[1  1],[1  1],[1200  1200]});
            LST_Night_1km = hdfread(fname, '/MODIS_Grid_Daily_1km_LST/Data Fields/LST_Night_1km', 'Index', {[1  1],[1  1],[1200  1200]});
            LST_Day_1km=double(LST_Day_1km).*0.02-273.15;
            LST_Night_1km=double(LST_Night_1km).*0.02-273.15;

            results1_day =[results1_day; LST_Day_1km(target1(1), target1(2))]; %%%
            results1_night =[results1_night; LST_Night_1km(target1(1), target1(2))]; %%%

            results2_day =[results2_day; LST_Day_1km(target2(1), target2(2))]; %%%
            results2_night =[results2_night; LST_Night_1km(target2(1), target2(2))]; %%%

            % LST_Day_1km(LST_Day_1km==-273.15) = NaN;
            % LST_Night_1km(LST_Night_1km==-273.15) = NaN;

            % double is used to define the value as a real number (not a logic array)
            accumulated_LST = accumulated_LST + double(LST_Day_1km~=-273.15).*LST_Day_1km;
            accumulated_LST = accumulated_LST + double(LST_Night_1km~=-273.15).*LST_Night_1km;

            % Number of days that do not have NaN;
            number_of_LST = number_of_LST + double(LST_Day_1km~=-273.15);
            number_of_LST = number_of_LST + double(LST_Night_1km~=-273.15);
        else %%%
            results1_day =[results1_day; NaN]; %%%
            results1_night =[results1_night; NaN]; %%%
            results2_day =[results2_day; NaN]; %%%
            results2_night =[results2_night; NaN]; %%%
        end
    end

    results1_day(results1_day==-273.15)=NaN;
    results1_night(results1_night==-273.15)=NaN;
    results1 = [results1_day, results1_night]
    Femunden = mean(results1, 2, 'omitnan')

    results2_day(results2_day==-273.15)=NaN;
    results2_night(results2_night==-273.15)=NaN;
    results2 = [results2_day, results2_night]
    RandomSpot = mean(results1, 2, 'omitnan')
    
    M = [];
    M = M + double(Femunden)
end
    
figure;
plot(M,'r.')
% hold on
% plot(RandomSpot,'b.')

% % Calculate the mean
% average_LST = accumulated_LST ./ number_of_LST;
% 
% % Plot
% [long, lat] = sin2ll_MOD(1200,18,2);
% worldmap([60 64],[4 15])
% surfm(lat, long, average_LST)
% colorbar
% 
% % Jostedalsbreen = [1000, 398]
% % Femunden = [945, 659]