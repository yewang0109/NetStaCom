%This file generates data in heterogeneous ecosystems 
% with competitive interactions

%This file can be used to generate Fig. 5 
%by varying interaction types

%This file can be used to generate Fig. 6
%by varying population structures and the parameter d

clear; clc;
close all;
aver_num_set=6;
T=50;
c=0.5;
stability_1=zeros(T,length(100:200:3000));
stability_2=zeros(T,length(100:200:3000));
kk=1;
s=200;
for num_set=10:10:100
    sta1=0;
    sta2=0;
    for t=1:T
        sigma=0.05;
        H_set=zeros(s,num_set);
        for i=1:s
            H_set(i,randperm(num_set,aver_num_set))=1;
        end
        M=zeros(s,s);
        Mu=zeros(s,s);
        cont1=0;
        for k=1:num_set
            neigh=[];
            for i=1:s
                if H_set(i,k)==1
                    neigh=[neigh i];
                end
            end
            seed =[0 1 0 0 1;1 0 0 1 0;0 0 0 1 0;0 1 1 0 0;1 0 0 0 0];
            Net = SFNG(length(neigh), 2, seed);
            Gb=full(Net);
            Gb1=double(Gb);
            neigh=neigh(randperm(length(neigh)));
            for i=1:length(neigh)
                for j=i:length(neigh)
                    if i~=j && Gb1(i,j)==1
                        cont1=cont1+2;
                        M(neigh(i),neigh(j))=M(neigh(i),neigh(j))-abs(normrnd(0,sigma));
                        M(neigh(j),neigh(i))=M(neigh(j),neigh(i))-abs(normrnd(0,sigma));
                    end
                end
            end
        end
        deg=round(cont1/(2*s));
        seed=zeros(deg);
        for i=1:deg
            j=unidrnd(deg);
            seed(i,j)=1;
            seed(j,i)=1;
            for j=i:deg
                if rand()<0.5 && i~=j
                    seed(i,j)=1;
                    seed(j,i)=1;
                end
            end
        end
        seed=full(seed);
        Net = SFNG(s, deg, seed);
        Gb=full(Net);
        Gb=double(Gb);
        for i=1:s
            for j=i:s
                if i~=j && Gb(i,j)==1
                    Mu(i,j)=-abs(normrnd(0,sigma));
                    Mu(j,i)=-abs(normrnd(0,sigma));
                end
            end
        end
        for i=1:s
            M(i,i)=-1;
            Mu(i,i)=-1;
        end
        [V,D]=eig(M);
        [Vu,Du]=eig(Mu);
        stability_1(t,kk)=-max(real(diag(D)));
        stability_2(t,kk)=-max(real(diag(Du)));
    end
    kk=kk+1;
end
heter_delta_com=stability_1-stability_2;




