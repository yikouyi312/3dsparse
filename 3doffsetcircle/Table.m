%3d  offsetcircle 
%modular
%alpha = 0.5*gamma
addpath('data');
dt= 0.05;
tfinal = 10;
tinitial = 0;
para = [0.1,0.05;1,0.5;10,5;20,10;50,25;100,50];
average = zeros(1, size(para,1));
gammaset = zeros(1, size(para,1));
alphaset = zeros(1, size(para,1));
last = zeros(1, size(para,1));
for j = 1:size(para,1)
    gamma = para(j,1); alpha = para(j,2);
    a1=load(['modularoffsetcirclelagdivugamma=' num2str(gamma) 'alpha=' num2str(alpha)]);
    average(j)= mean(a1.^2);
    gammaset(j)=gamma;
    alphaset(j)=alpha;
    last(j)=a1(size(a1,1));
end
rate = zeros(1, size(para,1));
for i = 2:size(para,1)
    rate(i) = log(average(i-1)/average(i))/log(gammaset(i-1)/gammaset(i));
end
rate1 = zeros(1, size(para,1));
for i = 2:size(para,1)
    rate1(i) = log(last(i-1)/last(i))/log(gammaset(i-1)/gammaset(i));
end
T=table(gammaset',average',rate',last',rate1','VariableNames',{'\gamma',...
    '$average$','Convergent rate','last','rate1'});
disp(T);

