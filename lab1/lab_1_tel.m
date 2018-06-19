clc
clear all

eps = 1;                  % Погрешность
etl = 100;                % Конец отсчета
 

% Синусоидальный сигнал
mPi = 2.5;               
f = 20;                   % Частота
f0 = 7;                   % Сдвиг (фаза)


t = 0:eps:etl;  
s = 5 * sin(2 * mPi * f * t + f0);  % Амплитуда 7

figure;
plot(t, s);

% Спектр
dots = 1024;
fft(s,dots);
figure;
plot(abs(fft(s,dots)));

% Прямоугольный сигнал
tao = 35;                 % Длина импульса
Fs = 50;                  % Частота повторения импульса
A = .8;                   % Амплитуда
fi = pi/4;                % Сдвиг (фаза)
eps = 0.5;                % Погрешность
etl = 1e3;                % Конец отсчета
 
t = 0:eps:etl;
d = (0:Fs:etl) + tao/2 + fi;
% "+ fi" - это сдвиг по фазе
% "+ tao/2" - это сдвиг самого импульса, т.к. rectpuls
%             считается от середины (центрирован)
x = A.*pulstran(t, d, @rectpuls, tao);
figure;
plot(t, x);
line(zeros(2,1), [-.1 .7], 'Color', 'r')   % Oy
line([-etl*.1 t], zeros(numel(t)+1), 'Color', 'r')% Ox

% Спектр
fft(x,dots);
figure;
plot(abs(fft(x,dots)));
