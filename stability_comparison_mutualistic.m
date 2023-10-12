function [sta_set,sta_un,sta_theory]=stability_comparison_mutualistic(c,num_set,aver_num_set,sigma,d,T)
% This function generates community matrics for mutualistic interactions and
% estimate its stability with an increasing number of species


stability_1=zeros(T,length(100:20:300));
stability_2=zeros(T,length(100:20:300));
stability_theory=zeros(1,length(100:20:300));
kk=1;
c1=c*(aver_num_set^2/num_set);
for s=100:20:300
    for t=1:T
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
        stability_1(t,kk)=-max(real(diag(D)));
        stability_2(t,kk)=-max(real(diag(Du)));
    end
    stability_theory(kk)=-sigma*((s-1)*c1*sqrt(2/pi))+d;
    kk=kk+1;
end
sta_set=stability_1;
sta_un=stability_2;
sta_theory=stability_theory;
end