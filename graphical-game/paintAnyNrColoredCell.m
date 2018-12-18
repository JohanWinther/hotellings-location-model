function dummy = paintAnyNrColoredCell(playersAtCell,y,x,colors,playerpos,ymax)
figure(1)
hold on
nrCells = length(playersAtCell);

if(nrCells == 2)
   paintTwoColoredCell(min(playersAtCell),max(playersAtCell),x,y,playerpos,colors);
else
    for i = 0:nrCells-1
        fill([x-1,x,x,x-1],[y-1+i/nrCells,y-1+i/nrCells,y-1+(i+1)/nrCells,y-1+(i+1)/nrCells],colors(playersAtCell(i+1),:));
    end
end
txt = [num2str(ymax - y),',',num2str(x-1)]; 
text(x-0.7,y-0.2,txt);
dummy = 0;

end