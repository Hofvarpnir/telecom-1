close all;
clear; clc;

x = zeros(1,17);
x(4) = 1;
x(6) = 1;
x(8) = 1;
x(9) = 1;
x(10) = 1;
x(15) = 1;
figure('Name', '»сходный сигнал');
t = 0:16;
stairs(t, x);
axis([0 17 -0.1 1.1]);

y = zeros(1, 17);
y(1) = 1;
y(3) = 1;

[r, lag] = xcorr(x, y);
figure('Name', ' росс-коррел€ци€');
stairs(lag, r);
axis([0 17 -0.1 2.1]);

X = fft(x);
Y = conj(fft(y));
XY = Y .* X;
r = ifft(XY)/16;
figure('Name', 'Ѕыстра€ коррел€ци€');
stairs(t, r);

N = 500000;
s1 = randint(1, N, [0,1]);
s2 = randint(1, N, [0,1]);
tic;
r1 = xcorr(s1, s2);
t1 = toc;

tic;
S1 = fft(s1);
S2 = conj(fft(s2));
S1S2 = S2 .* S1;
r2 = ifft(S1S2)/N;
t2 = toc;

disp(t1);
disp(t2);