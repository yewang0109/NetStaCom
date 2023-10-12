function delta_com=rule_confirmation_competitive(c,s,aver_num_set,sigma,d,T)
% This function generates community matrics for competitive interactions and
% compute its stability with an increasing number of sets


stability_1=zeros(T,length(10:10:100));
stability_2=zeros(T,length(10:10:100));
kk=1;
for num_set=10:10:100
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
        stability_1(t,kk)=-max(real(diag(D)));
        stability_2(t,kk)=-max(real(diag(Du)));
    end
    kk=kk+1;
end
sta_set=mean(stability_1);
sta_un=mean(stability_2);
delta_com=sta_set-sta_un;
end