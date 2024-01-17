clc, clearvars

audiofile = "D:\DSP\Course_Project\Test_Audio\test_audio_files\hindi_2s.wav";

[x,Fs] = audioread(audiofile);

a = 0.5;
n = 2;

x = transpose(x);
l = length(x);
d = Fs;

h = zeros(1,(n+1)*d+1);
for k = 0:n, h(k*d+1) = a^k; end
y = conv(x(1,:),h);

mu = 0.01; 
x_recon = zeros(1,l);

fl= 128; 
fw = zeros(1,fl);

% LMS Adaptive Filter being used
for k = fl:l
    x_rev = y(k:-1:k-fl+1);                     
    x_recon(k) = fw*transpose(x_rev);
    err = x(k) - x_recon(k);

    fw = fw + mu*err*x_rev;    
end

sound(x_recon,Fs)

figure(1)
subplot(3,1,1)
plot(1:length(x),x)
xlim([0 300000])
subplot(3,1,2)
plot(1:length(y),y);
subplot(3,1,3)
plot(1:length(x_recon),x_recon);
xlim([0 300000])