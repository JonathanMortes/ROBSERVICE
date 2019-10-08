load('EMG 2 channel Wrist Flex_Ext_Raw.mat')
wrist = Data;
x = wrist{1};
y = wrist{2};
y2 = wrist{3};
plot(x,y,'b',x,y2,'g')

samplingRate=1.5000e+03;
 length_sec = max(x);

my = max(y);
miny = min(y);
my2 =max(y2);
miny2 =min(y2);
y=abs(y);
y2=abs(y2);
figure(2);
y = envelope(y,300,'peak');
y2 = envelope(y2,300,'peak');
y=abs(y);
y2=abs(y2);
plot(x,y,'b',x,y2,'g')
for n=1:34740
    if (y(n) > 200)
        if (y2(n) > 200)
            y(n)= 3;%ambos
        else
            y(n)= 2; %triceps
        end
    elseif (y2(n) > 200)
        if (y(n) < 200)
            y(n)= 1; % biceps
        end
    else
        y(n)= 0; %reposo
    end
end

figure(3);
plot(x,y)