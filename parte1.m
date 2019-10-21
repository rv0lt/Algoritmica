x=[0.2:0.01:1];
fx=(exp(3.*x)-1)./x-5;
y=0*x;
plot(x,fx,'r',x,y,'k');
%resultados:
f0_2=(exp(3*0.2)-1)/0.2-5;
f1 =(exp(3*1)-1)/1-5;
f0_2*f1

%Metodo 1
clear
error=100.0; % Control
iteracion=0;
xn=0.4; % Valor inicial
while (iteracion<20) %Algoritmo
iteracion=iteracion+1;
g1x=(exp(3*xn)-1)/5;
error=abs(g1x-xn); %Estimación error
fprintf('Iter %d Sol %.16f Error %.2e\n', iteracion,g1x,error) %Imprimir soluciones aprox.
xn=g1x;
end

%Metodo 2
clear
error=100.0; % Control
iteracion=0;
xn=0.4; % Valor inicial
e=ones(1,20);
while (iteracion<20) %Algoritmo
iteracion=iteracion+1;
g2x=log(1+5*xn)/3;
error=abs(g2x-xn); %Estimación error
e(iteracion)=error;
fprintf('Iter %d Sol %.16f Error %.2e\n', iteracion,g2x,error) %Imprimir soluciones aprox.
xn=g2x;
end




x=[0.2:0.01:1];
g2dx=abs(diff(log(1+5.*x)/3));
g2d=g2dx<1;
all(g2d)

round(e(2:end)./e(1:end-1),1)

%Metodo 3
clear

error=100.0; % Control
iteracion=0;
x=0.4; % Valor inicial
ez=ones(1,20);
while (iteracion<20)
iteracion=iteracion+1;
g3x=x-((exp(3*x)-1)/x-5)/((exp(3*x)*(3*x-1)+1)/x^2);
error=abs(g3x-x);
ez(iteracion)=error;
fprintf('Iter %d Sol %.16f Error %0.2e\n', iteracion,g3x,error)
x=g3x;
end


ez(2:end)./((ez(1:end-1)).^2)
%subaoartado 5.
%errores relativos
%clear
 
x=[0.2:0.01:1];
fx=0.3158016272050506;
iteracion=0;
%metodo 2
erelx=100.0; % Control
xn=0.4; % Valor inicial
erelxk=ones(1,80);
%------------------
%metodo 3
erelz=100.0; % Control
xz=0.4;
erelzk=ones(1,80);
%------------------
while (iteracion<80) %Algoritmo
iteracion=iteracion+1;
%metodo 2
g2x=log(1+5*xn)/3;
erelx=abs(fx-g2x)/fx; %EstimaciÃ³n erel
erelxk(iteracion)=erelx;
xn=g2x;
%-------------------------
%metodo 3
g3x=xz-((exp(3*xz)-1)/xz-5)/((exp(3*xz)*(3*xz-1)+1)/xz^2);
erelz=abs(fx-g3x)/fx;
erelzk(iteracion)=erelz;
xz=g3x;
%-------------------
end
x=[0.2:0.01:0.99];
subplot(1,2,1);loglog(x,erelxk,'r',x,erelzk,'b');title('Errores relativos')
ncifxk=-log(erelxk);
ncifzk=-log(erelzk);
subplot(1,2,2);semilogx(x,ncifxk,'r',x,ncifzk,'b');title('Cifras decimales significativas')
i=1;
finzk=true;
finxk=true;
while(i<80&&(finzk||finxk))
    if(ncifzk(i)>=15&&finzk)
        fprintf('Las 15 cifras significativas de zk se obtienen en la iter: %d\n',i)
        finzk=false;
   end
   if(ncifxk(i)>=15&&finxk)
        fprintf('Las 15 cifras significativas de xk se obtienen en la iter: %d\n',i)
        finxk=false;
    end    
   i=i+1;     
end


