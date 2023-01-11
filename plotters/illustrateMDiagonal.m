% A = onesKdiag(10, 5);
% A = onesKdiag(100, 5);
% A = onesKdiag(10, 5);

A = randKdiag(10, 5);
A = cholDecompDiag(A, 5);
A = A ~= 0;

h = figure;

imagesc(A);

set(h,'Units','Inches');
pos = get(h,'Position');
set(h,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])
print(h,'mdiagDecomp.pdf','-dpdf','-r0')