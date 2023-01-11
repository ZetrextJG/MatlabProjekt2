h = figure;

x = sizes(1:11);
y1 = times(1:11, 1); % inv()
y2 = times(1:11, 2); % solveByChol()

title("Time difference between different methods of calculating matrix inverse");
xlabel("Size of the input matrix. (diagonal size) [logarthmic scale]");
ylabel("Execution time (in seconds)")

hold on;

set(gca, 'XScale', 'log')
plot(x, y1, "r--", DisplayName="inv()");
plot(x, y2, "g--", DisplayName="solveByChol()");

hold off;
legend("show");

set(h,'Units','Inches');
pos = get(h,'Position');
set(h,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])
print(h,'speedInverse.pdf','-dpdf','-r0')