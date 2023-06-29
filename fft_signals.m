function [] = fft_signals(in,filtered_signal,d,n, c,o)
% in : input signal
% filtered_signal : the output filtered signal
% d : desired signal
% n : added noise
% c : filter coefficients
% o : filter order

%Compute FFT of the filtered signal
fftc=fft(c); 
C = abs(fftc/o); 
C1 = 2*C(1:o/2+1);
%FFT of the input signal
fftsemnf = fft(filtered_signal);
SEMNF = abs(fftsemnf/N);
SEMNF1=2*SEMNF(1:N/2+1);
%FFT of the added noise
fftn=fft(n); 
NN=abs(fftn/N); 
NN1=2*NN(1:N/2+1);
% FFT of input signal
fftin=fft(in); 
IN=abs(fftin/N); 
IN1=2*IN(1:N/2+1);
%FFT of the desired signal
fftd=fft(d);  
D=abs(fftd/N); 
D1=2*D(1:N/2+1);

m=fe*(0:( /2))/N;
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
