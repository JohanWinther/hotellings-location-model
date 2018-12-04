function dummy = paintMap(matrix)

figure(1)
hold on

for i=1:size(matrix,1)
   for j=1:size(matrix,2)
       if(matrix(i,j) == 0)
           fill([j-1,j,j,j-1],[i-1,i-1,i,i],'w');      
       end
   end
end

dummy = 0;

end