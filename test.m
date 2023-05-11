% in this cose we want to make a squre function and show that the furier transform of a squre function is a sinc function
frequency = 1e4;
n= 20;
t = linspace(-n,n,frequency);
x = heaviside(t+0.5)-heaviside(t-0.5);
figure("Name","square function")
plot(t,x);
xlim([-10,10]);
ylim([-1,2]);
xlabel("time");
ylabel("amplitude");
title("square function");
grid on;
%now we want to find the furier transform of this function
X = fftshift(fft(x))/frequency;
L = length(X);
f = linspace(-frequency/2,frequency/2,length(X));
figure("Name","furier transform of square function")
plot(f,X);
xlim([-10,10]);
% ylim([-1,2]);
xlabel("frequency");
ylabel("amplitude");
title("furier transform of square function");
grid on;



