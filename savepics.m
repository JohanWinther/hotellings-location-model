for s = 21:1:31
    p = 4;
icecream(p, s, 1);
axis equal;
saveas(gcf, [num2str(p),'-', num2str(s) '.png']);
end