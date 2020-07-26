clear all;
close all;
clc;
x=importdata('Dat_2.mat');
n=16;
del=(6-(-6))/n;
y=zeros(1,10000);
j=0:1:n;
d=-6+del.*j;
m=length(d);
for i=1:10000
    for j=1:m
        if x(i)>d(j)&&x(i)<=d(j+1)
            y(i)=(d(j)+d(j+1))/2;
        end
    end
end
err=abs(x-y);
SSE=sum(abs(x-y).^2)

figure(1)
stem(x);title('original signal');

figure(2)
stem(y);title('quantified signal(n=16)');

figure(3)
stem(err);title('quantified error(n=16)');

            
