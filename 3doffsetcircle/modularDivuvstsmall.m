%3d  offsetcircle 
%modular
%for fix gamma 
addpath('data');
figure('DefaultAxesFontSize',15, 'DefaultLineLineWidth', 1)
dt= 0.05;
tfinal = 10;
tinitial = 0;
para = [0,0;1,0.3;1,0.4;1,0.48;1,0.49;1,0.5];
%para = [0,0;1,0.5;10,5;20,10;50,25;];
Markers = {'+','o','*','x','v','d','^','s','>','<'};
figure(1)
n = (tfinal-tinitial)/dt;
t = linspace(tinitial, tfinal, n+1);
subplot(2,1,1)
for j = 1:size(para,1)
    hold on 
    gamma = para(j,1); alpha = para(j,2);
    MarkerIndices = 4*j-1:size(para,1)*3:n+1;
    a1=load(['modularoffsetcirclelagdivugamma=' num2str(gamma) 'alpha=' num2str(alpha)]);
    plot(t, a1,strcat(':k',Markers{j}),'MarkerIndices',MarkerIndices);
end
xlabel('t','FontSize',15,'FontWeight','bold')
ylabel('||\nabla\cdot u||','FontSize',15,'FontWeight','bold')
legend('No sparse grad div', '\gamma = 1, \alpha =0.3',...
     '\gamma = 1, \alpha =0.4','\gamma = 1, \alpha =0.48',...
     '\gamma = 1, \alpha =49',...
    '\gamma = 1, \alpha =0.5')
% legend('No stabilize','\gamma = 1, \alpha =0.5',...
%     '\gamma = 10, \alpha =5','\gamma = 20, \alpha =10',...
%     '\gamma = 50, \alpha =25')
legend('Location','northwest')
legend('NumColumns',2)
ylim([0,1e5])

subplot(2,1,2)
for j = 1:size(para,1)
    hold on 
    gamma = para(j,1); alpha = para(j,2);
    MarkerIndices = 4*j-1:size(para,1)*3:n+1;
    a1=load(['modularoffsetcirclelagdivugamma=' num2str(gamma) 'alpha=' num2str(alpha)]);
    plot(t, a1,strcat(':k',Markers{j}),'MarkerIndices',MarkerIndices);
end
xlabel('t','FontSize',15,'FontWeight','bold')
ylabel('||\nabla\cdot u||','FontSize',15,'FontWeight','bold')
ylim([0,1])
set(gcf,'defaultLineLineWidth',1)
set(gcf, 'PaperUnits', 'inches');
x_width=7.25 ;y_width=6.125;
set(gcf, 'PaperPosition', [0 0 x_width y_width]); %
filename = ['modularDivuvst1.jpg'];
saveas(gcf,filename)

figure('DefaultAxesFontSize',15, 'DefaultLineLineWidth', 1)
figure(2)
n = (tfinal-tinitial)/dt;
t = linspace(tinitial, tfinal, n+1);
 subplot(2,1,1)
for j = 1:size(para,1)
    hold on 
    gamma = para(j,1); alpha = para(j,2);
  MarkerIndices = 4*j-1:size(para,1)*3:n+1;
    a1=load(['modularoffsetcirclelagugamma=' num2str(gamma) 'alpha=' num2str(alpha)]);
    plot(t, a1,strcat(':k',Markers{j}),'MarkerIndices',MarkerIndices);
end
xlabel('t','FontSize',12,'FontWeight','bold')
ylabel('Energy','FontSize',12,'FontWeight','bold')
legend('No sparse grad div', '\gamma = 1, \alpha =0.3',...
     '\gamma = 1, \alpha =0.4','\gamma = 1, \alpha =0.48',...
     '\gamma = 1, \alpha =49',...
    '\gamma = 1, \alpha =0.5')
% legend('No stabilize','\gamma = 1, \alpha =0.5',...
%     '\gamma = 10, \alpha =5','\gamma = 20, \alpha =10',...
%     '\gamma = 50, \alpha =25')
legend('Location','northwest')
legend('NumColumns',2)
ylim([0,1e5])


 subplot(2,1,2)
 for j = 1:size(para,1)
     hold on 
     gamma = para(j,1); alpha = para(j,2);
     MarkerIndices = 4*j-1:size(para,1)*3:n+1;
     a1=load(['modularoffsetcirclelagugamma=' num2str(gamma) 'alpha=' num2str(alpha)]);
    plot(t, a1,strcat(':k',Markers{j}),'MarkerIndices',MarkerIndices);
end
xlabel('t','FontSize',12,'FontWeight','bold')
ylabel('Energy','FontSize',12,'FontWeight','bold')
ylim([0,20])


set(gcf,'defaultLineLineWidth',1)
set(gcf, 'PaperUnits', 'inches');
x_width=7.25 ;y_width=6.125;
set(gcf, 'PaperPosition', [0 0 x_width y_width]); %
filename = ['modularuvst1.jpg'];
saveas(gcf,filename)