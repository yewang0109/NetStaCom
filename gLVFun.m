function dxdt = gLVFun(t,x,r,A)

S=max(size(A));

for i=1:S
    flag1=0;
    for j=1:S
        flag1=flag1+A(i,j)*x(j);
    end
    flag1=flag1+r(i);
    dxdt(i,1)=x(i)*flag1;
end

end

