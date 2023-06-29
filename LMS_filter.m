
function [] = FiltruLMS(in,fe)
%Filter construction
o=256;  %filter order
N=length(in);
R=in'*in;       %autocorrelation matrix
D=eig(R);       %eigenvalues calculation
miu=2/max(D);   % adaptation constant
c=zeros(o,1);
x=zeros(o,1);
if miu>0
    for i=1:N
    
    x=[in(i); x(1:o-1)]; %input signal , at each iteration the sample i is read
    y=c'*x;              %filter's output at iteration i
    e(i)=d(i)-y;         %error estimation
    c=c+2*miu*e(i)*x;    %the coefficients of the adaptive filter
    end
end

%Apply the filter on the input signal
semnf=filter(c,1,in);
%FFT of the filtered signal
fftc=fft(c); 
C=abs(fftc/o); 
C1=2*C(1:o/2+1);
fftsemnf=fft(semnf);SEMNF=abs(fftsemnf/N); SEMNF1=2*SEMNF(1:N/2+1);
fftn=fft(n); NN=abs(fftn/N); NN1=2*NN(1:N/2+1);
fftin=fft(in); IN=abs(fftin/N); IN1=2*IN(1:N/2+1);
fftd=fft(d);  D=abs(fftd/N); D1=2*D(1:N/2+1);
m=fe*(0:(N/2))/N;
m1=fe*(0:(o/2))/o;

%Plot the filter coefficients and the fft of the signals
figure
subplot(221) ;plot(c); title 'Filter coefficients' ;
subplot(222) ;plot(m1,C1); title 'FFT coefficients' ;
subplot(212); plot(e); title 'Error estimation';

figure
subplot(223); plot(in) ; title 'Input signal';
subplot(224); plot(semnf) ; title 'Filtered signal';
subplot(222);plot(d);title 'Desired signal';
subplot(221) ;plot(n); title 'Noise' ;
figure

subplot(224);plot(m,SEMNF1);title('FFT filtered signal')
subplot(221);plot(m,NN1);title('FFT noise')
subplot(223);plot(m,IN1);title('FFT Input signal')
subplot(222);plot(m,D1);title('FFT Desired signal')
end

