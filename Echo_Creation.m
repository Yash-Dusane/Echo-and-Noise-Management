clc, clearvars

audiofile = "D:\DSP\Course_Project\Test_Audio\test_audio_files\ipl-9284.wav";

[x,Fs] = audioread(audiofile);

a = 0.5;
n = 2;

x = transpose(x);
l = length(x);
d = Fs;

h = zeros(1,(n+1)*d+1);
for k = 0:n, h(k*d+1) = a^k; end
y = conv(x(1,:),h);

figure(1)
plot(0:1/Fs:(length(y)-1)/Fs,y)
sound(y,Fs)