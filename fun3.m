function [z,ez,iterz] = fun3(x0,tol,nmax)
ez=100.0; % Control
iter=0;
z=x0; % Valor inicial
while (iter<nmax && ez>=tol) %algoritmo
iter=iter+1;
g3x=z-((exp(3*z)-1)/z-5)/((exp(3*z)*(3*z-1)+1)/z^2);
ez=abs(g3x-z);
z=g3x;
end
z
ez
iter

end

