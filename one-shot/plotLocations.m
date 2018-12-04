function p = plotLocations(locations, names, bins)
if (~isempty(locations))
    p = plot(locations,1:length(locations), '*');
    hold on;
    for i=1:length(locations)
        text(locations(i)+1, i, names(i))
    end
else
    p = 0;
    i = 0;
end
for b=[bins bins+1]
    line((b-0.5)*[1, 1],[0, i+1],'Color',[0 0 0 0.2+0.8*(b==bins(1)||b==bins(end)+1)]);
end
hold off;
margin = 10;
xlim([bins(1)-margin, bins(end)+margin]);
ylim([0, i+1]); title('Beach');
set(gca,'YTick',[]);xlabel('Location');set(gca,'Color',[248, 240, 164]./255);
end

