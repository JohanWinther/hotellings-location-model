function [locations,names] = GetPlayerLocations
sheetID = fileread('sheetID.txt');
sheet = GetGoogleSpreadsheet(sheetID);
names = flip(sheet(2:end,2)');
locations = flip(str2double(sheet(2:end,3)'));

[names, c, ~] = unique(names);
[locations, idx] = sort(locations(c));
names = names(idx);
end

