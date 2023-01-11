h = figure;

x = sizes;
y1 = times(:, 1); % linsolve
y2 = times(:, 2); % B / A
y3 = times(:, 3); % B * inv(A)
y4 = times(:, 4); % solveByChol

title("Time difference between different methods of solving linear equations");
xlabel("Size of the input matrix. (diagonal size) [logarthmic scale]");
ylabel("Execution time (in seconds)")

hold on;

set(gca, 'XScale', 'log')
plot(x, y1, "r--", DisplayName="linsolve()");
plot(x, y2, "g--", DisplayName="B / A");
plot(x, y3, "b--", DisplayName="B * inv(A)");
plot(x, y4, "c--", DisplayName="solveByChol()");

hold off;
legend("show");

set(h,'Units','Inches');
pos = get(h,'Position');
set(h,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])
print(h,'speedSolve.pdf','-dpdf','-r0')