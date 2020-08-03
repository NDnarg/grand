function [x_uniq,dist]=Number_Distribution(x)
x_uniq=unique(x);
dist=zeros(length(x_uniq),1);
for i=1:length(x_uniq)
    dist(i)=sum(x==x_uniq(i))/length(x);
end