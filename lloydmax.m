function[result,loss]=lloydmax(min, max,N,data,times) 
len=length(data);
sorted_data=sort(data); 
result=zeros(1,len);
interval=(max-min)/N; 
d=min:interval:max; 
loss=zeros(1,times);
y=zeros(1,N);
for i=1:times 
    for k=1:N 
        num=0;den=0; 
        for j=1:len 
            if sorted_data(j)<d(k+1)&&sorted_data(j)>=d(k) 
                den=den+1; 
                num=num+sorted_data(j);
            end
        end
        if num==0 
            y(k)=(d(k)+d(k+1))/2; 
        else
            y(k)=num/den; 
        end
    end
    for k=2:N 
        d(k)=(y(k-1)+y(k))/2; 
    end
    for h=1:N 
        for t=1:len 
            if data(t)<d(h+1)&&data(t)>=d(h) 
                result(t)=y(h);
            end
        end
    end
    loss(i)=sum((result-data).^2)/len; 
end
plot(1:100,loss,'b'); title('4-bit quantization distortion');
xlabel('literations');
ylabel('distortion');
end

