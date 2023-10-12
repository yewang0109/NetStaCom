%This file generates the confirmation of our simple criteria
%to enhance stability in set strutucted ecosystems

%This file can be used to generate Fig.3 
% by varying the parameter s and interaction types

clear; clc;
close all;

c=0.5;%connectivity
aver_num_set=6;%the number of sets each species belongs to
sigma=0.05; 
d=1;
T=50;
s=200;

delta_ran=rule_confirmation_random(c,s,aver_num_set,sigma,d,T);

delta_mutua=rule_confirmation_mutualistic(c,s,aver_num_set,sigma,d,T);

delta_explo=rule_confirmation_exploitive(c,s,aver_num_set,sigma,d,T);

delta_com=rule_confirmation_competitive(c,s,aver_num_set,sigma,d,T);


figure(1);
fill([2 2 108 108],[0 0.36 0.36 0],[255,255,255]./255)
hold on
fill([2 2 108 108],[0 -0.56 -0.56 0],[218,212,203]./255)
hold on
plot(10:10:100,delta_ran(:,end:-1:1),'o-','linewidth',1.5,'Color',[128,181,109]./255,'MarkerSize',4.5,'MarkerFaceColor',[128,181,109]./255)
hold on
plot(74.*ones(1,length(-0.56:0.1:0.36)),-0.56:0.1:0.36);
ylim([-0.56 0.36])
set(gca,'ytick',0,'Fontsize',8,'Fontname', 'Arial');
xlim([2 108])
set(gca,'xtick',[10 42 74 100],'Fontsize',8,'Fontname', 'Arial');
set(gca,'XTickLabel',{''},'Fontsize',8,'Fontname', 'Arial');


figure(2);
fill([2 2 108 108],[0 0.14 0.14 0],[255,255,255]./255)
hold on
fill([2 2 108 108],[0 -0.22 -0.22 0],[218,212,203]./255)
hold on
plot(10:10:100,delta_explo(:,end:-1:1),'^-','linewidth',1.5,'Color',[219,109,104]./255,'MarkerSize',4.5,'MarkerFaceColor',[219,109,104]./255)
hold on
plot(74.*ones(1,length(-0.22:0.01:0.14)),-0.22:0.01:0.14);
ylim([-0.22 0.14])
set(gca,'ytick',0,'Fontsize',8,'Fontname', 'Arial');
xlim([2 108])
set(gca,'xtick',[10 42 74 100],'Fontsize',8,'Fontname', 'Arial');
set(gca,'XTickLabel',{''},'Fontsize',8,'Fontname', 'Arial');


figure(3);
fill([2 2 108 108],[0 5.5 5.5 0],[255,255,255]./255)
hold on
fill([2 2 108 108],[0 -12.5 -12.5 0],[218,212,203]./255)
hold on
plot(10:10:100,delta_mutua(:,end:-1:1),'s-','linewidth',1.5,'Color',[140,183,219]./255,'MarkerSize',4.5,'MarkerFaceColor',[140,183,219]./255)
hold on
plot(74.*ones(1,length(-12.5:0.01:5.5)),-12.5:0.01:5.5);
ylim([-12.5 5.5])
set(gca,'ytick',0,'Fontsize',8,'Fontname', 'Arial');
xlim([2 108])
set(gca,'xtick',[10 42 74 100],'Fontsize',8,'Fontname', 'Arial');
set(gca,'XTickLabel',{''},'Fontsize',8,'Fontname', 'Arial');


figure(4)
fill([2 2 108 108],[0 0.33 0.33 0],[255,255,255]./255)
hold on
fill([2 2 108 108],[0 -0.83 -0.83 0],[218,212,203]./255)
hold on
plot(10:10:100,delta_com(:,end:-1:1),'d-','linewidth',1.5,'Color',[239,159,83]./255,'MarkerSize',4.5,'MarkerFaceColor',[239,159,83]./255)
hold on
plot(74.*ones(1,length(-0.83:0.01:0.33)),-0.83:0.01:0.33);
ylim([-0.83 0.33])
set(gca,'ytick',0,'Fontsize',8,'Fontname', 'Arial');
xlim([2 108])
set(gca,'xtick',[10 42 74 100],'Fontsize',8,'Fontname', 'Arial');
set(gca,'XTickLabel',{''},'Fontsize',8,'Fontname', 'Arial');
