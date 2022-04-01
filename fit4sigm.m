function [fittato,cur,x]=fit4sigm(orig);

MM=mean(orig(end-28:end-2)); orig=orig/MM; 
N=length(orig);
xdata= (1:N); ydata=orig; 
options = optimset('MaxFunEvals',9000);

funzpolysigm = @(x,xdata)sigmf(xdata,[x(1),x(2)]).*sigmf(xdata,[x(3),x(4)]).*sigmf(xdata,[x(5),x(6)]).*sigmf(xdata,[x(7),x(8)]);
x = lsqcurvefit(funzpolysigm,[5,10,4,20,4,40,0.2,50],xdata,ydata,[0.1 5 0.1 10 0.2 20 0.1 40],[10 30 10 40 4 50 4 60],options),
%x = lsqcurvefit(funzpolysigm,[0.5,35,1,45,1,50,0.5,60],xdata,ydata),
fittato=sigmf(xdata,[x(1),x(2)]).*sigmf(xdata,[x(3),x(4)]).*sigmf(xdata,[x(5),x(6)]).*sigmf(1:N,[x(7),x(8)]);

plot([fittato' orig']);

fittato=fittato*MM;
cur=fittato*0; cur(1:end-1)=fittato(2:end)-fittato(1:end-1);