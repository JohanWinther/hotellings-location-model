clf;%clear;
width = 1:11;
height = 1:11;

players = 4;
imagesc(width, height, ones(length(height),length(width)));

scoreText = @(x) sprintf('%.2f, ' , x);
%player_scores = cell(length(height), length(width));

if isfile(['optimal_place', num2str(players),'.mat'])
    disp('File exists.')
    fileExists = 1;
    %load(['optimal_place',num2str(players)],'player_scores');
else
    fileExists = 0;
end
for h = 1:length(height)
    for w = 1:length(width)
        disp([w,h])
        %if ((width(w)*height(h))^players > 10^6 || width(w)>height(h))
        if width(w)>height(h)
            scoreStr = '';
        else
            if ~fileExists
                player_scores{h,w} = cellfun(@extract, icecream_scores(players, width(w), height(h)));
                player_scores{h,w} = player_scores{h,w}/sum(player_scores{h,w});
            end
            scoreStr = scoreText(player_scores{h,w});
        end
        text(width(w)-0.45,height(h),scoreStr(1:end-2),'FontSize',6);
    end
end

%save(['optimal_place', num2str(players)],'player_scores');
zlim([0 1]); caxis([0 1]); set(gca, 'XTick', width); set(gca, 'YTick', height);
xlabel('Board width');ylabel('Board height'); title([num2str(players),' players']); set(gca,'XAxisLocation','top');
gridLines(width,height);