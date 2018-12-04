function dummy = paintAnyNrColoredCell(playersAtCell,y,x,colors,playerpos)
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

dummy = 0;

end