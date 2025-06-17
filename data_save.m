%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
delay_size=[0.9, 0.85,  1.64, 1.44;
            1.1,  1.02,  1.85, 1.55;
            2.17, 2.25,  3.50, 3.05;
            3.14,  3.20,  5.80, 5.10;
            3.93,   3.80,  7.30, 6.50];
 

delay_interruption=[1.8, 1.9,  2.65, 2.65;
            1.95,  1.9,  3.85 , 3.9;
            2.25, 2.20,  4.50, 4.35;
            2.55,  2.65,  4.80, 4.96;
            2.70,   2.75,  5.30, 5.21];

delay_larger_size=[8.5, 8.2,  15.5;
            15.5,  14.0,  28.5;
            21.5, 20.5,  50;
            28.5 , 25.5 ,  70.5;
            34.5,   30,  75.5];

delay_scale=[1.8, 1.9,  2.65, 2.65;
            1.85,  1.97,  2.70 , 2.6;
            1.8, 1.95,  2.62, 2.68;
            1.76,  1.92,  2.65, 2.60;
            1.78,   1.80,  2.68, 2.62];

cost_scale=[132*10^4, 132^2*10^8,  133^2*10^8;
            198*10^4, 198^2*10^8,  196^2*10^8;
            264*10^4, 264^2*10^8,  265^2*10^8;
            330*10^4,  330^2*10^8,  330^2*10^8;];

througput_size=[1.40, 1.32,  1.30;
            2.74,  2.51,  2.55;
            4.05,  3.55,  3.35;
            5.35,  4.43,  4.90;
            6.60,   5.10,  4.90];


bar(througput_size); 
 
%set(gca,'XTickLabel',{'132(11*12)','198(11*18)','264(11*24)','330(11*30)','396(11*36)'});
%set(gca,'XTickLabel',{'1','10','20','30','40'});
%set(gca,'XTickLabel',{'0.01','0.02','0.03','0.04','0.05'});
%set(gca,'XTickLabel',{'132','198','264','330','396'});
set(gca,'XTickLabel',{'1','2','3','4','5'});

%set(gca,'YTick',10.^(4:2:12));
%set(gca,'YTickLabel',{'10^4','10^6','10^8','10^10','10^12'}); 

set(gca,'FontSize',10,'FontWeight','bold')    %对坐标轴字体大小和粗细更改
set(gcf,'color','white')
xlabel('发包频率(Hz)');
%ylabel('End-to-End Transmission Latency(s)');
ylabel('吞吐量(kbps)');
%legend('GCN-based Routing','ShortestPathFirstRouter','Source Routing Dijsktra Search Based on Temporal Graph','CGR');
legend('GCN-based Routing','Source Routing Dijsktra Search Based on Temporal Graph','CGR');
grid on
% legend('LBM','Analytic');

