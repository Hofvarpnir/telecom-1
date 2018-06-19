clc
clear all

eps = 1;                  % �����������
etl = 100;                % ����� �������
 

% �������������� ������
mPi = 2.5;               
f = 20;                   % �������
f0 = 7;                   % ����� (����)


t = 0:eps:etl;  
s = 5 * sin(2 * mPi * f * t + f0);  % ��������� 7

figure;
plot(t, s);

% ������
dots = 1024;
fft(s,dots);
figure;
plot(abs(fft(s,dots)));

% ������������� ������
tao = 35;                 % ����� ��������
Fs = 50;                  % ������� ���������� ��������
A = .8;                   % ���������
fi = pi/4;                % ����� (����)
eps = 0.5;                % �����������
etl = 1e3;                % ����� �������
 
t = 0:eps:etl;
d = (0:Fs:etl) + tao/2 + fi;
% "+ fi" - ��� ����� �� ����
% "+ tao/2" - ��� ����� ������ ��������, �.�. rectpuls
%             ��������� �� �������� (�����������)
x = A.*pulstran(t, d, @rectpuls, tao);
figure;
plot(t, x);
line(zeros(2,1), [-.1 .7], 'Color', 'r')   % Oy
line([-etl*.1 t], zeros(numel(t)+1), 'Color', 'r')% Ox

% ������
fft(x,dots);
figure;
plot(abs(fft(x,dots)));
