clear all;
close all;
clc;
x=importdata('Dat_2.mat');

min=-6;
max=6;
n=16;
result=lloydmax(min,max,n,x,100);
err=abs(x-result);
SSE=sum(abs(x-result).^2)


