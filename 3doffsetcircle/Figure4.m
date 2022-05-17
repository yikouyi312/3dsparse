%3d  offsetcircle 
%modular
%for fix gamma 
addpath('data');
figure('DefaultAxesFontSize',15, 'DefaultLineLineWidth', 1)
dt= 0.05;
tfinal = 10;
tinitial = 0;
para = [0,0;1,0.5;1,0.6;1,0.7;1,1;1,2;1,3];
Markers = {'+','o','*','x','v','d','^','s','>','<'};
figure(1)
n = (tfinal-tinitial)/dt;
t = linspace(tinitial, tfinal, n+1);
subplot(2,2,1)
for j = 1:size(para,1)
    hold on 
    gamma = para(j,1); alpha = para(j,2);
    MarkerIndices = 4*j-1:size(para,1)*5:n+1;
    a1=load(['modularoffsetcirclelagdivugamma=' num2str(gamma) 'alpha=' num2str(alpha)]);
    if (j <= 1)
         plot(t, a1,strcat('-k',Markers{j}),'MarkerIndices',MarkerIndices);
    else
         plot(t, a1,strcat(':k',Markers{j}),'MarkerIndices',MarkerIndices);
    end
end
xlabel('t','FontSize',15,'FontWeight','bold')
ylabel('||\nabla\cdot u||','FontSize',15,'FontWeight','bold')
hl=legend('No spase grad-div','\gamma = 1, \alpha =0.5',...
     '\gamma = 1, \alpha =0.6','\gamma = 1, \alpha =0.7',...
     '\gamma = 1, \alpha =1','\gamma = 1, \alpha =2',...
    '\gamma = 1, \alpha =3')
% legend('No stabilize','\gamma = 1, \alpha =0.5',...
%     '\gamma = 10, \alpha =5','\gamma = 20, \alpha =10',...
%     '\gamma = 50, \alpha =25')
legend('Location','northwest')
legend('NumColumns',1)

subplot(2,2,3)
for j = 1:size(para,1)
    hold on 
    gamma = para(j,1); alpha = para(j,2);
    MarkerIndices = 4*j-1:size(para,1)*5:n+1;
    a1=load(['modularoffsetcirclelagdivugamma=' num2str(gamma) 'alpha=' num2str(alpha)]);
    if (j <= 1)
         plot(t, a1,strcat('-k',Markers{j}),'MarkerIndices',MarkerIndices);
    else
         plot(t, a1,strcat(':k',Markers{j}),'MarkerIndices',MarkerIndices);
    end
end
xlabel('t','FontSize',15,'FontWeight','bold')
ylabel('||\nabla\cdot u||','FontSize',15,'FontWeight','bold')
ylim([0,0.3])

subplot(2,2,2)
for j = 1:size(para,1)
    hold on 
    gamma = para(j,1); alpha = para(j,2);
  MarkerIndices = 4*j-1:size(para,1)*5:n+1;
    a1=load(['modularoffsetcirclelagugamma=' num2str(gamma) 'alpha=' num2str(alpha)]);
    if (j <= 1)
         plot(t, a1,strcat('-k',Markers{j}),'MarkerIndices',MarkerIndices);
    else
         plot(t, a1,strcat(':k',Markers{j}),'MarkerIndices',MarkerIndices);
    end
end
xlabel('t','FontSize',12,'FontWeight','bold')
ylabel('Energy','FontSize',12,'FontWeight','bold')


xlabel('t','FontSize',12,'FontWeight','bold')
ylabel('Energy','FontSize',12,'FontWeight','bold')

newPosition = [0.6 0.2 0.2 0.2];
newUnits = 'normalized';
set(hl,'Position', newPosition,'Units', newUnits);



set(gcf,'defaultLineLineWidth',1)
set(gcf, 'PaperUnits', 'inches');
x_width=10.25 ;y_width=6.125;
set(gcf, 'PaperPosition', [0 0 x_width y_width]); %
filename = ['fig4.jpg'];
saveas(gcf,filename)