%% Initial values
fe = 32000; %sampling frequency
N = 2048; %number of iterations
o = 256; % order of the filter

%% Generate artificial signals
noise = square(2*pi*1/128*(1:N)); % added noise
desired_signal = sin(2*pi*1/256*(1:N))+sin(2*pi*1/64*(1:N)); % desired signal
input_signal = desired_signal+noise; %input signal

%% Apply adaptive filters
filtered_signal_lms, coef_lms = LMS_filter(input_signal,fe,o)
filtered_signal_nlms, coef_nlms = NLMS_filter(input_signal,fe,o)

%% Compare FFT of the signals
fft_signals(input_signal,filtered_signal_lms,desired_signal,noise,coef_lms,o)
fft_signals(input_signal,filtered_signal_nlms,desired_signal,noise,coef_nlms,o)

