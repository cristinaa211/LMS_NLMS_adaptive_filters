fe=32000; %sampling frequency
o=256;  %filter order
N=2048; %number of iterations
n=square(2*pi*1/128*(1:N));
d=sin(2*pi*1/256*(1:N))+sin(2*pi*1/64*(1:N));

in=d+n;         %input signal
R=in'*in;       %autocorrelation matrix
D=eig(R);       %eigenvalues estimation
miu=2/max(D);   % adaptation constant
c=zeros(o,1);
x=zeros(o,1);
if miu>0
    for i=1:N
	    x=[in(i); x(1:o-1)]; 
	    y=c'*x;            
	    e(i)=d(i)-y;         
	    c=c+2*miu*e(i)*x/max(x'*x);    
    end
end

semnf=filter(c,1,in);



