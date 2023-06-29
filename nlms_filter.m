function [filtered_signal, c] = NLMS_filter(in,fe,o)
% Normalized Least Mean Squares (NLMS) 
% Input parameters
% fe : sampling frequncy
% o  : filter order
% Output parameters
% filtered_signal : the output filtered signal
% c 		  : the filter coefficients
% NLMS Filter construction
R = in'*in;       %autocorrelation matrix
D = eig(R);       %eigenvalues estimation
miu = 2/max(D);   % adaptation constant
c = zeros(o,1);
x = zeros(o,1);
if miu > 0
    for i = 1:N
	    x = [in(i); x(1:o-1)]; 
	    y = c'*x;            
	    e(i) = d(i)-y;         
	    c = c+2*miu*e(i)*x/max(x'*x);    
    end
end
filtered_signal = filter(c,1,in);
end
