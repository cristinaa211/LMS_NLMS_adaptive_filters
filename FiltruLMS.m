
function [] = FiltruLMS(in,fe)
o=256;  %ordinul filtrului
N=length(in);

R=in'*in;       %matricea de autocorelatie

D=eig(R);       %aflarea valorilor proprii
miu=2/max(D);   % constanta de adaptare
c=zeros(o,1);
x=zeros(o,1);
if miu>0
    for i=1:N
    
    x=[in(i); x(1:o-1)]; %semnalul de intrare, la fiecare iteratie se citeste esantionul i
    %din semnalul de intrare initial in
    y=c'*x;              %iesirea filtrului la iteratia i
    e(i)=d(i)-y;         %estimarea de eroare
    c=c+2*miu*e(i)*x;    %coeficientii filtrului adaptiv
    
    end
end

semnf=filter(c,1,in);

fftc=fft(c); 
C=abs(fftc/o); 
C1=2*C(1:o/2+1);
fftsemnf=fft(semnf);SEMNF=abs(fftsemnf/N); SEMNF1=2*SEMNF(1:N/2+1);
fftn=fft(n); NN=abs(fftn/N); NN1=2*NN(1:N/2+1);
fftin=fft(in); IN=abs(fftin/N); IN1=2*IN(1:N/2+1);
fftd=fft(d);  D=abs(fftd/N); D1=2*D(1:N/2+1);
m=fe*(0:(N/2))/N;
m1=fe*(0:(o/2))/o;


figure
subplot(221) ;plot(c); title 'Coeficientii filtrului' ;
subplot(222) ;plot(m1,C1); title 'FFT Coeficienti' ;
subplot(212); plot(e); title 'Estimarea de eroare';

figure
subplot(223); plot(in) ; title 'Semnal la intrarea filtrului';
subplot(224); plot(semnf) ; title 'Semnal filtrat';
subplot(222);plot(d);title 'Semnal dorit';
subplot(221) ;plot(n); title 'Zgomot' ;
figure

subplot(224);plot(m,SEMNF1);title('FFT SEMNAL Filtrat')
subplot(221);plot(m,NN1);title('FFT Zgomot')
subplot(223);plot(m,IN1);title('FFT SEMNAL Intrare')
subplot(222);plot(m,D1);title('FFT SEMNAL Dorit')
end

