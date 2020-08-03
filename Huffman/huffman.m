close all;
clear all;
clc;

x=importdata('uniform_quantized_value.mat');
[x_uniq,dist]=Number_Distribution(x)
dist=sort(dist,'descend');%����������
T=dist;
n=length(dist);
B=zeros(n,n-1);%�յı��������
for i=1:n
    B(i,1)=T(i);%���ɱ����ĵ�һ��
end
r=B(i-1,1)+B(i,1);%�������Ԫ�����
T(n-1)=r;
T(n)=0;
T=sort(T,'descend');
t=n-1;
for j=2:n-1%���ɱ�������������
    for i=1:t
        B(i,j)=T(i);
    end
    K=find(T==r);
    B(n,j)=K(end);%�ӵڶ��п�ʼ��ÿ�е����һ��Ԫ�ؼ�¼����Ԫ����
    %���е�λ��
    r=(B(t-1,j)+B(t,j));%�������Ԫ�����
    T(t-1)=r;
    T(t)=0;
    T=sort(T,'descend');
    t=t-1;
end
B;
END1=str2sym('[0,1]');%�����һ�е�Ԫ�ر���
END=END1;
t=3;
d=1;
for j=n-2:-1:1%�ӵ����ڶ��п�ʼ���ζԸ���Ԫ�ر���
    for i=1:t-2
        if i>1 && B(i,j)==B(i-1,j)
            d=d+1;
        else
            d=1;
        end
        B(B(n,j+1),j+1)=-1;
        temp=B(:,j+1);
        x=find(temp==B(i,j));
        END(i)=double(END1(x(d)));
    end
    y=B(n,j+1);
    END(t-1)=[char(END1(y)),'0'];
    END(t)=[char(END1(y)),'1'];
    t=t+1;
    END1=END;
end
END