%% Setup
clf;clc;
players = 4;
bins = 0:100;
locations = randi(max(bins),1,players);
locations = [0 0 75 75];
names = "P"+(1:players);
[p,t] = plotLocations(locations, names, bins);

%% Run
roundLocations = zeros(1,players);
while ~all(roundLocations==locations)
    roundLocations = locations;
for i=1:players
    points = calculatePoints(locations, bins);
    newLocation = locations(i);
    newScore = points(i);
    for b=bins
        potentialLocations = locations;
        potentialLocations(i) = b;
        potentialScore = calculatePoints(potentialLocations, bins);
        if potentialScore(i) > newScore
            newScore = potentialScore(i);
            newLocation = b;
        end
    end
    locations(i) = newLocation;
    updateLocations(p,t,locations);
    pause(0.5)
end
end