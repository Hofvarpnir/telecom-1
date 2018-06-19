clc
clear all
close all
format compact

Fc = 25;%Несущая частота.
Fs = Fc*3;%Частота дискретизации.
%Создаём однотанальный сигнал низкой частоты.
t = [0:1.5*Fs+1]'/Fs;
y = sin(4*pi*t);
plot(t,y);
pause;
%Выполняем амплитудную модуляцию с помощью матлабовской функции.
modS = ammod(y,Fc,Fs,0,0.7);%Начальная фаза 0, амплитуда несущей 0.7
plot(t,modS);
pause;

%Получаем спектр модулированного сигнала.
spMS = fft(modS);
spMS = abs(spMS);
d = length(spMS);
sspMS1 = spMS(d/2+1:d);
sspMS2 = spMS(1:d/2);
ssp = [sspMS1; sspMS2]; 
ff = [0-Fc:2*length(spMS)-1]*Fs/length(spMS)-Fc;
plot(ff(1:length(spMS)),ssp);
pause;

%Модуляция с подавлением несущей.
supSignal = ammod(y,Fc,Fs);
plot(t,modS);
pause;
%Получаем спектр.
spSup = fft(supSignal);
spSup = abs(spSup);
d = length(spSup);
sspMS1 = spSup(d/2+1:d);
sspMS2 = spSup(1:d/2);
ssp = [sspMS1; sspMS2];
ff1 = [0-Fc:2*length(spSup)-1]*Fs/length(spSup)-Fc;
plot(ff1(1:length(spSup)),ssp);
pause;

%Выполняем однополосную модуляцию.
strMod = ssbmod(y,Fc,Fs);
plot(t,strMod);
pause;

spStr = fft(strMod);
spStr = abs(spStr);
d = length(spStr);
sspMS1 = spStr(d/2+1:d);
sspMS2 = spStr(1:d/2);
ssp = [sspMS1; sspMS2];
ff2 = [0-Fc:2*length(spStr)-1]*Fs/length(spStr)-Fc;
plot(ff2(1:length(spStr)),ssp);
pause;

%Выполняем синхронное детектирование и получаем 
%исходный однополосный сигнал.
origSignal = demod(strMod,Fc,Fs);
plot(t,origSignal)
pause;

spOrig = fft(origSignal);
spOrig = abs(spOrig);
d = length(spOrig);
sspMS1 = spOrig(d/2+1:d);
sspMS2 = spOrig(1:d/2);
ssp = [sspMS1; sspMS2];
ff3 = [0-Fc:2*length(spOrig)-1]*Fs/length(spOrig)-Fc;
plot(ff2(1:length(spOrig)),ssp);
pause;

%Считаем КПД модуляции.
M = Fc/0.7; %Амплитуда несущей - 0.7
kpd = M^2/(M^2+2)
