bins = 0:100;
points = zeros(1,numel(bins));
calculatePoints([0 1 75 75],bins)
calculatePoints([0 2 75 75],bins)
for i=1:length(bins)
tempPoints = calculatePoints([0 bins(i) 50 50], bins);
points(i) = tempPoints(2);
end
plot(bins, points)