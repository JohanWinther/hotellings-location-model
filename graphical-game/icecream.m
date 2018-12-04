%%
clear
clc
nrPlayers = 10;%cannot be changed right now due to nr colors
nrRounds = 1;
height = 1;
width = 30;
colors = [[0 1 0]; [0 0 1]; [0 1 1]; [1 0 0];[1,1,0];[1,0,1];[0.7529,0.7529,0.7529];[0.5,0,0];[0.5,0.5,0];[0,0.5,0];[0.5,0,0.5];[0,0.5,0.5];[0,0,0.5];[102,205,170]/255;[188,143,143]/255;[210,105,30]/255;[245,222,179]/255;[255,192,203]/255;[105,105,105]/255;[85,107,47]/255;[221,160,221]/255;[139,69,19]/255;[112,128,144]/255;[255,165,0]/255;[255,215,0]/255;[220,20,60]/255];
starMatrix = zeros(height,width);

for i=1:nrPlayers
    paintCell(i,1,1,colors); % to have right color for legend
end


paintMap(starMatrix);
playerpos = zeros(nrPlayers,2);
scores = zeros(height,width,nrPlayers);
actions = 0;
while(actions ~= nrPlayers*nrRounds)
    if(actions >= nrPlayers)
        starMatrix(playerpos(mod(actions,nrPlayers)+1,2),playerpos(mod(actions,nrPlayers)+1,1)) = starMatrix(playerpos(mod(actions,nrPlayers)+1,2),playerpos(mod(actions,nrPlayers)+1,1)) - 1;
    end
    [x,y] = ginput(1);
    x = floor(x+1);
    y = floor(y+1);
    starMatrix(y,x) = starMatrix(y,x)+1;
    playerpos(mod(actions,nrPlayers)+1,1) = x;
    playerpos(mod(actions,nrPlayers)+1,2) = y;
    
   for i=1:size(starMatrix,1)
       for j=1:size(starMatrix,2) %two loops to color all cells in the matrix correctly
            minimalDistance = 10^5; % just a large number
            
            % For all players it tests what color this particular square should be
            for k = 1:nrPlayers 
               if(playerpos(k,1) ~= 0 && distance(j,i,playerpos(k,1),playerpos(k,2)) < minimalDistance)
                    minimalDistance = distance(j,i,playerpos(k,1),playerpos(k,2));
               end
            end
                    
            % This logic should be moved above all since it should print
            % for cases where sellers = 1 or sellers > 2
            playersHere = zeros(nrPlayers,1);
            for k = 1:nrPlayers
               if(playerpos(k,1) ~= 0)
                   % Dont want to consider distances from the an unspecified seller
                   if(distance(j,i,playerpos(k,1),playerpos(k,2)) == minimalDistance)
                       playersHere(k) = k; %% save in a vector all seller which has the minimum distance to a cell
                   end
               end
            end
            paintAnyNrColoredCell(nonzeros(playersHere)',i,j,colors,playerpos); % plot all cells in apropriet color
            
            for k = 1:min(nrPlayers,actions+1)
                if(playersHere(k) ~= 0)
                    scores(i,j,playersHere(k)) = 1/length(nonzeros(playersHere));
                else
                    scores(i,j,k) = 0;
                end
            end
            
            if(starMatrix(i,j) > 0)
                plot(j-0.5,i-0.5,'w*');
            end
            
       end
   end
   actions = actions +1;
end


for i = 1:nrPlayers
   stringForLegend{i} = ['P' num2str(i) '=' num2str(sum(sum(scores(:,:,i))))];
end

%Perfect. The 'AutoUpdate','off' option is what I was looking for.

legend(stringForLegend(:));




