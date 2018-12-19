function gridLines(width, height)
for w=1:length(width)
    xline(w-0.5);
end
for h=1:length(height)
    yline(h-0.5);
end
end