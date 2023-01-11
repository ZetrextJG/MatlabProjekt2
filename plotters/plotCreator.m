h = figure;

x = sizes;
y1 = times(:, 1);
y2 = times(:, 2);
y3 = times(1:9, 3);

title("Time difference between implemented, buildin and optimized.");
xlabel("Size of the input matrix. (diagonal size)");
ylabel("Execution time (in seconds)")
hold on;

plot(x, y1, "r--", DisplayName="chol()");
plot(x, y2, "g--", DisplayName="cholDecompDiag()");
plot(x(1, 1:9), y3, "b--", DisplayName="cholDecomp()");

hold off;
legend("show");

set(h,'Units','Inches');
pos = get(h,'Position');
set(h,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])
print(h,'speedC.pdf','-dpdf','-r0')