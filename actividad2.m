load('EMG 1 channel recording_MVC.mat')
muscle=Data;
x=muscle{1};
y=muscle{2};
plot(x,y,'b')

samplingRate=1.5000e+03;
length_sec=max(x);

maximum=max(y);
y=abs(y);
figure(2);
y=envelope(y,300,'peak');
y=abs(y);
figure(2);
plot(x,y)

load('EMG 1 channel recording_Proportional.mat')
porcentual = Data;
x2=porcentual{1};
y2=porcentual{2};
figure(3);
plot(x2,y2)

y2=abs(y2);
figure(2);
y2=envelope(y2,300,'peak');
y2=abs(y2);
figure(2);
plot(x2,y2)

for n=1:46620
    y2(n)=(y2(n)/maximum)*100;
    if(y2(n)>100)
        y2(n)=100;
    end
end
figure(4);
plot(x2,y2)