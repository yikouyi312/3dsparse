%3d  offsetcircle 
%modular
%alpha = 0.5*gamma
addpath('data');
figure('DefaultAxesFontSize',15, 'DefaultLineLineWidth', 1)
dt= 0.05;
tfinal = 10;
tinitial = 0;
para = [0,0;0.1,0.05;1,0.5;10,5;20,10;50,25;100,50];
Markers = {'+','o','*','x','v','d','^','s','>','<'};
figure(1)
n = (tfinal-tinitial)/dt;
t = linspace(tinitial, tfinal, n+1);
subplot(2,2,1)
for j = 1:size(para,1)
    hold on 
    gamma = para(j,1); alpha = para(j,2);
    MarkerIndices = j:size(para,1)*3:n+1;
    a1=load(['modularoffsetcirclelagdivugamma=' num2str(gamma) 'alpha=' num2str(alpha)]);
    if (j <= 1)
         plot(t, a1,strcat('-k',Markers{j}),'MarkerIndices',MarkerIndices);
    else
         plot(t, a1,strcat(':k',Markers{j}),'MarkerIndices',MarkerIndices);
    end
end
xlabel('t','FontSize',15,'FontWeight','bold')
ylabel('||\nabla\cdot u||','FontSize',15,'FontWeight','bold')
legend('No sparse grad-div','\gamma = 0.1, \alpha =0.05','\gamma = 1, \alpha =0.5',...
    '\gamma = 10, \alpha =5','\gamma = 20, \alpha =10',...
    '\gamma = 50, \alpha =25','\gamma = 100, \alpha =50')
legend('Location','northwest')
legend('NumColumns',1)


subplot(2,2,3)
for j = 1:size(para,1)
    hold on 
    gamma = para(j,1); alpha = para(j,2);
    MarkerIndices = 4*j-1:size(para,1)*3:n+1;
    a1=load(['modularoffsetcirclelagdivugamma=' num2str(gamma) 'alpha=' num2str(alpha)]);
    if (j <= 1)
         plot(t, a1,strcat('-k',Markers{j}),'MarkerIndices',MarkerIndices);
    else
         plot(t, a1,strcat(':k',Markers{j}),'MarkerIndices',MarkerIndices);
    end
end
xlabel('t','FontSize',15,'FontWeight','bold')
ylabel('||\nabla\cdot u||','FontSize',15,'FontWeight','bold')
ylim([0,0.1])

 subplot(2,2,2)
for j = 1:size(para,1)
    hold on 
    gamma = para(j,1); alpha = para(j,2);
   MarkerIndices = j:size(para,1)*3:n+1;
    a1=load(['modularoffsetcirclelagugamma=' num2str(gamma) 'alpha=' num2str(alpha)]);
    if (j <= 1)
         plot(t, a1,strcat('-k',Markers{j}),'MarkerIndices',MarkerIndices);
    else
         plot(t, a1,strcat(':k',Markers{j}),'MarkerIndices',MarkerIndices);
    end
end
xlabel('t','FontSize',12,'FontWeight','bold')
ylabel('Energy','FontSize',12,'FontWeight','bold')
legend('No sparse grad-div','\gamma = 0.1, \alpha =0.05','\gamma = 1, \alpha =0.5',...
    '\gamma = 10, \alpha =5','\gamma = 20, \alpha =10',...
    '\gamma = 50, \alpha =25','\gamma = 100, \alpha =50')

legend('Location','northwest')
legend('NumColumns',1)


subplot(2,2,4)
for j = 1:size(para,1)
    hold on 
    gamma = para(j,1); alpha = para(j,2);
    MarkerIndices = 4*j-1:size(para,1)*3:n+1;
    a1=load(['modularoffsetcirclelagugamma=' num2str(gamma) 'alpha=' num2str(alpha)]);
    if (j <= 1)
         plot(t, a1,strcat('-k',Markers{j}),'MarkerIndices',MarkerIndices);
    else
         plot(t, a1,strcat(':k',Markers{j}),'MarkerIndices',MarkerIndices);
    end
end
xlabel('t','FontSize',12,'FontWeight','bold')
ylabel('Energy','FontSize',12,'FontWeight','bold')
ylim([0,5])


set(gcf,'defaultLineLineWidth',1)
set(gcf, 'PaperUnits', 'inches');
x_width=10.25 ;y_width=6.125;
set(gcf, 'PaperPosition', [0 0 x_width y_width]); %
filename = ['fig5.jpg'];
saveas(gcf,filename)
