r = ['1:1.5' '1:2' '1:2.5' '1:3'];

a20 = [normrnd(0.27,0.01) normrnd(0.3,0.01) normrnd(0.255,0.01) normrnd(0.22,0.01)]';

a30 = [normrnd(0.3,0.01) normrnd(0.33,0.01) normrnd(0.275,0.01) normrnd(0.25,0.01)]';

a40 = [normrnd(0.295,0.01) normrnd(0.325,0.01) normrnd(0.27,0.01) normrnd(0.245,0.01)]';

a50 = [normrnd(0.26,0.01) normrnd(0.29,0.01) normrnd(0.245,0.01) normrnd(0.21,0.01)]';

U = [a20,a30,a40,a50];
bar(U)
%set(gca,'xticklabel',r);
%set(gca,'XTick',1:1:4);
set(gca,'xticklabel',{'1:1.5','1:2','1:2.5','1:3'},'Fontsize',14);
legend('20%UAVs  80%BS','30%UAVs  70%BS','40%UAVs  60%BS','50%UAVs  50%BS');
xlabel('p_1/p_2');
ylabel('Revenue');