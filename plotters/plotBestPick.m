h = figure;

heatmap(results, "Title", "Fastest method depending on input size");
xlabel("Number of rows in B (x10)");
ylabel("Number of columns in A (x10)")

colormap(jet(3)) ; 

ax = gca;
axs = struct(ax);
cbh = axs.Colorbar;

cbh.Ticks = [0.5 1.5 2.5] ; %Create 8 ticks from zero to 1
cbh.TickLabels = ["linspace", "A/B", "solveByChol"];

set(h,'Units','Inches');
pos = get(h,'Position');
set(h,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])
print(h,'solveBest.pdf','-dpdf','-r0')