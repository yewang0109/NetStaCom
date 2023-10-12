%This file generates theoretical predictions for stability criteria
%in set structured ecosystems with different interaction types

%This file can be used to generate Fig.2e

clear; clc;
close all;

c=0.5;%connectivity
num_set=50;%the number of sets
aver_num_set=6;%the number of sets each species belongs to
sigma=0.05; 
d=1;
T=50;

[sta_set_rand,sta_un_rand,sta_theory_rand]=stability_comparison_random(c,num_set,aver_num_set,sigma,d,T);

[sta_set_mutua,sta_un_mutua,sta_theory_mutua]=stability_comparison_mutualistic(c,num_set,aver_num_set,sigma,d,T);

[sta_set_explo,sta_un_explo,sta_theory_explo]=stability_comparison_exploitive(c,num_set,aver_num_set,sigma,d,T);

[sta_set_com,sta_un_com,sta_theory_com]=stability_comparison_competitive(c,num_set,aver_num_set,sigma,d,T);


plot(mean(sta_set_rand),'o','Color',[128,181,109]./255,'MarkerSize',6,'MarkerFaceColor',[128,181,109]./255)
hold on
plot(sta_theory_rand,'Color',[128,181,109]./255,'linewidth',1)
hold on

plot(mean(sta_set_explo),'^','Color',[219,109,104]./255,'MarkerSize',6,'MarkerFaceColor',[219,109,104]./255)
hold on
plot(sta_theory_explo,'Color',[219,109,104]./255,'linewidth',1)
hold on

plot(mean(sta_set_com),'d','Color',[239,159,83]./255,'MarkerSize',6,'MarkerFaceColor',[239,159,83]./255)
hold on
plot(sta_theory_com,'Color',[239,159,83]./255,'linewidth',1)
hold on

plot(mean(sta_set_mutua),'s','Color',[140,183,219]./255,'MarkerSize',6,'MarkerFaceColor',[140,183,219]./255)
hold on
plot(sta_theory_mutua,'Color',[140,183,219]./255,'linewidth',1)
legend('random','','+/-','','-/-','','+/+')

