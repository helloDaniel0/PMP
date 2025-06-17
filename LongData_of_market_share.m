a=[0.95,0.6];
l=[1,0.5];
p=[0.2,0.5];
c=[0.5,1];
g2=1;
g1=0;
x=[];
y=[];
z=[];
t=0;
stop=1;
pace=0.005;
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
    while(t<=stop)
        g1=g_t(a(1),a(2),p(1),p(2),l(1),l(2),t);
        x=[x t];
        y=[y g1];
        z=[z p(1)];
        sum2=sum2+((g2-g1)*a(2)*2.7283^(-l(2)*t))*pace/c(2);
        sum1=sum1+((g1-p(1))*a(1)*2.7283^(-l(1)*t))*pace/c(1);
        t=t+pace;
    end
plot(x,y,'LineWidth',3,'Color','black','LineStyle','-');
hold on
plot(x,z,'LineWidth',3,'Color','black','LineStyle',':');
legend('G1','p1','FaceColor','');
area(x,z,1);
plot(x,y,'LineWidth',3,'Color','black','LineStyle','-');
hold on
plot(x,z,'LineWidth',3,'Color','black','LineStyle',':');
xlabel('g');
ylabel('t');
axis([0 1 0 1]);

