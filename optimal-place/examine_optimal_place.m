clf;
width = 13:13;
height = 1:1;

players = 3;
imagesc(width, height, ones(length(height),length(width)));

scoreText = @(x) sprintf('%.2f, ' , x);

if false && isfile(['optimal_place', num2str(players),'.mat'])
    disp('File exists.');
    load(['optimal_place' num2str(players)],'order_scores','player_scores');
else
    disp('File does not exist.');
    player_scores = cell(length(height), length(width));
    for h = 1:length(height)
        for w = 1:length(width)
            player_scores{h,w} = cellfun(@extract, icecream_scores(players, width(w), height(h)));
            scoreStr = scoreText(player_scores{h,w});
            text(width(w)-0.45,height(h),scoreStr(1:end-2));
        end
    end
%     hold off;
    %playersVec = 1:players;
    %best_player = @(x) playersVec(x==max(x));
    %order_score = @(x) x/norm(x)*(0:length(x)-1)'/(length(x)-1);
    %order_scores = cellfun(order_score, player_scores);
    %best_players = cellfun(best_player, player_scores);
    %save(['optimal_place', num2str(players)],'order_scores','player_scores');
end
zlim([0 1]); caxis([0 1]); set(gca, 'XTick', width); set(gca, 'YTick', height);
xlabel('Board width');ylabel('Board height'); title([num2str(players),' players']); set(gca,'XAxisLocation','top');
gridLines(width,height);