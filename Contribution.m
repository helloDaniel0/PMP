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
rateline=[];
C=[];
C1=[];
C2=[];
C21=[];
delta=[];
r3=[];
t=0;
stop=1;
pace=0.005;

e=2;
for j=1:20
p(2)=p(2)+0.02;
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
        sum2=sum2+((g2-g1)/2*a(2)*2.7283^(-l(2)*t))*pace/c(2);
        sum1=sum1+((g1-p(1))/2*a(1)*2.7283^(-l(1)*t))*pace/c(1);
        t=t+pace;
    end
rate=[rate p(2)/p(1)];
rateline=[rateline p(2)/p(1)];
C=[C sum1];
C1=[C1 sum1];
C2=[C2 sum2];
C21=[C21 sum2];
delta=[delta sum1/sum2];
end

plot(rateline,C1,rateline,C21,'LineWidth',2);
hold on
plot(rate,C,'x',rate,C2,'o','LineWidth',3);
hold on
ylabel('Contribution');
xlabel('p(2)/p(1)');
legend('BS Contribution','UAVs Contribution');
grid on
axis([1.6 3.5 0 0.35]);
