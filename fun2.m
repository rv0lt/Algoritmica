function [x,ex,iter] = fun2(x0,tol,nmax)

ex=100; %control 
iter=0;
x=x0; %valor inicial
while (iter<nmax && ex >= tol) %Algoritmo
iter=iter+1;
g2x=log(1+5*x)/3;
ex=abs(g2x-x); %Estimación error
x=g2x;
end %while
ex
iter
x
end %function

