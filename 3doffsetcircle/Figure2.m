%3d  offsetcircle 
%modular
addpath('data');
figure('DefaultAxesFontSize',15, 'DefaultLineLineWidth', 1)
dt= 0.05;
tfinal = 10;
tinitial = 0;
para = [0,0;1,0.5];
Markers = {'+','o','*','x','v','d','^','s','>','<'};
figure(1)
n = (tfinal-tinitial)/dt;
t = linspace(tinitial, tfinal, n+1);
subplot(2,2,1)
for j = 1:size(para,1)
    hold on 
    gamma = para(j,1); alpha = para(j,2);
    MarkerIndices = 1:10:n+1;
    a1=load(['modularoffsetcirclelagdivugamma=' num2str(gamma) 'alpha=' num2str(alpha)]);
    plot(t, a1,strcat(':k',Markers{j}),'MarkerIndices',MarkerIndices);
end
xlabel('t','FontSize',15,'FontWeight','bold')
ylabel('||\nabla\cdot u||','FontSize',15,'FontWeight','bold')
legend('No sparse grad-div','\gamma = 1, \alpha = 0.5')
legend('Location','northwest')
legend('NumColumns',1)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
para = [0,0;1,0];
%para = [0,0;1,0.5;10,5;20,10;50,25;];
Markers = {'+','o','*','x','v','d','^','s','>','<'};
subplot(2,2,2)
for j = 1:size(para,1)
    hold on 
    gamma = para(j,1); alpha = para(j,2);
    MarkerIndices = 1:10:n+1;
    a1=load(['modularoffsetcirclelagdivugamma=' num2str(gamma) 'alpha=' num2str(alpha)]);
    plot(t, a1,strcat(':k',Markers{j}),'MarkerIndices',MarkerIndices);
end
xlabel('t','FontSize',15,'FontWeight','bold')
ylabel('||\nabla\cdot u||','FontSize',15,'FontWeight','bold')
legend('No sparse grad-div','\gamma = 1, \alpha = 0')
legend('Location','northwest')
legend('NumColumns',1)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
para = [0,0;1,0.5];
Markers = {'+','o','*','x','v','d','^','s','>','<'};
subplot(2,2,3)
for j = 1:size(para,1)
    hold on 
    gamma = para(j,1); alpha = para(j,2);
   MarkerIndices = 1:10:n+1;
    a1=load(['modularoffsetcirclelagugamma=' num2str(gamma) 'alpha=' num2str(alpha)]);
    plot(t, a1,strcat(':k',Markers{j}),'MarkerIndices',MarkerIndices);
end
xlabel('t','FontSize',12,'FontWeight','bold')
ylabel('Energy','FontSize',12,'FontWeight','bold')
legend('No sparse grad-div','\gamma = 1, \alpha = 0.5')
legend('Location','northwest')
legend('NumColumns',1)
%%%%%%%%%%%%%%%%%%%%%%%%%%
para = [0,0;1,0];
Markers = {'+','o','*','x','v','d','^','s','>','<'};
subplot(2,2,4)
for j = 1:size(para,1)
    hold on 
    gamma = para(j,1); alpha = para(j,2);
   MarkerIndices = 1:10:n+1;
    a1=load(['modularoffsetcirclelagugamma=' num2str(gamma) 'alpha=' num2str(alpha)]);
    plot(t, a1,strcat(':k',Markers{j}),'MarkerIndices',MarkerIndices);
end
xlabel('t','FontSize',12,'FontWeight','bold')
ylabel('Energy','FontSize',12,'FontWeight','bold')
legend('No sparse grad-div','\gamma = 1, \alpha = 0')
legend('Location','northwest')
legend('NumColumns',1)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

set(gcf,'defaultLineLineWidth',1)
set(gcf, 'PaperUnits', 'inches');
x_width=10 ;y_width=5;
set(gcf, 'PaperPosition', [0 0 x_width y_width]); %
filename = ['fig2.jpg'];
saveas(gcf,filename)

