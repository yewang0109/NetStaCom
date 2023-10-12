%This file generates a simulated comparison between
%the stability of set structured and corresponding unstructured ecosystems
% with an increasing number of species.

%This file can be used to generate Fig.2a-d

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


figure(1);
for i=1:11
    a=sta_set_rand;
    b=boxchart(i*ones(size(a(:,i))),a(:,i));
    b.BoxFaceColor = [47,85,151]./255;
    b.WhiskerLineColor = [47,85,151]./255;
    b.MarkerColor = [47,85,151]./255;
    hold on
    z=sta_un_rand;
    c=boxchart(i*ones(size(z(:,i))),z(:,i))
    c.BoxFaceColor = [197,90,17]./255;
    c.WhiskerLineColor =[197,90,17]./255;
    c.MarkerColor = [197,90,17]./255
    hold on
end
plot(mean(sta_set_rand),'Color',[47,85,151]./255)
hold on
plot(mean(sta_un_rand),'Color',[197,90,17]./255)


figure(2);
for i=1:11
    a=sta_set_mutua;
    b=boxchart(i*ones(size(a(:,i))),a(:,i));
    b.BoxFaceColor = [47,85,151]./255;
    b.WhiskerLineColor = [47,85,151]./255;
    b.MarkerColor = [47,85,151]./255;
    hold on
    z=sta_un_mutua;
    c=boxchart(i*ones(size(z(:,i))),z(:,i))
    c.BoxFaceColor = [197,90,17]./255;
    c.WhiskerLineColor =[197,90,17]./255;
    c.MarkerColor = [197,90,17]./255
    hold on
end
plot(mean(sta_set_mutua),'Color',[47,85,151]./255)
hold on
plot(mean(sta_un_mutua),'Color',[197,90,17]./255)


figure(3);
for i=1:11
    a=sta_set_explo;
    b=boxchart(i*ones(size(a(:,i))),a(:,i));
    b.BoxFaceColor = [47,85,151]./255;
    b.WhiskerLineColor = [47,85,151]./255;
    b.MarkerColor = [47,85,151]./255;
    hold on
    z=sta_un_explo;
    c=boxchart(i*ones(size(z(:,i))),z(:,i))
    c.BoxFaceColor = [197,90,17]./255;
    c.WhiskerLineColor =[197,90,17]./255;
    c.MarkerColor = [197,90,17]./255
    hold on
end
plot(mean(sta_set_explo),'Color',[47,85,151]./255)
hold on
plot(mean(sta_un_explo),'Color',[197,90,17]./255)


figure(4);
for i=1:11
    a=sta_set_com;
    b=boxchart(i*ones(size(a(:,i))),a(:,i));
    b.BoxFaceColor = [47,85,151]./255;
    b.WhiskerLineColor = [47,85,151]./255;
    b.MarkerColor = [47,85,151]./255;
    hold on
    z=sta_un_com;
    c=boxchart(i*ones(size(z(:,i))),z(:,i))
    c.BoxFaceColor = [197,90,17]./255;
    c.WhiskerLineColor =[197,90,17]./255;
    c.MarkerColor = [197,90,17]./255
    hold on
end
plot(mean(sta_set_com),'Color',[47,85,151]./255)
hold on
plot(mean(sta_un_com),'Color',[197,90,17]./255)


