% This file generates the response of a competitive set structured ecosystem
% to external perturbations

% This file can be used to generate the data in Fig. 4a-d by varying interaction types

clear; clc;
close all;

s=10;sigma=0.5;t_before_perturb=2;num_set=6;aver_num_set=2;c=0.25;d=1;
time_step=0.0001; time_end=16;
n_u1=0;
n_u2=0;
k_u1=0;
k_u2=0;
x1=[];
x2=[];
y1=[];
y2=[];
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
A=M;
A1=Mu;
X_eq=ones(s,1);

r=-A*X_eq;
r1=-A1*X_eq;
x01=zeros(1,s);
for i=1:s
    if rand()<0.5
        x01(i)=X_eq(i)+rand();
    else
        x01(i)=X_eq(i)-2/3*rand();
    end
end
x02=x01;

tspan=[0 time_end];

opts = odeset('RelTol',1e-10,'AbsTol',1e-10);

[t_simu1,x_simu1]=ode45(@(t,x)gLVFun(t,x,r,A),tspan,x01,opts);
[t_simu2,x_simu2]=ode45(@(t,x)gLVFun(t,x,r1,A1),tspan,x02,opts);


