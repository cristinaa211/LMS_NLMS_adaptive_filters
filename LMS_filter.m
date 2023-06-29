function [filtered_signal, c] = LMS_filter(in,fe,o)
% Least mean squares filter (LMS)
% Input parameters
% in : input signal
% fe : sampling frequncy
% o  : filter order
% Output parameters
% filtered_signal : the output filtered signal
% c 		  : the filter coefficients
%LMS Filter construction
N = length(in);
R = in'*in;       %autocorrelation matrix
D = eig(R);       %eigenvalues calculation
miu = 2/max(D);   % adaptation constant
c = zeros(o,1);
x = zeros(o,1);
if miu > 0
    for i = 1:N
	    x = [in(i); x(1:o-1)]; %input signal , at each iteration the sample i is read
	    y = c'*x;              %filter's output at iteration i
	    e(i) = d(i)-y;         %error estimation
	    c = c+2*miu*e(i)*x;    %the coefficients of the adaptive filter
    end
end
%Apply the filter on the input signal
filtered_signal=filter(c,1,in);
end


