clc
clear all
close all
format compact

dots = 1024;
eps = 1;                  % Погрешность
etl = 100;                % Конец отсчета

mPi = 2.5;
f = 10;
f0 = 7; 
t1=1;
%Строим сигнал.
t = 0:eps:etl; 
s = 7 * sin(2 * mPi * f * t + f0);
figure('Name','Синусоидальный сигнал');
plot(t, s);
%Добавляем шум.
y = s+awgn(s, 2);%
figure('Name','Зашумленный сигнал');
plot(t, y);

%Спектры сигнала до и после зашумления.
figure('Name','Спектр чистого сигнала');
plot(abs(fft(s, dots)))
figure('Name','Спектр зашумленного сигнала');
plot(abs(fft(y, dots)))

%Значения фильтра.
[b, a] = butter(10, 60/500);
out = filter(b, a, y);

figure('Name','Сигнал после фильтрации');
plot(t, out);
figure('Name','Спектр сигнала после фильтрации');
plot(abs(fft(out, length(out))));
