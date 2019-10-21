A=[0 1 0 0 0 0 0;1 0 0 0 0 0 0;0 1 0 1 0 0 0;0 0 0 0 0 0 0;0 0 1 0 0 0 1;0 0 0 0 1 0 0;1 0 0 1 1 1 0];
P=ones(7,7);
k=1;
while(k<=7)
    P(:,k)=A(:,k)/sum(A(:,k))
    k=k+1;
end
P


V0=1/7*ones(7,1);
k=1;
e=100 %control
while(k<=100 && e>=1e-10)
    V=P*V0;
    V=V/norm(V,1);
    e=norm((V-V0),1/2);
    errores(k)=e;
    k=k+1;
    V0=V;
end
fprintf("El bucle realiza %d iteraciones\n",k)
V
iter=[1:k-1];
semilogy(iter,errores(1:k-1));

%for k=1:100
%        V=P*V0;
%        V=V/norm(V,1);
%        e=norm((V-V0),1/2);
%        V0=V;
%end


