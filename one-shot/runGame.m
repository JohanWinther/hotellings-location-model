%% Setup
clear;clc;figure(2);clf;figure(1);clf;
bins = 0:100;
[locations, names] = GetPlayerLocations;

% Plot
figure(1)
plotLocations(locations, names, bins);

%% Calculate Points
points = calculatePoints(locations, bins);
[points, idx] = sort(points,'descend');
locationsSorted = locations(idx);
namesSorted = names(idx);

figure(2)
plotResults(points, namesSorted, locationsSorted);

disp('Scores:');
disp(namesSorted' + ": " + points');