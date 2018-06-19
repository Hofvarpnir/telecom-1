clc
clear all
close all
format compact

dots = 1024;
eps = 1;                  % �����������
etl = 100;                % ����� �������

mPi = 2.5;
f = 10;
f0 = 7; 
t1=1;
%������ ������.
t = 0:eps:etl; 
s = 7 * sin(2 * mPi * f * t + f0);
figure('Name','�������������� ������');
plot(t, s);
%��������� ���.
y = s+awgn(s, 2);%
figure('Name','����������� ������');
plot(t, y);

%������� ������� �� � ����� ����������.
figure('Name','������ ������� �������');
plot(abs(fft(s, dots)))
figure('Name','������ ������������ �������');
plot(abs(fft(y, dots)))

%�������� �������.
[b, a] = butter(10, 60/500);
out = filter(b, a, y);

figure('Name','������ ����� ����������');
plot(t, out);
figure('Name','������ ������� ����� ����������');
plot(abs(fft(out, length(out))));
