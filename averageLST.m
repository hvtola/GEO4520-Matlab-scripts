startdate='01.01.2008';
enddate='31.12.2009';

path= 'H:\kurs\GEO\GEO4520\GEO4520_DATA\ModisLST\h18v02\';
tile='h18v02';

%run for Terra

satellite=0;  %Terra

%--------------------------------------------------------------
number_of_retrievals=0;
accumulated_sum=0;

for i=datenum(startdate, 'dd.mm.yyyy'):5:datenum(enddate, 'dd.mm.yyyy')
    
    fname=generateFileName(i, satellite, path, tile)
    if fname~=0    % file exists
        day=double(hdfread(fname, 'LST_Day_1km'))*0.02;   %read in the data in LST_Day_1km
        night=double(hdfread(fname, 'LST_Night_1km'))*0.02; %read in the data in LST_Night_1km
        
        accumulated_sum = accumulated_sum + day;
        number_of_retrievals = number_of_retrievals + double(day > 0);

        accumulated_sum = accumulated_sum + night;
        number_of_retrievals = number_of_retrievals + double(night > 0);
        
    end
end

average_LST = accumulated_sum ./ number_of_retrievals - 273.15;
