function dummy = paintCell(player,i,j,colors)

figure(1)
hold on

fill([j-1,j,j,j-1],[i-1,i-1,i,i],colors(player,:));


dummy = 0;

end