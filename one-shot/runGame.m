%% Setup
clear all;
names = ["johwin", "gusfors", "eriksor","ekebba"];
locations = [50, 50, 50, 50];
[locations, idx] = sort(locations);
names = names(idx);

figure(1)
p = subplot(2,1,1)
h = histogram(locations,-0.5:100.5);
textYOffset = 0;
for i=1:length(locations)
    hold on;
    if (i > 1 && locations(i-1) == locations(i))
        textYOffset = textYOffset - 0.25;
    else
        textYOffset = 0;
    end
    text(locations(i),textYOffset-0.25,names(i))
    if (p.YLim(1) > textYOffset)
        p.YLim(1) = textYOffset;
    end
end
hold off;
xlim([-0.5 100.5]); p.YLim(2) = p.YLim(2)*2;

% Calculate points
points = calculatePoints(locations);
figure(1);
subplot(2,1,2)
stem(locations,points); xlim([-0.5 100.5])
%disp(locations' + ' = ' + points')
