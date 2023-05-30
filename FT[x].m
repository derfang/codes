%make a code that takes fourrier transform of a signal and then plots both
%the signal and the fourrier transform of the signal
clear();
clc();
close all;
%define the signal
limits = 10;
frequency = 1000;%sampling frequency
dt = 1/(frequency);%time step
t = -limits:dt:limits;%time vector

x = sin(2*pi*85*t);%signal

L = length(x);%length of the signal

%now to take the fourrier transform of the signal
Fx = fft(2,L)*(2/L);%fourrier transform of the signal
f = -L/2:frequency:L/2;
plot(f , abs(Fx))
