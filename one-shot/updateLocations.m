function updateLocations(p,t,locations)
    p.XData = locations;
    for i=1:numel(t)
        t{i}.Position(1) = locations(i)+1;
    end
end