clear all;
close all;
clc;
y=importdata('Dat_2.mat');
figure;
stem(y,'r');
hold on

n=16;
del=(6-(-6))/n;
for i=1:n
    m(i)=-6+del*i;
end
Y=y;
for i=1:10000
    for j=1:n
        if Y(i)>=6
            Y(i)=6;
        else if Y(i)<=-6
                Y(i)=-6;
            else if Y(i)>=m(j) && Y(i)<=m(j+1)
                    Y(i)=(m(j)+m(j+1))/2;
                   break
                end
            end
        end
    end
end
stem(Y,'b');
title('¾ùÔÈÁ¿»¯');
hold off
E=sum(abs(Y(i)-y(i))^2)
            
