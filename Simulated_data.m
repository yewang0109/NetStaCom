% This file generates simulated data in Fig. 4e-f

clear; clc;
close all;
s=500;sigma=0.25;t_before_perturb=2;num_set=200;aver_num_set=2;c=0.25;d=1;
%%%%%%%%%%%%%%%%%%%%%%%%%%competitive
num_set_com=0;num_unstru_com=0;
for num_M=1:1000
    H_set=zeros(s,num_set);
    for i=1:s
        H_set(i,randperm(num_set,aver_num_set))=1;
    end
    M=zeros(s,s);
    Mu=zeros(s,s);
    for i=1:s
        for k=1:num_set
            if H_set(i,k)==1
                for j=i:s
                    if j~=i
                        if H_set(j,k)==1
                            cont=rand();
                            if cont<c
                                M(i,j)=M(i,j)-abs(normrnd(0,sigma));
                                M(j,i)=M(j,i)-abs(normrnd(0,sigma));
                            end
                        end
                    end
                end
            end
        end
    end

    for i=1:s
        for j=i:s
            if i~=j
                cont=rand();
                if cont<c
                    Mu(i,j)=-abs(normrnd(0,sigma));
                    Mu(j,i)=-abs(normrnd(0,sigma));
                end
            end
        end
    end
    for i=1:s
        M(i,i)=-d;
        Mu(i,i)=-d;
    end
    [V,D]=eig(M);
    [Vu,Du]=eig(Mu);
    if max(real(diag(D)))<0
        num_set_com=num_set_com+1;
    end
    if max(real(diag(Du)))<0
        num_unstru_com=num_unstru_com+1;
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%mutualistic
num_set_mutua=0;num_unstru_mutua=0;
for num_M=1:1000
    H_set=zeros(s,num_set);
    for i=1:s
        H_set(i,randperm(num_set,aver_num_set))=1;
    end
    M=zeros(s,s);
    Mu=zeros(s,s);
    for i=1:s
        for k=1:num_set
            if H_set(i,k)==1
                for j=i:s
                    if j~=i
                        if H_set(j,k)==1
                            cont=rand();
                            if cont<c
                                M(i,j)=M(i,j)+abs(normrnd(0,sigma));
                                M(j,i)=M(j,i)+abs(normrnd(0,sigma));
                            end
                        end
                    end
                end
            end
        end
    end

    for i=1:s
        for j=i:s
            if i~=j
                cont=rand();
                if cont<c
                    Mu(i,j)=abs(normrnd(0,sigma));
                    Mu(j,i)=abs(normrnd(0,sigma));
                end
            end
        end
    end
    for i=1:s
        M(i,i)=-d;
        Mu(i,i)=-d;
    end
    [V,D]=eig(M);
    [Vu,Du]=eig(Mu);
    if max(real(diag(D)))<0
        num_set_mutua=num_set_mutua+1;
    end
    if max(real(diag(Du)))<0
        num_unstru_mutua=num_unstru_mutua+1;
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%random
num_set_ran=0;num_unstru_ran=0;
for num_M=1:1000
    H_set=zeros(s,num_set);
    for i=1:s
        H_set(i,randperm(num_set,aver_num_set))=1;
    end
    M=zeros(s,s);
    Mu=zeros(s,s);
    for i=1:s
        for k=1:num_set
            if H_set(i,k)==1
                for j=i:s
                    if j~=i
                        if H_set(j,k)==1
                            cont=rand();
                            if cont<c
                                if num1(k)==1
                                    M(i,j)=M(i,j)+(normrnd(0,sigma));
                                    M(j,i)=M(j,i)+(normrnd(0,sigma));
                                end
                            end
                        end
                    end
                end
            end
        end
    end

    for i=1:s
        for j=i:s
            if i~=j
                cont=rand();
                if cont<c
                    Mu(i,j)=(normrnd(0,sigma));
                    Mu(j,i)=(normrnd(0,sigma));
                end
            end
        end
    end
    for i=1:s
        M(i,i)=-d;
        Mu(i,i)=-d;
    end
    [V,D]=eig(M);
    [Vu,Du]=eig(Mu);
    if max(real(diag(D)))<0
        num_set_ran=num_set_ran+1;
    end
    if max(real(diag(Du)))<0
        num_unstru_ran=num_unstru_ran+1;
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%exploitative
num_set_explo=0;num_unstru_explo=0;
for num_M=1:1000
    H_set=zeros(s,num_set);
    for i=1:s
        H_set(i,randperm(num_set,aver_num_set))=1;
    end
    M=zeros(s,s);
    Mu=zeros(s,s);
    for i=1:s
        for k=1:num_set
            if H_set(i,k)==1
                for j=i:s
                    if j~=i
                        if H_set(j,k)==1
                            cont=rand();
                            if cont<c
                                cont1=rand();
                                if cont1<0.5
                                    M(i,j)=M(i,j)+abs(normrnd(0,sigma));
                                    M(j,i)=M(j,i)-abs(normrnd(0,sigma));
                                else
                                    M(i,j)=M(i,j)-abs(normrnd(0,sigma));
                                    M(j,i)=M(j,i)+abs(normrnd(0,sigma));
                                end
                            end
                        end
                    end
                end
            end
        end
    end
    for i=1:s
        for j=i:s
            if i~=j
                cont=rand();
                if cont<c
                    cont1=rand();
                    if cont1<0.5
                        Mu(i,j)=abs(normrnd(0,sigma));
                        Mu(j,i)=-abs(normrnd(0,sigma));
                    else
                        Mu(i,j)=-abs(normrnd(0,sigma));
                        Mu(j,i)=abs(normrnd(0,sigma));
                    end

                end
            end
        end
    end
    for i=1:s
        M(i,i)=-d;
        Mu(i,i)=-d;
    end
    [V,D]=eig(M);
    [Vu,Du]=eig(Mu);
    if max(real(diag(D)))<0
        num_set_explo=num_set_explo+1;
    end
    if max(real(diag(Du)))<0
        num_unstru_explo=num_unstru_explo+1;
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure('unit','centimeters','position',[5 5 7.2 4]);
c2=[197,90,17]./255;
c1=[47,85,151]./255;
num_unstru_ran=1000;
b=bar([num_set_ran num_unstru_ran; num_set_explo num_unstru_explo;num_set_mutua num_unstru_mutua;num_set_com num_unstru_com],1,'EdgeColor','k')
b(1).FaceColor=c1;b(2).FaceColor=c2;
xtips1 = b(1).XEndPoints;
ytips1 = b(1).YEndPoints;
labels1 = string(b(1).YData);
xtips2 = b(2).XEndPoints;
ytips2 = b(2).YEndPoints;
labels2 = string(b(2).YData);
text(xtips2,ytips2,labels2,'HorizontalAlignment','center',...
    'VerticalAlignment','bottom','FontSize',7)
text(xtips1,ytips1,labels1,'HorizontalAlignment','center',...
    'VerticalAlignment','bottom','FontSize',7)
set(gca,'xticklabel',{'Random','+/-','+/+','-/-'},'FontSize',7);
set(gca,'ytick',[0:200:1000]);
set(gca,'yticklabel',{'0.0','0.2','0.4','0.6','0.8','1.0'},'FontSize',7);
ylim([0 1150]);

