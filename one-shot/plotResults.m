function p = plotResults(points,names, locations)
for i=1:length(names)
    names{i} = strcat(names{i},' (',num2str(locations(i)),')');
end
p = bar(categorical(names,names),points);
ylabel('Profit');
xlabel('Player (Location)');
title('Scores')
end

