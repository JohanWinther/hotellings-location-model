function points = calculatePoints(locations, bins)
[locations, idx] = sort(locations);
if ~isempty(locations)
    if ~issorted(locations)
        error('Input array is not sorted');
    end
    points = zeros(1,length(locations));
    for b = bins
        % Players in bin
        nbrOfPlayers = sum(locations == b);
        if (nbrOfPlayers > 0)
            points(locations==b) = points(locations==b) + 1/nbrOfPlayers;
            continue;
        end
        % No players in bin ->
        % Check players to the left and right
        nbrOfPlayersLeft = 0;
        distanceLeft = bins(end)+1;
        locsLeft = locations(locations < b);
        if (~isempty(locsLeft))
            distanceLeft = abs(locsLeft(end)-b);
            nbrOfPlayersLeft = sum(locsLeft==locsLeft(end));
        end
        
        nbrOfPlayersRight = 0;
        distanceRight = bins(end)+1;
        locsRight = locations(locations > b);
        if (~isempty(locsRight))
            distanceRight = abs(locsRight(1)-b);
            nbrOfPlayersRight = sum(locsRight==locsRight(1));
        end
        
        nbrOfPlayers = (distanceLeft<=distanceRight)*nbrOfPlayersLeft + (distanceLeft>=distanceRight)*nbrOfPlayersRight;
        if (nbrOfPlayers > 0)
            if (distanceLeft <= distanceRight)
                points(locations==locsLeft(end)) = points(locations==locsLeft(end)) + 1/nbrOfPlayers;
            end
            if (distanceLeft >= distanceRight)
                points(locations==locsRight(1)) = points(locations==locsRight(1)) + 1/nbrOfPlayers;
            end
            continue;
        end
    end
   points = points(idx);
else
    points = zeros(1,0);
end