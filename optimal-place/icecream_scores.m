function utility = icecream_scores(nrPlayers,width,height)
% clear;
%clc;%clf;
% nrPlayers = 3; % can be a number between 1 and 26
nrRounds = 1;
% height = 5;
% width = 5;
%preRecordedActions = zeros(nrPlayers*nrRounds,2);

if( (width*height)^nrPlayers > 10^6)
    disp('Too large tree to calculate')
%     return
end

javaaddpath('C:\Users\johan\Google Drive\Chalmers\Kurser\ENM140 - Game Theory and Rationality\Projects\Game Theory Project\Javakod');
results = evalc('gameTree.Structure.main({num2str(width), num2str(height), num2str(nrPlayers)})');
results = splitlines(results);
newResults = zeros(length(results)-1,3);
for k = 1:length(results)-1
    newResults(k,:) = eval(results{k});
end
utility = eval(results{end});

colors = [[0 1 0]; [0 0 1]; [0 1 1]; [1 0 0];[1,1,0];[1,0,1];[0.7529,0.7529,0.7529];[0.5,0,0];[0.5,0.5,0];[0,0.5,0];[0.5,0,0.5];[0,0.5,0.5];[0,0,0.5];[102,205,170]/255;[188,143,143]/255;[210,105,30]/255;[245,222,179]/255;[255,192,203]/255;[105,105,105]/255;[85,107,47]/255;[221,160,221]/255;[139,69,19]/255;[112,128,144]/255;[255,165,0]/255;[255,215,0]/255;[220,20,60]/255];
starMatrix = zeros(height,width); % To print out stars to illustrate where the vendors are situated
valueOfSquare = ones(height,width);


for i=1:nrPlayers
    %paintCell(i,1,1,colors); % to have right color for legend
end
playerpos = zeros(nrPlayers,2);

scores = zeros(height,width,nrPlayers);
%paintMap(scores,colors,playerpos);
actions = 0;
%xlim([0 width]);
%ylim([0 height]);
%axis off;

%preRecordedActions(1:20,1) = unifrnd(0,width,1,20);
%preRecordedActions(1:20,2) = unifrnd(0,height,1,20);

preRecordedActions(1:nrPlayers,1:2) = newResults(1:nrPlayers,2:3);


% 
% if(preRecordedActions(:,:) ~= 0)
% else
%     throw(MException('noob'));
% end

% title('Hotelling´s location model');

while(actions ~= nrPlayers*nrRounds)
    if(actions >= nrPlayers)
        starMatrix(playerpos(mod(actions,nrPlayers)+1,2),playerpos(mod(actions,nrPlayers)+1,1)) = starMatrix(playerpos(mod(actions,nrPlayers)+1,2),playerpos(mod(actions,nrPlayers)+1,1)) - 1;
    end

    
%     to play the game
%     [x,y] = ginput(1);

%     to play a prerecorded set of actions
    x = preRecordedActions(actions+1,1);
    y = preRecordedActions(actions+1,2); 

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
            %if you want to play the game and have the cells update every
            %time. If you are only interested in the final map, then down
            %below
            
            
            for k = 1:min(nrPlayers,actions+1)
                if(playersHere(k) ~= 0)
                    scores(i,j,playersHere(k)) = valueOfSquare(i,j)/length(nonzeros(playersHere));
                else
                    scores(i,j,k) = 0;
                end
            end
%             
              %paintAnyNrColoredCell(nonzeros(playersHere)',i,j,colors,playerpos,height); % plot all cells in apropriet color
            
            if(starMatrix(i,j) > 0)
               % plot(j-0.5,i-0.5,'wo','MarkerSize',10,'MarkerFaceColor',[1 1 1]);
%                 text(j-0.6,i-0.5,'H');
            end
            
       end
   end
   actions = actions +1;
end

%paints an entire map based on the final outcome of the game
% paintMap(scores,colors,playerpos);

% for i = 1:nrPlayers
%    playerStrings{i} = ['P' num2str(i)]; %can load any string here
% end
% 
% for i = 1:nrPlayers
%    stringForLegend{i} = [playerStrings{i} '=' num2str(sum(sum(scores(:,:,i))))];
% end


%Perfect. The 'AutoUpdate','off' option is what I was looking for.

%legend(utility);
%disp(newResults);


