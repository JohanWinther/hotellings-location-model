function dummy = paintTwoColoredCell(player1,player2,x,y,playerpos,colors)
figure(1)
hold on
opening = ones(4,1);
if(playerpos(player2,1) < playerpos(player1,1))
    opening(2) = 0; opening(3) = 0;
end
if(playerpos(player2,1) > playerpos(player1,1))
    opening(1) = 0; opening(4) = 0;
end
if(playerpos(player2,2) < playerpos(player1,2))
    opening(3) = 0; opening(4) = 0;
end
if(playerpos(player2,2) > playerpos(player1,2))
    opening(1) = 0; opening(2) = 0;
end



if(opening(1) == 1)
    fill([x,x,x-1],[y-1,y,y],colors(player1,:));
    fill([x-1,x,x-1],[y-1,y-1,y],colors(player2,:));
elseif(opening(2) == 1)
    fill([x-1,x,x],[y-1,y-1,y],colors(player2,:));
    fill([x-1,x,x-1],[y-1,y,y],colors(player1,:));
elseif(opening(3) == 1)
    fill([x-1,x,x-1],[y-1,y-1,y],colors(player1,:));
    fill([x,x,x-1],[y-1,y,y],colors(player2,:));
elseif(opening(4) == 1)
    fill([x-1,x,x-1],[y-1,y,y],colors(player2,:));
    fill([x-1,x,x],[y-1,y-1,y],colors(player1,:));
else
    fill([x-1,x,x,x-1],[y-1,y-1,y-1/2,y-1/2],colors(1,:));
    fill([x-1,x,x,x-1],[y-1/2,y-1/2,y-1/2,y-1/2],colors(2,:)); 
end




dummy = 0;

end