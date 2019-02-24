

clc;

clear all;

close all;
%Data loading. A noisy signal which is saved in a text file ‘data’ is loaded

load data.txt; 
% loads the data to the work space ie, to read the data.txt file and get it as a vector.

y = data;   
% assign the read data to a variable y. y is a column vector of size(300*1)

N = length(y);
% take the size of the variable y to N
 
%display data

figure(1)

clf   % close current figure

plot(y)

title('Data')

 

e = ones(N, 1);

D = spdiags([e -2*e e], 0:2, N-2, N);

% Creating a D matrix which is sparse and has only 3 values in each row  (1,-2 ,1) of size n-2*n., where n is the size of input signal y.

 

full(D(1:5, 1:5))

full(D(end-4:end, end-4:end))

% as the size of D is large only the first and last corners of D is displayed


lam = 30;   % initializing the control parameter
F = speye(N) + lam * D' * D;           
% implementation of the least square denoising equation as linear regression problem by simple matrix operations instead of optimisation    
x = F \ y;  % finding the inverse of F (fast solveing)          

%ploting the input signal
figure(1)
plot(x)
title('denoised signal')
xlabel('data points')
ylabel('amplitude')

%ploting the output signal
figure;
subplot(2,1,1);plot(y);title('Noisy input signal');xlabel('data points')
ylabel('amplitude');
subplot(2,1,2);plot(x);title('Denoised output signal');xlabel('data points')
ylabel('amplitude');
	
	
	
