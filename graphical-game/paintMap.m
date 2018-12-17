function dummy = paintMap(matrix,colors,playerpos)
figure(1)
hold on

playersHere = zeros(size(matrix,1),size(matrix,2),size(matrix,3));
for i =1:size(matrix,1)
    for j =1:size(matrix,2)
        for k = 1:size(matrix,3)
            if(matrix(i,j,k) ~= 0)
                playersHere(i,j,k) = k;
            end
        end
    end
end


for i=1:size(matrix,1)
   for j=1:size(matrix,2)
       if(matrix(i,j,:) == 0)
           fill([j-1,j,j,j-1],[i-1,i-1,i,i],'w');
       else
           paintAnyNrColoredCell(nonzeros(playersHere(i,j,:))',i,j,colors,playerpos); % plot all cells in apropriet color
       end
          %txt = ['[' , num2str(j) , ',' , num2str(i) , ']'];
          txt = [num2str(j-1),',',num2str(size(matrix,1)-i)]; 
          text(j-0.7,i-0.1,txt);
   end
end

for i = 1:length(playerpos)
    if(playerpos(i,1) ~= 0 && playerpos(i,2) ~= 0)
        plot(playerpos(i,1)-0.5,playerpos(i,2)-0.5,'w*');
    end
end



dummy = 0;

end