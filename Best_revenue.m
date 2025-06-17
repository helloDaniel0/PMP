a=[0.95,0.95];
l=[1,0.5];
p=[0.2,0.3];
c=[1,2];
g2=1;
g1=0;
x=[];
y=[];
z=[];
rate=[];
r=[];
r2=[];
r3=[];
t=0;
stop=1;
pace=0.005;
e=1;
for j=1:20
p(2)=p(2)+0.04;
c(1)=c(1)-0.04/e;
for i=1:100
    t=0;
    sum1=0;
    sum2=0;
    while(t<=stop)
        g1=g_t(a(1),a(2),p(1),p(2),l(1),l(2),t);
        sum2=sum2+((g2-g1)*a(2)*2.7283^(-l(2)*t))*pace/c(2);
        sum1=sum1+((g1-p(1))*a(1)*2.7283^(-l(1)*t))*pace/c(1);
        t=t+pace;
    end
    l(1)=sum1;
    l(2)=sum2;
end
t=0;
sum1=0;
sum2=0;
    while(t<=stop)
        g1=g_t(a(1),a(2),p(1),p(2),l(1),l(2),t);
        sum2=sum2+((g2-g1)*a(2)*2.7283^(-l(2)*t))*pace/c(2);
        sum1=sum1+((g1-p(1))*a(1)*2.7283^(-l(1)*t))*pace/c(1);
        t=t+pace;
    end
rate=[rate p(2)/p(1)];
r=[r sum1*p(1)+sum2*p(2)];
end


p=[0.2,0.3];
c=[1,2];
e=2;
for j=1:20
p(2)=p(2)+0.04;
c(1)=c(1)-0.04/e;
for i=1:100
    t=0;
    sum1=0;
    sum2=0;
    while(t<=stop)
        g1=g_t(a(1),a(2),p(1),p(2),l(1),l(2),t);
        sum2=sum2+((g2-g1)*a(2)*2.7283^(-l(2)*t))*pace/c(2);
        sum1=sum1+((g1-p(1))*a(1)*2.7283^(-l(1)*t))*pace/c(1);
        t=t+pace;
    end
    l(1)=sum1;
    l(2)=sum2;
end
t=0;
sum1=0;
sum2=0;
    while(t<=stop)
        g1=g_t(a(1),a(2),p(1),p(2),l(1),l(2),t);
        sum2=sum2+((g2-g1)*a(2)*2.7283^(-l(2)*t))*pace/c(2);
        sum1=sum1+((g1-p(1))*a(1)*2.7283^(-l(1)*t))*pace/c(1);
        t=t+pace;
    end
r2=[r2 sum1*p(1)+sum2*p(2)];
end

p=[0.2,0.3];
c=[1,2];

e=1.5;
for j=1:20
p(2)=p(2)+0.04;
c(1)=c(1)-0.04/e;
for i=1:100
    t=0;
    sum1=0;
    sum2=0;
    while(t<=stop)
        g1=g_t(a(1),a(2),p(1),p(2),l(1),l(2),t);
        sum2=sum2+((g2-g1)*a(2)*2.7283^(-l(2)*t))*pace/c(2);
        sum1=sum1+((g1-p(1))*a(1)*2.7283^(-l(1)*t))*pace/c(1);
        t=t+pace;
    end
    l(1)=sum1;
    l(2)=sum2;
end
t=0;
sum1=0;
sum2=0;
    while(t<=stop)
        g1=g_t(a(1),a(2),p(1),p(2),l(1),l(2),t);
        sum2=sum2+((g2-g1)*a(2)*2.7283^(-l(2)*t))*pace/c(2);
        sum1=sum1+((g1-p(1))*a(1)*2.7283^(-l(1)*t))*pace/c(1);
        t=t+pace;
    end
r3=[r3 sum1*p(1)+sum2*p(2)];
end

plot(rate,r,'LineWidth',2,'Color','black','LineStyle','--');
legend('e=1');
hold on
plot(rate,r2,'LineWidth',2,'Color','black','LineStyle','-.');

hold on
plot(rate,r3,'LineWidth',2,'Color','black','LineStyle',':');

xlabel('p(2)/p(1)');
ylabel('Revenue');
axis([1.3 6 0.05 0.4]);