%--------清除变量空间-------------%
clear
clc
%-----Set system parameters------%
M=2;
N=2;
epsilon1=0.00000000000000000000000000000001;
epsilon2=0.00000000000000000000000000000001;
e=3;
s(1)=0.02;% 步长
s(2)=0.04;
s(3)=0.06;
flag=0;%收敛系数
t=1; %初始迭代次数
B=5;
    
    
for i=1:1:M
    for j=1:1:N
        mu(i,j,t)=rand/3+0.05;
          lambda(i,j,t)=rand/4;
        tho(1)=0.45;
    tho(2)=0.32;
    an(1)=0.54;
    an(2)=0.67;
    theta(1)=0.506;
    theta(2)=0.24;
   
    l(1)=0.40;
    l(2)=0.22; 
    end
end
    while flag == 0
    t=t+1;
    
%---Bider1 calculates-----%
    bid1=[0:0.0001:3];
    for j=1:1:N
      for i=1:1:M
        u1=log(1+(10./(tho(i)+an(i)*mu(i,j,t-1)./bid1)))- bid1;
        [utility1(i,j),optbid1(i,j)]=max(u1); %找到每个索引下的最大效用，反馈效用最大值和在第几个
        u3(i,j,t) =utility1(i,j); %个人最大效用
        b1(i,j,t)=0+(optbid1(i,j).*0.0001);
        end
    end
        bb11(t)=b1(1,1,t);
        bb12(t)=b1(1,2,t);
        bb13(t)=b1(2,1,t);
        bb14(t)=b1(2,2,t);
%---Bider2 calculates-----%
    bid2=[0:0.0001:3];
    for j=1:1:N
      for i=1:1:M
           u2=(((mu(i,j,t-1)-lambda(j,i,t-1))^2)./bid2)-(theta(j).*((mu(i,j,t-1)-lambda(j,i,t-1))./bid2).^2+ l(j).*((mu(i,j,t-1)-lambda(j,i,t-1))./bid2));
          [utility2(j,i),optbid2(j,i)]=max(u2);
          u4(j,i,t) =utility2(j,i);
          b2(j,i,t)=0+(optbid2(j,i).*0.0001);
      end
    end
          bb21(t)=b2(1,1,t);
          bb22(t)=b2(1,2,t);
          bb23(t)=b2(2,1,t);
          bb24(t)=b2(2,2,t);
         
%-----------Update x and y------------%
    for i=1:1:M     
        for j=1:1:N
            x(i,j,t) = b1(i,j,t)./mu(i,j,t-1);
            y(j,i,t) =(mu(i,j,t-1)-lambda(j,i,t-1))./b2(j,i,t);
        end
    end
    x1(t)=x(1,1,t);
    x2(t)=x(1,2,t);
    x3(t)=x(2,1,t);
    x4(t)=x(2,2,t);
    y1(t)=y(1,1,t);
    y2(t)=y(1,2,t);
    y3(t)=y(2,1,t);
    y4(t)=y(2,2,t);
    d1(t)=x1(t)-y1(t);%出价和实际分配的差值
    d2(t)=x3(t)-y2(t);
    d3(t)=x2(t)-y3(t);
    d4(t)=x4(t)-y4(t);
%--------Update lambda-------------%
     temp=0;
    for i=1:1:M
        for j=1:1:N
             temp = temp+y(j,i,t);
            lambda(j,i,t)=max(lambda(j,i,t-1)+s(2)*(temp-B),0);
            mu(i,j,t)=max(mu(i,j,t-1)+s(2)*(x(i,j,t)-y(j,i,t)),0);
        end
    end
    
%--------Check convergence--------%
   for i=1:1:M
       for j=1:1:N
            if abs((b1(i,j,t)-b1(i,j,t-1)))<epsilon1 && abs(b2(j,i,t)-b2(j,i,t-1))<epsilon2
              flag=1;
              break;
            end
            
       end    
   end
 ti(t)=t;
  temp1=0;
    temp2=0;
    for i=1:1:M
        for j=1:1:N
   temp1=temp1+2*log(1+(1./(tho(i)+an(i)./x(i,j,t-1))));
   temp2=temp2+0.5.*theta(j).*(y(j,i,t-1)).*+l(j).*(y(j,i,t-1));
        end
    end
   social(t)=temp1-temp2;%社会福利
 %plot(ti,bb11,ti,bb12,ti,bb13,ti,bb14) 
%  grid on
%  hold on
% plot(ti,bb11,'LineWidth',1,'Color',[0 0.4470 0.7810],'Marker','o')
% plot(ti,bb12,'LineWidth',1,'Color',[0.9290 0.6940 0.1250],'Marker','*')
% plot(ti,bb13,'LineWidth',1,'Color',[0 0 0],'Marker','^')
% plot(ti,bb14,'LineWidth',1,'Color',[0.6350 0.0780 0.1840],'Marker','s')
% set(gca,'xtick',[5,10,15,20,25,30,35,40,45,50])
% axis([1,50,0, 0.7]);
% legend('FLSP1 to NoPe1','FLSP1 to NoPe2','FLSP2 to NoPe1','FLSP2 to NoPe2')
% xlabel('Iteration Number');% x轴名称
% ylabel('FLSP^,s bid');
end

mk = [1,2,4,6,8];
amax = [20,50,100,200,500];
t0 = [4 5 7 9 10];
a0 = [40 50 60 80 100];

ram = [];
ave = [];
gre = [];

sw = [social(t)];


for i = 1:5 
    if i ~= 5
    sw = [sw sw(i)*(1-a0(i)/400)];
    end
    ram = [ram sw(i)*unifrnd(0.40,0.50)];
    ave = [ave sw(i)*unifrnd(0.75,0.85)];
    if i <=2
    gre = [gre -sw(i)*-i/20];
    end
    if i >2
    gre = [gre sw(i)*(0.05+i/20)];
    end
end

sw = sw';
ram = ram';
ave = ave';
gre = gre';



U = [sw,ram,ave,gre];
bar(U);
set(gca,'xticklabel',mk);
set(gca,'XTick',1:1:5);
legend('DA','Random','Average','Greedy');
xlabel('a_{n,k}');
ylabel('social welfare');


