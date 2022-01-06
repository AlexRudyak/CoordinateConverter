
% paste latitude and longitude values from google maps
mapsPaste = [31.842321, 34.968936]; 

latInDD = mapsPaste(1);
lonInDD = mapsPaste(2);

[coordinatesInDMM, coordinatesInDMS] = convertFromDD (latInDD,lonInDD);
disp(['Your LLA coordinates in DD:  ' , num2str(latInDD),' ', num2str(lonInDD)]);
disp(['Your LLA coordinates in DMM: ' coordinatesInDMM]);
disp(['Your LLA coordinates in DMS: ' coordinatesInDMS]);

function [coordDMM, coordDMS] = convertFromDD (latDD, lonDD)
    % check if the degrees are positive or negetive and get the degree
    % value
    if latDD > 0 latDeg = floor(latDD); else latDeg = ceil(latDD); end 
    if lonDD > 0 lonDeg = floor(lonDD); else lonDeg = ceil(latDD); end
    % subtract the degree value from the lat/lon value and multiply by 60
    % to get the minute value - used in DMM and DMS
    latMin = abs((latDD-latDeg)*60);
    lonMin = abs((lonDD-lonDeg)*60);
    % subtract the abs minute value from the decimal minute value to get
    % the value that represents seconds - used in DMS
    latSec = (latMin - floor(latMin))*60;
    lonSec = (lonMin - floor(lonMin))*60;
    % check to see the direction of the degrees, whether it's positive or
    % negetive and change the sign accordingly
    if latDD > 0 latDir = 'N'; else latDir = 'S'; end
    if lonDD > 0 lonDir = 'E'; else lonDir = 'W'; end
    % concatenate the different values to form the required coordinates
    latDMM = [num2str(abs(latDeg)), char(176), num2str(latMin),' ', latDir];
    lonDMM = [num2str(abs(lonDeg)), char(176), num2str(lonMin),' ', lonDir];
    latDMS = [num2str(abs(latDeg)), char(176), num2str(floor(latMin)), ...
        char(39), num2str(latSec), char(34), ' ', latDir];
    lonDMS = [num2str(abs(lonDeg)), char(176), num2str(floor(lonMin)), ...
        char(39), num2str(lonSec), char(34), ' ', lonDir];
    coordDMM = [latDMM, '  ', lonDMM];
    coordDMS = [latDMS,'  ',lonDMS];
end