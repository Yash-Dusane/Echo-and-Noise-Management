clc,clearvars

[fan,fs1] = audioread("D:\DSP\Course_Project\Test_Audio\test_audio_files\q3_speech\speech_ceiling-fan.wav");

[traffic,fs2] = audioread("D:\DSP\Course_Project\Test_Audio\test_audio_files\q3_speech\speech_city-traffic.wav");

[cooker,fs3] = audioread("D:\DSP\Course_Project\Test_Audio\test_audio_files\q3_speech\speech_pressure-cooker.wav");

[pump,fs4] = audioread("D:\DSP\Course_Project\Test_Audio\test_audio_files\q3_speech\speech_water-pump.wav");

fan_pump = fan-pump;
fan_traffic= fan-traffic;
fan_cooker=fan-cooker;
pump_traffic = pump-traffic;
pump_cooker= pump - cooker;
traffic_cooker=traffic-cooker;

%[input,fs]=audioread("D:\DSP\Course_Project\Test_Audio\test_audio_files\q3_speech\speech_ceiling-fan.wav");
%[input,fs]=audioread("D:\DSP\Course_Project\Test_Audio\test_audio_files\q3_speech\speech_city-traffic.wav");
[input,fs]=audioread("D:\DSP\Course_Project\Test_Audio\test_audio_files\q3_speech\speech_pressure-cooker.wav");
%[input,fs]=audioread("D:\DSP\Course_Project\Test_Audio\test_audio_files\q3_speech\speech_water-pump.wav");

input = input(:,1);
%sound(input,fs);
input = input(:,1);

correlation1 = xcorr(input,fan_pump);
correlation2 = xcorr(input,fan_traffic);
correlation3 = xcorr(input,fan_cooker);
correlation4 = xcorr(input,pump_traffic);
correlation5 = xcorr(input,pump_cooker);
correlation6 = xcorr(input,traffic_cooker);



a=zeros(6,1);

a(6)=max(abs(correlation6));
a(5)=max(abs(correlation5));
a(4)=max(abs(correlation4));
a(3)=max(abs(correlation3));
a(2)=max(abs(correlation2));
a(1)=max(abs(correlation1));


%find the three max correlating graphs

indices=zeros(3,1);

for p =1:3

    b = max(a);

for i =1:6
    if(a(i)==b)
        indices(p)=i;
    end
end

a(indices(p))=0;
end



if(indices(1)==1 && indices(2)==2 && indices(3)==3 || indices(1)==2 && indices(2)==3 && indices(3)==1 || indices(1)==3 && indices(2)==1 && indices(3)==2 || indices(1)==3 && indices(2)==2 && indices(3)==1 || indices(1)==2 && indices(2)==3 && indices(3)==1 || indices(1)==1 && indices(2)==3 && indices(3)==2 )
    fprintf('Ceiling fan detected\n')



elseif(indices(1)==1 && indices(2)==4 && indices(3)==5 || indices(1)==1 && indices(2)==5 && indices(3)==4 || indices(1)==4 && indices(2)==1 && indices(3)==5 || indices(1)==4 && indices(2)==5 && indices(3)==1 || indices(1)==5 && indices(2)==4 && indices(3)==1 || indices(1)==5 && indices(2)==1 && indices(3)==4 )
    fprintf("Water pump detected\n")



elseif(indices(1)==3 && indices(2)==5 && indices(3)==6 || indices(1)==3 && indices(2)==6 && indices(3)==5 || indices(1)==6 && indices(2)==5 && indices(3)==3 || indices(1)==6 && indices(2)==3 && indices(3)==5 || indices(1)==5 && indices(2)==3 && indices(3)==6 || indices(1)==5 && indices(2)==6 && indices(3)==3 )
    fprintf("Pressure Cooker detected\n")


elseif(indices(1)==2 && indices(2)==4 && indices(3)==6 || indices(1)==2 && indices(2)==6 && indices(3)==4 || indices(1)==6 && indices(2)==4 && indices(3)==2 || indices(1)==6 && indices(2)==2 && indices(3)==4 || indices(1)==4 && indices(2)==2 && indices(3)==6 || indices(1)==4 && indices(2)==6 && indices(3)==2 )
    fprintf("Traffic Noise detected\n")

else
    fprintf("No noise detected")
end

subplot(2,3,1)
plot(1:length(correlation1),abs(correlation1))
title("Fan _ Pump Correlation");

subplot(2,3,2)
plot(1:length(correlation2),abs(correlation2))
title("Fan _ Traffic Correlation")

subplot(2,3,3)
plot(1:length(correlation3),abs(correlation3))
title("Fan _ Cooker Correlation")

subplot(2,3,4)
plot(1:length(correlation4),abs(correlation4))
title("Pump _ Traffic Correlation")

subplot(2,3,5)
plot(1:length(correlation5),abs(correlation5))
title("Pump _ Cooker Correlation")

subplot(2,3,6)
plot(1:length(correlation6),abs(correlation6))
title("Traffic _ Cooker Correlation")