clc
clear 
close all;
cd('H:\Downscaling\ensembles\caspian_basin\water budget_deterministic\new_area\probabilistic');
%save('probabilistic_csl_area_ta_inja_fl_prctile_after_eslahat');
load('probabilistic_csl_area_ta_inja_fl_prctile_after_eslahat');

cd('H:\Downscaling\ensembles\caspian_basin\water budget_deterministic\new_area\deterministic');
load('deterministic_csl_final_after_eslahat');

wbudget_d_126=wbudget_d_126(8:end,:);
wbudget_d_245=wbudget_d_245(8:end,:);
wbudget_d_370=wbudget_d_370(8:end,:);
wbudget_d_585=wbudget_d_585(8:end,:);

for k=1:10000;
for i=1:79
    cum_126_P(i,k)=cumsum(wbudget_d_126(i,k));
    cum_245_P(i,k)=cumsum(wbudget_d_245(i,k));
    cum_370_P(i,k)=cumsum(wbudget_d_370(i,k));
    cum_585_P(i,k)=cumsum(wbudget_d_585(i,k));
end
end



t1 = datetime(1988,01,15,0,0,0);
t2 = datetime(2014,12,15,0,0,0);
t = t1:years(1):t2;
t_ref=datestr(t);

tt1 = datetime(2015,01,15,0,0,0);
tt2 = datetime(2100,12,15,0,0,0);
tt = tt1:years(1):tt2;
t_scenario=datestr(tt); 

%%

cum_126_d=cum_126;
cum_245_d=cum_245;
cum_370_d=cum_370
cum_585_d=cum_585;


%126
wbudget_d_126_2=wbudget_d_126+49.5;
wbudget_d_126_3=wbudget_d_126_2';


percentiles = [99,1,95,5,83,17,50,75,25];
p_126 = zeros(9,79);


for i=1:79
p_126(:,i)= prctile(wbudget_d_126_3(1:10000,i), percentiles);
end

p_126=p_126-49.5;


for i=1:79
    p95_2(i)=sum(p_126(3,1:i));
    p5_2(i)=sum(p_126(4,1:i));
    p83_2(i)=sum(p_126(5,1:i));
    p17_2(i)=sum(p_126(6,1:i));
    p50_2(i)=sum(p_126(7,1:i));
    p75_2(i)=sum(p_126(8,1:i));
    p25_2(i)=sum(p_126(9,1:i));  
end



median_126=p50_2;
%makhachkala
%CSL2021 Makhachkala=-28.29;

p95_3=p95_2-28.29;
p5_3=p5_2-28.29;
p83_3=p83_2-28.29;
p17_3=p17_2-28.29;
p50_3=p50_2-28.29;
p75_3=p75_2-28.29;
p25_3=p25_2-28.29; 

prob_126=[p95_2',p5_2',p83_2',p17_2',p50_2',p75_2',p25_2'];
prob_126_3=[p95_3',p5_3',p83_3',p17_3',p50_3',p75_3',p25_3'];


%anzali
%CSL2021 ANZALI=-27.43
p95_4=p95_2-27.43;
p5_4=p5_2-27.43;
p83_4=p83_2-27.43;
p17_4=p17_2-27.43;
p50_4=p50_2-27.43;
p75_4=p75_2-27.43;
p25_4=p25_2-27.43; 

total_percentlies_126=[p95_4',p5_4',p83_4',p17_4',p50_4',p75_4',p25_4'];



time=tt(8:end);

figure(3)
subplot(2,2,1);

% tiledlayout(2,2);
% nexttile;
hp(1)=fill([time fliplr(time)],[smooth(p95_4)' fliplr(smooth(p5_4)')] ,'r','facealpha',.15,'EdgeColor', 'r','LineStyle','none');
hold on
hp(2)=fill([time fliplr(time)],[smooth(p83_4)' fliplr(smooth(p17_4)')] ,'r','facealpha',.2,'EdgeColor', 'r','LineStyle','none');
hold on  
hp(3)=fill([time fliplr(time)],[smooth(p75_4)' fliplr(smooth(p25_4)')] ,'r','facealpha',.25,'EdgeColor', 'r','LineStyle','none');
hold on
hp(4)=plot(time,smooth(p50_4)','--r','LineWidth',2)
hold on
set(gca,'FontName','Times New Roman','Fontsize',12); 
hold on
plot(tt(8:86),cum_126_d-27.43,'r','LineWidth',2);
hold on
ax = gca;
ax.YLim = [-70 0];
ax.FontSize =12;
tickInterval =10;
yMax = 0;
yMin =-70;
tickPositions = yMin:tickInterval:yMax;
yticks(tickPositions);

legend({'5-95th percentile' '17-83th percentile' '25-75th percentile' '50th percentile' 'Weighted MME mean'},'Orientation','vertical','Location','southwest','FontName','Times New Roman','Fontsize',12);
grid on
set(gca,'FontName','Times New Roman','FontSize',12);
title('Low emission scenario (SSP1-2.6)','FontName','Times New Roman','FontSize',14);
ylabel({'CSL relative to Shahid Rajaee Port (m)'},'FontName','Times New Roman','FontSize',12); 
xlabel({'Years'},'FontName','Times New Roman','FontSize',14);
set(gca,'linew',1);

ax2 = axes('Position', ax.Position, 'YAxisLocation', 'right', 'Color', 'none');
ax2.FontSize =12;
ax2.YLim = [-70 0];
tickInterval =10;
yMax =0;
yMin =-70;
tickPositions = yMin:tickInterval:yMax;
yticks(tickPositions);

ax2.XTick = [];
ax2.XTickLabel = [];
linkaxes([ax, ax2], 'y');
set(ax2,'FontName','Times New Roman','FontSize',12);
set(gca,'linew',1);

%makh
figure(4)
subplot(2,2,1)
% tiledlayout(2,2);
% nexttile;
hp(1)=fill([time fliplr(time)],[smooth(p95_3)' fliplr(smooth(p5_3)')] ,'r','facealpha',.15,'EdgeColor', 'r','LineStyle','none');
hold on
hp(2)=fill([time fliplr(time)],[smooth(p83_3)' fliplr(smooth(p17_3)')] ,'r','facealpha',.2,'EdgeColor', 'r','LineStyle','none');
hold on  
hp(3)=fill([time fliplr(time)],[smooth(p75_3)' fliplr(smooth(p25_3)')] ,'r','facealpha',.25,'EdgeColor', 'r','LineStyle','none');
hold on
hp(4)=plot(time,smooth(p50_3)','--r','LineWidth',2)
hold on
set(gca,'FontName','Times New Roman','Fontsize',12); 
hold on
plot(tt(8:86),cum_126_d-28.29,'r','LineWidth',2);
hold on
ax = gca;
ax.YLim = [-70 0];
ax.FontSize =12;
tickInterval =10;
yMax =0;
yMin = -70;
tickPositions = yMin:tickInterval:yMax;
yticks(tickPositions);

legend({'5-95th percentile' '17-83th percentile' '25-75th percentile' '50th percentile' 'Weighted MME mean'},'Orientation','vertical','Location','southwest','FontName','Times New Roman','Fontsize',12);
grid on
set(gca,'FontName','Times New Roman','FontSize',12);
title('Low emission scenario (SSP1-2.6)','FontName','Times New Roman','FontSize',14);
ylabel({'CSL in Baltic system (m)'},'FontName','Times New Roman','FontSize',14); 
xlabel({'Years'},'FontName','Times New Roman','FontSize',14);
set(gca,'linew',1);
time=tt(8:end);

ax2 = axes('Position', ax.Position, 'YAxisLocation', 'right', 'Color', 'none');
ax2.FontSize =12;
ax2.YLim = [-70 0];
tickInterval =10;
yMax =0;
yMin =-70;
tickPositions = yMin:tickInterval:yMax;
yticks(tickPositions);

ax2.XTick = [];
ax2.XTickLabel = [];
linkaxes([ax, ax2], 'y');
set(ax2,'FontName','Times New Roman','FontSize',12);
set(gca,'linew',1);

figure(5)
subplot(2,2,1)
% tiledlayout(2,2);
% nexttile;
hp(1)=fill([time fliplr(time)],[smooth(p95_2)' fliplr(smooth(p5_2)')] ,'r','facealpha',.15,'EdgeColor', 'r','LineStyle','none');
hold on
hp(2)=fill([time fliplr(time)],[smooth(p83_2)' fliplr(smooth(p17_2)')] ,'r','facealpha',.2,'EdgeColor', 'r','LineStyle','none');
hold on  
hp(3)=fill([time fliplr(time)],[smooth(p75_2)' fliplr(smooth(p25_2)')] ,'r','facealpha',.25,'EdgeColor', 'r','LineStyle','none');
hold on
hp(4)=plot(time,smooth(p50_2)','--r','LineWidth',2)
hold on
set(gca,'FontName','Times New Roman','Fontsize',12); 
hold on
plot(tt(8:86),cum_126_d,'r','LineWidth',2);
hold on
ax = gca;
ax.YLim = [-40 30];
ax.FontSize =12;
tickInterval =10;
yMax = 30;
yMin = -40;
tickPositions = yMin:tickInterval:yMax;
yticks(tickPositions);

legend({'5-95th percentile' '17-83th percentile' '25-75th percentile' '50th percentile' 'Weighted MME mean'},'Orientation','vertical','Location','southwest','FontName','Times New Roman','Fontsize',12);
grid on
set(gca,'FontName','Times New Roman','FontSize',12);
title('Low emission scenario (SSP1-2.6)','FontName','Times New Roman','FontSize',14);
ylabel({'CSL Changes (m)'},'FontName','Times New Roman','FontSize',14); 
xlabel({'Years'},'FontName','Times New Roman','FontSize',14);
set(gca,'linew',1);

ax2 = axes('Position', ax.Position, 'YAxisLocation', 'right', 'Color', 'none');
ax2.FontSize =12;
ax2.YLim = [-40 30];
tickInterval =10;
yMax =30;
yMin =-40;
tickPositions = yMin:tickInterval:yMax;
yticks(tickPositions);

ax2.XTick = [];
ax2.XTickLabel = [];
linkaxes([ax, ax2], 'y');
set(ax2,'FontName','Times New Roman','FontSize',12);
set(gca,'linew',1);

year=[2030:10:2100];


range_126=zeros(6,8);
for i=1:8;
range_126(1,i)=round(p95_2(9+(i-1)*10),1);
range_126(2,i)=round(p5_2(9+(i-1)*10),1);
range_126(3,i)=round(p83_2(9+(i-1)*10),1);
range_126(4,i)=round(p17_2(9+(i-1)*10),1);
range_126(5,i)=round(p50_2(9+(i-1)*10),1);
range_126(6,i)=round(cum_126_d(9+(i-1)*10),1);
end

range_126_2 = cell(2, 8);

for i = 1:8
    range_126_2{1,i} = [num2str(range_126(2, i)), '   -   ', num2str(range_126(1, i))];
    range_126_2{2,i} = [num2str(range_126(4, i)), '   -   ', num2str(range_126(3, i))];
end

range_126_3 = {num2str(year'),range_126_2', num2str(range_126(5,:)','%g'), num2str(range_126(6,:)','%g')};

range_126=zeros(6,8);
for i=1:8;
range_126(1,i)=round(p95_3(9+(i-1)*10),1);
range_126(2,i)=round(p5_3(9+(i-1)*10),1);
range_126(3,i)=round(p83_3(9+(i-1)*10),1);
range_126(4,i)=round(p17_3(9+(i-1)*10),1);
range_126(5,i)=round(p50_3(9+(i-1)*10),1);
range_126(6,i)=round(cum_126_d(9+(i-1)*10)-28.29,1);
end

range_126_2 = cell(2, 8);

for i = 1:8
    range_126_2{1,i} = [num2str(range_126(2, i)), '   -   ', num2str(range_126(1, i))];
    range_126_2{2,i} = [num2str(range_126(4, i)), '   -   ', num2str(range_126(3, i))];
end


%baltic
range_126_3_3 = {num2str(year'),range_126_2', num2str(range_126(5,:)','%g'), num2str(range_126(6,:)','%g')};
 

range_126=zeros(6,8);
for i=1:8;
range_126(1,i)=round(p95_4(9+(i-1)*10),1);
range_126(2,i)=round(p5_4(9+(i-1)*10),1);
range_126(3,i)=round(p83_4(9+(i-1)*10),1);
range_126(4,i)=round(p17_4(9+(i-1)*10),1);
range_126(5,i)=round(p50_4(9+(i-1)*10),1);
range_126(6,i)=round(cum_126_d(9+(i-1)*10)-27.43,1);
end

range_126_2 = cell(2, 8);

for i = 1:8
    range_126_2{1,i} = [num2str(range_126(2, i)), '   -   ', num2str(range_126(1, i))];
    range_126_2{2,i} = [num2str(range_126(4, i)), '   -   ', num2str(range_126(3, i))];
end
%rajaee
range_126_3_4 = {num2str(year'),range_126_2', num2str(range_126(5,:)','%g'), num2str(range_126(6,:)','%g')};

%%
%245
wbudget_d_245_2=wbudget_d_245+20.5;
wbudget_d_245_3=wbudget_d_245_2';

for i=1:79
p_245(:,i)= prctile(wbudget_d_245_3(1:10000,i), percentiles);
end

p_245=p_245-20.5;


for i=1:79
    p95_2(i)=sum(p_245(3,1:i));
    p5_2(i)=sum(p_245(4,1:i));
    p83_2(i)=sum(p_245(5,1:i));
    p17_2(i)=sum(p_245(6,1:i));
    p50_2(i)=sum(p_245(7,1:i));
    p75_2(i)=sum(p_245(8,1:i));
    p25_2(i)=sum(p_245(9,1:i));  
end

median_245=p50_2;
%makhachkala
%CSL2021 Makhachkala=-28.29;

p95_3=p95_2-28.29;
p5_3=p5_2-28.29;
p83_3=p83_2-28.29;
p17_3=p17_2-28.29;
p50_3=p50_2-28.29;
p75_3=p75_2-28.29;
p25_3=p25_2-28.29; 

prob_245=[p95_2',p5_2',p83_2',p17_2',p50_2',p75_2',p25_2'];
prob_245_3=[p95_3',p5_3',p83_3',p17_3',p50_3',p75_3',p25_3'];


%anzali
%CSL2021 ANZALI=-27.43
p95_4=p95_2-27.43;
p5_4=p5_2-27.43;
p83_4=p83_2-27.43;
p17_4=p17_2-27.43;
p50_4=p50_2-27.43;
p75_4=p75_2-27.43;
p25_4=p25_2-27.43; 



total_percentlies_245=[p95_4',p5_4',p83_4',p17_4',p50_4',p75_4',p25_4'];





%anzali
figure(3)
subplot(2,2,2)
% nexttile;
hp(1)=fill([time fliplr(time)],[smooth(p95_4)' fliplr(smooth(p5_4)')] ,[0.9290 0.6940 0.1250],'facealpha',.15,'EdgeColor',[0.9290 0.6940 0.1250],'LineStyle','none');
hold on
hp(2)=fill([time fliplr(time)],[smooth(p83_4)' fliplr(smooth(p17_4)')] ,[0.9290 0.6940 0.1250],'facealpha',.2,'EdgeColor',[0.9290 0.6940 0.1250],'LineStyle','none');
hold on  
hp(3)=fill([time fliplr(time)],[smooth(p75_4)' fliplr(smooth(p25_4)')] ,[0.9290 0.6940 0.1250],'facealpha',.25,'EdgeColor',[0.9290 0.6940 0.1250],'LineStyle','none');
hold on
hp(4)=plot(time,smooth(p50_4)','color',[0.9290 0.6940 0.1250],'linestyle','--','LineWidth',2)
hold on
set(gca,'FontName','Times New Roman','Fontsize',12); 
hold on
plot(tt(8:86),cum_245_d-28.29,'color',[0.9290 0.6940 0.1250],'LineWidth',2);
hold on
ax = gca;
ax.YLim = [-70 0];
ax.FontSize =12;
tickInterval =10;
yMax = 0;
yMin = -70;
tickPositions = yMin:tickInterval:yMax;
yticks(tickPositions);

legend({'5-95th percentile' '17-83th percentile' '25-75th percentile' '50th percentile' 'Weighted MME mean'},'Orientation','vertical','Location','southwest','FontName','Times New Roman','Fontsize',12);
grid on
set(gca,'FontName','Times New Roman','FontSize',12);
title('Medium emission scenario (SSP2-4.5)','FontName','Times New Roman','FontSize',14);
ylabel({'CSL relative to Shahid Rajaee Port (m)'},'FontName','Times New Roman','FontSize',12); 
xlabel({'Years'},'FontName','Times New Roman','FontSize',14);
set(gca,'linew',1);

ax2 = axes('Position', ax.Position, 'YAxisLocation', 'right', 'Color', 'none');
ax2.FontSize =12;
ax2.YLim = [-70 0];
tickInterval =10;
yMax =0;
yMin =-70;
tickPositions = yMin:tickInterval:yMax;
yticks(tickPositions);
ax2.XTick = [];
ax2.XTickLabel = [];
linkaxes([ax, ax2], 'y');
set(ax2,'FontName','Times New Roman','FontSize',12);
set(gca,'linew',1);

%makh
figure(4)
subplot(2,2,2)
% nexttile;
hp(1)=fill([time fliplr(time)],[smooth(p95_3)' fliplr(smooth(p5_3)')] ,[0.9290 0.6940 0.1250],'facealpha',.15,'EdgeColor',[0.9290 0.6940 0.1250],'LineStyle','none');
hold on
hp(2)=fill([time fliplr(time)],[smooth(p83_3)' fliplr(smooth(p17_3)')] ,[0.9290 0.6940 0.1250],'facealpha',.2,'EdgeColor',[0.9290 0.6940 0.1250],'LineStyle','none');
hold on  
hp(3)=fill([time fliplr(time)],[smooth(p75_3)' fliplr(smooth(p25_3)')] ,[0.9290 0.6940 0.1250],'facealpha',.25,'EdgeColor',[0.9290 0.6940 0.1250],'LineStyle','none');
hold on
hp(4)=plot(time,smooth(p50_3)','color',[0.9290 0.6940 0.1250],'linestyle','--','LineWidth',2)
hold on
set(gca,'FontName','Times New Roman','Fontsize',12); 
hold on
plot(tt(8:86),cum_245_d-27.43,'color',[0.9290 0.6940 0.1250],'LineWidth',2);
hold on
ax = gca;
ax.YLim = [-70 0];
ax.FontSize =12;
tickInterval =10;
yMax = 0;
yMin = -70;
tickPositions = yMin:tickInterval:yMax;
yticks(tickPositions);

legend({'5-95th percentile' '17-83th percentile' '25-75th percentile' '50th percentile' 'Weighted MME mean'},'Orientation','vertical','Location','southwest','FontName','Times New Roman','Fontsize',12);
grid on
set(gca,'FontName','Times New Roman','FontSize',12);
title('Medium emission scenario (SSP2-4.5)','FontName','Times New Roman','FontSize',14);
ylabel({'CSL in Baltic system (m)'},'FontName','Times New Roman','FontSize',14); 
xlabel({'Years'},'FontName','Times New Roman','FontSize',14);
set(gca,'linew',1);

ax2 = axes('Position', ax.Position, 'YAxisLocation', 'right', 'Color', 'none');
ax2.FontSize =12;
ax2.YLim = [-70 0];
tickInterval =10;
yMax =0;
yMin =-70;
tickPositions = yMin:tickInterval:yMax;
yticks(tickPositions);
ax2.XTick = [];
ax2.XTickLabel = [];
linkaxes([ax, ax2], 'y');
set(ax2,'FontName','Times New Roman','FontSize',12);
set(gca,'linew',1);

figure(5)
subplot(2,2,2)
% nexttile;
hp(1)=fill([time fliplr(time)],[smooth(p95_2)' fliplr(smooth(p5_2)')] ,[0.9290 0.6940 0.1250],'facealpha',.15,'EdgeColor',[0.9290 0.6940 0.1250],'LineStyle','none');
hold on
hp(2)=fill([time fliplr(time)],[smooth(p83_2)' fliplr(smooth(p17_2)')] ,[0.9290 0.6940 0.1250],'facealpha',.2,'EdgeColor',[0.9290 0.6940 0.1250],'LineStyle','none');
hold on  
hp(3)=fill([time fliplr(time)],[smooth(p75_2)' fliplr(smooth(p25_2)')] ,[0.9290 0.6940 0.1250],'facealpha',.25,'EdgeColor',[0.9290 0.6940 0.1250],'LineStyle','none');
hold on
hp(4)=plot(time,smooth(p50_2)','color',[0.9290 0.6940 0.1250],'linestyle','--','LineWidth',2)
hold on
set(gca,'FontName','Times New Roman','Fontsize',12); 
hold on
plot(tt(8:86),cum_245_d,'color',[0.9290 0.6940 0.1250],'LineWidth',2);
hold on
ax = gca;
ax.YLim = [-40 30];
ax.FontSize =12;
tickInterval =10;
yMax = 30;
yMin = -40;
tickPositions = yMin:tickInterval:yMax;
yticks(tickPositions);

legend({'5-95th percentile' '17-83th percentile' '25-75th percentile' '50th percentile' 'Weighted MME mean'},'Orientation','vertical','Location','southwest','FontName','Times New Roman','Fontsize',12);
grid on
set(gca,'FontName','Times New Roman','FontSize',12);
title('Medium emission scenario (SSP2-4.5)','FontName','Times New Roman','FontSize',14);
ylabel({'CSL Changes (m)'},'FontName','Times New Roman','FontSize',14); 
xlabel({'Years'},'FontName','Times New Roman','FontSize',14);
set(gca,'linew',1);

ax2 = axes('Position', ax.Position, 'YAxisLocation', 'right', 'Color', 'none');
ax2.FontSize =12;
ax2.YLim = [-40 30];
tickInterval =10;
yMax =30;
yMin =-40;
tickPositions = yMin:tickInterval:yMax;
yticks(tickPositions);
ax2.XTick = [];
ax2.XTickLabel = [];
linkaxes([ax, ax2], 'y');
set(ax2,'FontName','Times New Roman','FontSize',12);
set(gca,'linew',1);


range_245=zeros(6,8);
for i=1:8;
range_245(1,i)=round(p95_2(9+(i-1)*10),1);
range_245(2,i)=round(p5_2(9+(i-1)*10),1);

range_245(3,i)=round(p83_2(9+(i-1)*10),1);
range_245(4,i)=round(p17_2(9+(i-1)*10),1);

range_245(5,i)=round(p50_2(9+(i-1)*10),1);
range_245(6,i)=round(cum_245_d(9+(i-1)*10),1);
end

range_245_2 = cell(2, 8);

for i = 1:8
    range_245_2{1,i} = [num2str(range_245(2, i)), '   -   ', num2str(range_245(1, i))];
    range_245_2{2,i} = [num2str(range_245(4, i)), '   -   ', num2str(range_245(3, i))];
end

range_245_3 = {range_245_2', num2str(range_245(5,:)','%g'), num2str(range_245(6,:)','%g')};

range_245=zeros(6,8);
for i=1:8;
range_245(1,i)=round(p95_3(9+(i-1)*10),1);
range_245(2,i)=round(p5_3(9+(i-1)*10),1);
range_245(3,i)=round(p83_3(9+(i-1)*10),1);
range_245(4,i)=round(p17_3(9+(i-1)*10),1);
range_245(5,i)=round(p50_3(9+(i-1)*10),1);
range_245(6,i)=round(cum_245_d(9+(i-1)*10)-28.29,1);
end

range_245_2 = cell(2, 8);

for i = 1:8
    range_245_2{1,i} = [num2str(range_245(2, i)), '   -   ', num2str(range_245(1, i))];
    range_245_2{2,i} = [num2str(range_245(4, i)), '   -   ', num2str(range_245(3, i))];
end

range_245_3_3 = {num2str(year'),range_245_2', num2str(range_245(5,:)','%g'), num2str(range_245(6,:)','%g')};
 

range_245=zeros(6,8);
for i=1:8;
range_245(1,i)=round(p95_4(9+(i-1)*10),1);
range_245(2,i)=round(p5_4(9+(i-1)*10),1);
range_245(3,i)=round(p83_4(9+(i-1)*10),1);
range_245(4,i)=round(p17_4(9+(i-1)*10),1);
range_245(5,i)=round(p50_4(9+(i-1)*10),1);
range_245(6,i)=round(cum_245_d(9+(i-1)*10)-27.43,1);
end

range_245_2 = cell(2, 8);

for i = 1:8
    range_245_2{1,i} = [num2str(range_245(2, i)), '   -   ', num2str(range_245(1, i))];
    range_245_2{2,i} = [num2str(range_245(4, i)), '   -   ', num2str(range_245(3, i))];
end

range_245_3_4 = {num2str(year'),range_245_2', num2str(range_245(5,:)','%g'), num2str(range_245(6,:)','%g')};
%%
%370
wbudget_d_370_2=wbudget_d_370+14.6;
wbudget_d_370_3=wbudget_d_370_2';

p_370 = zeros(9,79);


for i=1:79
p_370(:,i)= prctile(wbudget_d_370_3(1:10000,i), percentiles);
end

p_370=p_370-14.6;


for i=1:79
    p95_2(i)=sum(p_370(3,1:i));
    p5_2(i)=sum(p_370(4,1:i));
    p83_2(i)=sum(p_370(5,1:i));
    p17_2(i)=sum(p_370(6,1:i));
    p50_2(i)=sum(p_370(7,1:i));
    p75_2(i)=sum(p_370(8,1:i));
    p25_2(i)=sum(p_370(9,1:i));  
end

median_370=p50_2;

%makhachkala
%CSL2021 Makhachkala=-28.29;

p95_3=p95_2-28.29;
p5_3=p5_2-28.29;
p83_3=p83_2-28.29;
p17_3=p17_2-28.29;
p50_3=p50_2-28.29;
p75_3=p75_2-28.29;
p25_3=p25_2-28.29; 

prob_370=[p95_2',p5_2',p83_2',p17_2',p50_2',p75_2',p25_2'];
prob_370_3=[p95_3',p5_3',p83_3',p17_3',p50_3',p75_3',p25_3'];




%anzali
%CSL2021 ANZALI=-27.43
p95_4=p95_2-27.43;
p5_4=p5_2-27.43;
p83_4=p83_2-27.43;
p17_4=p17_2-27.43;
p50_4=p50_2-27.43;
p75_4=p75_2-27.43;
p25_4=p25_2-27.43; 

total_percentlies_370=[p95_4',p5_4',p83_4',p17_4',p50_4',p75_4',p25_4'];




figure(3)
subplot(2,2,3);
% nexttile;
hp(1)=fill([time fliplr(time)],[smooth(p95_4)' fliplr(smooth(p5_4)')] ,'b','facealpha',.15,'EdgeColor', 'b','LineStyle','none');
hold on
hp(2)=fill([time fliplr(time)],[smooth(p83_4)' fliplr(smooth(p17_4)')] ,'b','facealpha',.2,'EdgeColor', 'b','LineStyle','none');
hold on  
hp(3)=fill([time fliplr(time)],[smooth(p75_4)' fliplr(smooth(p25_4)')] ,'b','facealpha',.25,'EdgeColor', 'b','LineStyle','none');
hold on
hp(4)=plot(time,smooth(p50_4)','--b','LineWidth',2)
hold on
set(gca,'FontName','Times New Roman','Fontsize',12); 
hold on
plot(tt(8:86),cum_370_d-27.43,'b','LineWidth',2);
hold on
ax = gca;
ax.YLim = [-70 0];
ax.FontSize =12;
tickInterval =10;
yMax = 0;
yMin = -70;
tickPositions = yMin:tickInterval:yMax;
yticks(tickPositions);

legend({'5-95th percentile' '17-83th percentile' '25-75th percentile' '50th percentile' 'Weighted MME mean'},'Orientation','vertical','Location','southwest','FontName','Times New Roman','Fontsize',12);
grid on
set(gca,'FontName','Times New Roman','FontSize',12);
title('Medium-to-high emission scenario (SSP3-7.0)','FontName','Times New Roman','FontSize',14);
ylabel({'CSL relative to Shahid Rajaee Port (m)'},'FontName','Times New Roman','FontSize',12); 
xlabel({'Years'},'FontName','Times New Roman','FontSize',14);
set(gca,'linew',1);

ax2 = axes('Position', ax.Position, 'YAxisLocation', 'right', 'Color', 'none');
ax2.FontSize =12;
ax2.YLim = [-70 0];
tickInterval =10;
yMax =0;
yMin =-70;
tickPositions = yMin:tickInterval:yMax;
yticks(tickPositions);
 
ax2.XTick = [];
ax2.XTickLabel = [];
linkaxes([ax, ax2], 'y');
set(ax2,'FontName','Times New Roman','FontSize',12);
set(gca,'linew',1);


%makh
figure(4)
subplot(2,2,3);
% nexttile;
hp(1)=fill([time fliplr(time)],[smooth(p95_3)' fliplr(smooth(p5_3)')] ,'b','facealpha',.15,'EdgeColor', 'b','LineStyle','none');
hold on
hp(2)=fill([time fliplr(time)],[smooth(p83_3)' fliplr(smooth(p17_3)')] ,'b','facealpha',.2,'EdgeColor', 'b','LineStyle','none');
hold on  
hp(3)=fill([time fliplr(time)],[smooth(p75_3)' fliplr(smooth(p25_3)')] ,'b','facealpha',.25,'EdgeColor', 'b','LineStyle','none');
hold on
hp(4)=plot(time,smooth(p50_3)','--b','LineWidth',2)
hold on
set(gca,'FontName','Times New Roman','Fontsize',12); 
hold on
plot(tt(8:86),cum_370_d-28.29,'b','LineWidth',2);
hold on
ax = gca;
ax.YLim = [-70 0];
ax.FontSize =12;
tickInterval =10;
yMax = 0;
yMin = -70;
tickPositions = yMin:tickInterval:yMax;
yticks(tickPositions);

legend({'5-95th percentile' '17-83th percentile' '25-75th percentile' '50th percentile' 'Weighted MME mean'},'Orientation','vertical','Location','southwest','FontName','Times New Roman','Fontsize',12);
grid on
set(gca,'FontName','Times New Roman','FontSize',12);
title('Medium-to-high emission scenario (SSP3-7.0)','FontName','Times New Roman','FontSize',14);
ylabel({'CSL in Baltic system (m)'},'FontName','Times New Roman','FontSize',14); 
xlabel({'Years'},'FontName','Times New Roman','FontSize',14);
set(gca,'linew',1);

ax2 = axes('Position', ax.Position, 'YAxisLocation', 'right', 'Color', 'none');
ax2.FontSize =12;
ax2.YLim = [-70 0];
tickInterval =10;
yMax =0;
yMin =-70;
tickPositions = yMin:tickInterval:yMax;
yticks(tickPositions);
 
ax2.XTick = [];
ax2.XTickLabel = [];
linkaxes([ax, ax2], 'y');
set(ax2,'FontName','Times New Roman','FontSize',12);
set(gca,'linew',1);

time=tt(8:end);

figure(5)
subplot(2,2,3);
% nexttile;
hp(1)=fill([time fliplr(time)],[smooth(p95_2)' fliplr(smooth(p5_2)')] ,'b','facealpha',.15,'EdgeColor', 'b','LineStyle','none');
hold on
hp(2)=fill([time fliplr(time)],[smooth(p83_2)' fliplr(smooth(p17_2)')] ,'b','facealpha',.2,'EdgeColor', 'b','LineStyle','none');
hold on  
hp(3)=fill([time fliplr(time)],[smooth(p75_2)' fliplr(smooth(p25_2)')] ,'b','facealpha',.25,'EdgeColor', 'b','LineStyle','none');
hold on
hp(4)=plot(time,smooth(p50_2)','--b','LineWidth',2)
hold on
plot(tt(8:86),cum_370_d,'b','LineWidth',2);
hold on

ax = gca;
ax.YLim = [-40 30];
ax.FontSize =12;
tickInterval =10;
yMax = 30;
yMin = -40;
tickPositions = yMin:tickInterval:yMax;
yticks(tickPositions);

legend({'5-95th percentile' '17-83th percentile' '25-75th percentile' '50th percentile' 'Weighted MME mean'},'Orientation','vertical','Location','southwest','FontName','Times New Roman','Fontsize',12);
%legend({'SSP5-8.5 (17-83th percentile)' 'SSP5-8.5 (5-95th percentile)' 'SSP5-8.5 (50th percentile)' 'SSP5-8.5 (Weighted MME mean)'},'Orientation','vertical','Location','southwest','FontName','Times New Roman','Fontsize',10);
grid on
% figure(4)
% hp(2)=fill([time fliplr(time)],[smooth(p83_2)' fliplr(smooth(p17_2)')] ,'g','facealpha',.1,'EdgeColor', 'g','LineStyle','none');
% hold on 
% hp(3)=plot(time,smooth(p50_2)','--g','LineWidth',2)
% hold on
% set(gca,'FontName','Times New Roman','Fontsize',12); 
% hold on

% plot(tt(8:86),cum_370_d,'g','LineWidth',2);
% hold on
grid on 
set(gca,'FontName','Times New Roman','FontSize',12);
title('Medium-to-high emission scenario (SSP3-7.0)','FontName','Times New Roman','FontSize',14);
ylabel({'CSL Changes (m)'},'FontName','Times New Roman','FontSize',14); 
xlabel({'Years'},'FontName','Times New Roman','FontSize',14);
set(gca,'linew',1);

ax2 = axes('Position', ax.Position, 'YAxisLocation', 'right', 'Color', 'none');
ax2.FontSize =12;
ax2.YLim = [-40 30];
tickInterval =10;
yMax =30;
yMin =-40;
tickPositions = yMin:tickInterval:yMax;
yticks(tickPositions);
 
ax2.XTick = [];
ax2.XTickLabel = [];
linkaxes([ax, ax2], 'y');
set(ax2,'FontName','Times New Roman','FontSize',12);
set(gca,'linew',1);

range_370=zeros(6,8);
for i=1:8;
range_370(1,i)=round(p95_2(9+(i-1)*10),1);
range_370(2,i)=round(p5_2(9+(i-1)*10),1);

range_370(3,i)=round(p83_2(9+(i-1)*10),1);
range_370(4,i)=round(p17_2(9+(i-1)*10),1);

range_370(5,i)=round(p50_2(9+(i-1)*10),1);
range_370(6,i)=round(cum_370_d(9+(i-1)*10),1);
end

range_370_2 = cell(2, 8);

for i = 1:8
    range_370_2{1,i} = [num2str(range_370(2, i)), '   -   ', num2str(range_370(1, i))];
    range_370_2{2,i} = [num2str(range_370(4, i)), '   -   ', num2str(range_370(3, i))];
end

range_370_3 = {num2str(year'),range_370_2', num2str(range_370(5,:)','%g'), num2str(range_370(6,:)','%g')};

range_370=zeros(6,8);
for i=1:8;
range_370(1,i)=round(p95_3(9+(i-1)*10),1);
range_370(2,i)=round(p5_3(9+(i-1)*10),1);
range_370(3,i)=round(p83_3(9+(i-1)*10),1);
range_370(4,i)=round(p17_3(9+(i-1)*10),1);
range_370(5,i)=round(p50_3(9+(i-1)*10),1);
range_370(6,i)=round(cum_370_d(9+(i-1)*10)-28.29,1);
end

range_370_2 = cell(2, 8);

for i = 1:8
    range_370_2{1,i} = [num2str(range_370(2, i)), '   -   ', num2str(range_370(1, i))];
    range_370_2{2,i} = [num2str(range_370(4, i)), '   -   ', num2str(range_370(3, i))];
end

range_370_3_3 = {num2str(year'),range_370_2', num2str(range_370(5,:)','%g'), num2str(range_370(6,:)','%g')};
 

range_370=zeros(6,8);
for i=1:8;
range_370(1,i)=round(p95_4(9+(i-1)*10),1);
range_370(2,i)=round(p5_4(9+(i-1)*10),1);
range_370(3,i)=round(p83_4(9+(i-1)*10),1);
range_370(4,i)=round(p17_4(9+(i-1)*10),1);
range_370(5,i)=round(p50_4(9+(i-1)*10),1);
range_370(6,i)=round(cum_370_d(9+(i-1)*10)-27.43,1);
end

range_370_2 = cell(2, 8);

for i = 1:8
    range_370_2{1,i} = [num2str(range_370(2, i)), '   -   ', num2str(range_370(1, i))];
    range_370_2{2,i} = [num2str(range_370(4, i)), '   -   ', num2str(range_370(3, i))];
end

range_370_3_4 = {num2str(year'),range_370_2', num2str(range_370(5,:)','%g'), num2str(range_370(6,:)','%g')};
%%
%585
wbudget_d_585_2=wbudget_d_585+3.5;
wbudget_d_585_3=wbudget_d_585_2';

for i=1:79
p_585(:,i)= prctile(wbudget_d_585_3(1:10000,i), percentiles);
end

p_585=p_585-3.5;


for i=1:79
    p95_2(i)=sum(p_585(3,1:i));
    p5_2(i)=sum(p_585(4,1:i));
    p83_2(i)=sum(p_585(5,1:i));
    p17_2(i)=sum(p_585(6,1:i));
    p50_2(i)=sum(p_585(7,1:i));
    p75_2(i)=sum(p_585(8,1:i));
    p25_2(i)=sum(p_585(9,1:i));  
end

median_585=p50_2;

%makhachkala
%CSL2021 Makhachkala=-28.29;

p95_3=p95_2-28.29;
p5_3=p5_2-28.29;
p83_3=p83_2-28.29;
p17_3=p17_2-28.29;
p50_3=p50_2-28.29;
p75_3=p75_2-28.29;
p25_3=p25_2-28.29; 


prob_585=[p95_2',p5_2',p83_2',p17_2',p50_2',p75_2',p25_2'];
prob_585_3=[p95_3',p5_3',p83_3',p17_3',p50_3',p75_3',p25_3'];


%anzali
%CSL2021 ANZALI=-27.43
p95_4=p95_2-27.43;
p5_4=p5_2-27.43;
p83_4=p83_2-27.43;
p17_4=p17_2-27.43;
p50_4=p50_2-27.43;
p75_4=p75_2-27.43;
p25_4=p25_2-27.43; 

time=tt(8:end);
total_percentlies_585=[p95_4',p5_4',p83_4',p17_4',p50_4',p75_4',p25_4'];


%anzali
figure(3)
subplot(2,2,4);
% nexttile;
hp(1)=fill([time fliplr(time)],[smooth(p95_4)' fliplr(smooth(p5_4)')] ,[0 0.5 0],'facealpha',.15,'EdgeColor',[0 0.5 0],'LineStyle','none');
hold on
hp(2)=fill([time fliplr(time)],[smooth(p83_4)' fliplr(smooth(p17_4)')] ,[0 0.5 0],'facealpha',.2,'EdgeColor',[0 0.5 0],'LineStyle','none');
hold on  
hp(3)=fill([time fliplr(time)],[smooth(p75_4)' fliplr(smooth(p25_4)')] ,[0 0.5 0],'facealpha',.25,'EdgeColor',[0 0.5 0],'LineStyle','none');
hold on
hp(4)=plot(time,smooth(p50_4)','color',[0 0.5 0],'linestyle','--','LineWidth',2)
hold on
set(gca,'FontName','Times New Roman','Fontsize',12); 
hold on
plot(tt(8:86),cum_245_d-28.29,'color',[0 0.5 0],'LineWidth',2);
hold on
ax = gca;
ax.YLim = [-70 0];
ax.FontSize =12;
tickInterval =10;
yMax = 0;
yMin = -70;
tickPositions = yMin:tickInterval:yMax;
yticks(tickPositions);

legend({'5-95th percentile' '17-83th percentile' '25-75th percentile' '50th percentile' 'Weighted MME mean'},'Orientation','vertical','Location','southwest','FontName','Times New Roman','Fontsize',12);
grid on
set(gca,'FontName','Times New Roman','FontSize',12);
title('High emission scenario (SSP5-8.5)','FontName','Times New Roman','FontSize',14);
ylabel({'CSL relative to Shahid Rajaee Port (m)'},'FontName','Times New Roman','FontSize',12); 
xlabel({'Years'},'FontName','Times New Roman','FontSize',14);
set(gca,'linew',1);

ax2 = axes('Position', ax.Position, 'YAxisLocation', 'right', 'Color', 'none');
ax2.FontSize =12;
ax2.YLim = [-70 0];
tickInterval =10;
yMax =0;
yMin =-70;
tickPositions = yMin:tickInterval:yMax;
yticks(tickPositions);
 
ax2.XTick = [];
ax2.XTickLabel = [];
linkaxes([ax, ax2], 'y');
set(ax2,'FontName','Times New Roman','FontSize',12);
set(gca,'linew',1);

%makh
figure(4)
subplot(2,2,4);
% nexttile;
hp(1)=fill([time fliplr(time)],[smooth(p95_3)' fliplr(smooth(p5_3)')] ,[0 0.5 0],'facealpha',.15,'EdgeColor',[0 0.5 0],'LineStyle','none');
hold on
hp(2)=fill([time fliplr(time)],[smooth(p83_3)' fliplr(smooth(p17_3)')] ,[0 0.5 0],'facealpha',.2,'EdgeColor',[0 0.5 0],'LineStyle','none');
hold on  
hp(3)=fill([time fliplr(time)],[smooth(p75_3)' fliplr(smooth(p25_3)')] ,[0 0.5 0],'facealpha',.25,'EdgeColor',[0 0.5 0],'LineStyle','none');
hold on
hp(4)=plot(time,smooth(p50_3)','color',[0 0.5 0],'linestyle','--','LineWidth',2)
hold on
set(gca,'FontName','Times New Roman','Fontsize',12); 
hold on
plot(tt(8:86),cum_245_d-27.43,'color',[0 0.5 0],'LineWidth',2);
hold on
ax = gca;
ax.YLim = [-70 0];
ax.FontSize =12;
tickInterval =10;
yMax = 0;
yMin = -70;
tickPositions = yMin:tickInterval:yMax;
yticks(tickPositions);

legend({'5-95th percentile' '17-83th percentile' '25-75th percentile' '50th percentile' 'Weighted MME mean'},'Orientation','vertical','Location','southwest','FontName','Times New Roman','Fontsize',12);
grid on
set(gca,'FontName','Times New Roman','FontSize',12);
title('High emission scenario (SSP5-8.5)','FontName','Times New Roman','FontSize',14);
ylabel({'CSL in Baltic system (m)'},'FontName','Times New Roman','FontSize',14); 
xlabel({'Years'},'FontName','Times New Roman','FontSize',14);
set(gca,'linew',1);

ax2 = axes('Position', ax.Position, 'YAxisLocation', 'right', 'Color', 'none');
ax2.FontSize =12;
ax2.YLim = [-70 0];
tickInterval =10;
yMax =0;
yMin =-70;
tickPositions = yMin:tickInterval:yMax;
yticks(tickPositions);
 
ax2.XTick = [];
ax2.XTickLabel = [];
linkaxes([ax, ax2], 'y');
set(ax2,'FontName','Times New Roman','FontSize',12);
set(gca,'linew',1);

figure(5)
subplot(2,2,4);
% nexttile;
hp(1)=fill([time fliplr(time)],[smooth(p95_2)' fliplr(smooth(p5_2)')] ,[0 0.5 0],'facealpha',.15,'EdgeColor', 'r','LineStyle','none');
hold on
hp(2)=fill([time fliplr(time)],[smooth(p83_2)' fliplr(smooth(p17_2)')] ,[0 0.5 0],'facealpha',.2,'EdgeColor', 'r','LineStyle','none');
hold on  
hp(3)=fill([time fliplr(time)],[smooth(p75_2)' fliplr(smooth(p25_2)')] ,[0 0.5 0],'facealpha',.25,'EdgeColor', 'r','LineStyle','none');
hold on
hp(4)=plot(time,smooth(p50_2)','color',[0 0.5 0],'linestyle','--','LineWidth',2)
set(gca,'FontName','Times New Roman','Fontsize',12); 
hold on
plot(tt(8:86),cum_585_d,'color',[0 0.5 0],'LineWidth',2);
hold on

ax = gca;
ax.YLim = [-40 30];
ax.FontSize =12;
tickInterval =10;
yMax = 30;
yMin = -40;
tickPositions = yMin:tickInterval:yMax;
yticks(tickPositions);

legend({'5-95th percentile' '17-83th percentile' '25-75th percentile' '50th percentile' 'Weighted MME mean'},'Orientation','vertical','Location','southwest','FontName','Times New Roman','Fontsize',12);
%legend({'SSP5-8.5 (17-83th percentile)' 'SSP5-8.5 (5-95th percentile)' 'SSP5-8.5 (50th percentile)' 'SSP5-8.5 (Weighted MME mean)'},'Orientation','vertical','Location','southwest','FontName','Times New Roman','Fontsize',10);
grid on
% figure(4)
% hp(2)=fill([time fliplr(time)],[smooth(p83_2)' fliplr(smooth(p17_2)')] ,'g','facealpha',.1,'EdgeColor', 'g','LineStyle','none');
% hold on 
% hp(3)=plot(time,smooth(p50_2)','--g','LineWidth',2)
% hold on
% set(gca,'FontName','Times New Roman','Fontsize',12); 
% hold on

% plot(tt(8:86),cum_585_d,'g','LineWidth',2);
% hold on
grid on 
set(gca,'FontName','Times New Roman','FontSize',12);
title('High emission scenario (SSP5-8.5)','FontName','Times New Roman','FontSize',14);
ylabel({'CSL Changes (m)'},'FontName','Times New Roman','FontSize',14); 
xlabel({'Years'},'FontName','Times New Roman','FontSize',14);
set(gca,'linew',1);

ax2 = axes('Position', ax.Position, 'YAxisLocation', 'right', 'Color', 'none');
ax2.FontSize =12;
ax2.YLim = [-40 30];
tickInterval =10;
yMax =30;
yMin =-40;
tickPositions = yMin:tickInterval:yMax;
yticks(tickPositions);
 
ax2.XTick = [];
ax2.XTickLabel = [];
linkaxes([ax, ax2], 'y');
set(ax2,'FontName','Times New Roman','FontSize',12);
set(gca,'linew',1);


range_585=zeros(6,8);
for i=1:8;
range_585(1,i)=round(p95_2(9+(i-1)*10),1);
range_585(2,i)=round(p5_2(9+(i-1)*10),2);

range_585(3,i)=round(p83_2(9+(i-1)*10),1);
range_585(4,i)=round(p17_2(9+(i-1)*10),1);

range_585(5,i)=round(p50_2(9+(i-1)*10),1);
range_585(6,i)=round(cum_585_d(9+(i-1)*10),1);
end

range_585_2 = cell(2, 8);

for i = 1:8
    range_585_2{1,i} = [num2str(range_585(2, i)), '   -   ', num2str(range_585(1, i))];
    range_585_2{2,i} = [num2str(range_585(4, i)), '   -   ', num2str(range_585(3, i))];
end

range_585_3 = {num2str(year'),range_585_2', num2str(range_585(5,:)','%g'), num2str(range_585(6,:)','%g')};

range_585=zeros(6,8);
for i=1:8;
range_585(1,i)=round(p95_3(9+(i-1)*10),1);
range_585(2,i)=round(p5_3(9+(i-1)*10),1);
range_585(3,i)=round(p83_3(9+(i-1)*10),1);
range_585(4,i)=round(p17_3(9+(i-1)*10),1);
range_585(5,i)=round(p50_3(9+(i-1)*10),1);
range_585(6,i)=round(cum_585_d(9+(i-1)*10)-28.29,1);
end

range_585_2 = cell(2, 8);

for i = 1:8
    range_585_2{1,i} = [num2str(range_585(2, i)), '   -   ', num2str(range_585(1, i))];
    range_585_2{2,i} = [num2str(range_585(4, i)), '   -   ', num2str(range_585(3, i))];
end

range_585_3_3 = {num2str(year'),range_585_2', num2str(range_585(5,:)','%g'), num2str(range_585(6,:)','%g')};
 

range_585=zeros(6,8);
for i=1:8;
range_585(1,i)=round(p95_4(9+(i-1)*10),1);
range_585(2,i)=round(p5_4(9+(i-1)*10),1);
range_585(3,i)=round(p83_4(9+(i-1)*10),1);
range_585(4,i)=round(p17_4(9+(i-1)*10),1);
range_585(5,i)=round(p50_4(9+(i-1)*10),1);
range_585(6,i)=round(cum_585_d(9+(i-1)*10)-27.43,1);
end

range_585_2 = cell(2, 8);

for i = 1:8
    range_585_2{1,i} = [num2str(range_585(2, i)), '   -   ', num2str(range_585(1, i))];
    range_585_2{2,i} = [num2str(range_585(4, i)), '   -   ', num2str(range_585(3, i))];
end

range_585_3_4 = {num2str(year'),range_585_2', num2str(range_585(5,:)','%g'), num2str(range_585(6,:)','%g')};

%%
total_scenarios=[wbudget_d_126 wbudget_d_245 wbudget_d_370 wbudget_d_585];

%total scenarios
total_scenarios_2=total_scenarios+49.5;
total_scenarios_3=total_scenarios_2';


for i=1:79
p_total(:,i)= prctile(total_scenarios_3(1:10000,i), percentiles);
end

p_total=p_total-49.5;


for i=1:79
    p95_2(i)=sum(p_total(3,1:i));
    p5_2(i)=sum(p_total(4,1:i));
    p83_2(i)=sum(p_total(5,1:i));
    p17_2(i)=sum(p_total(6,1:i));
    p50_2(i)=sum(p_total(7,1:i));
    p75_2(i)=sum(p_total(8,1:i));
    p25_2(i)=sum(p_total(9,1:i));  
end
%makhachkala
%CSL2021 Makhachkala=-28.29;

p95_3=p95_2-28.29;
p5_3=p5_2-28.29;
p83_3=p83_2-28.29;
p17_3=p17_2-28.29;
p50_3=p50_2-28.29;
p75_3=p75_2-28.29;
p25_3=p25_2-28.29; 

%anzali
%CSL2021 ANZALI=-27.43
p95_4=p95_2-27.43;
p5_4=p5_2-27.43;
p83_4=p83_2-27.43;
p17_4=p17_2-27.43;
p50_4=p50_2-27.43;
p75_4=p75_2-27.43;
p25_4=p25_2-27.43; 

time=tt(8:end);

time=tt(8:end);

% figure(6)
% tiledlayout(2,2);
% nexttile;
% hp(1)=fill([time fliplr(time)],[smooth(p95_2)' fliplr(smooth(p5_2)')] ,'k','facealpha',.15,'EdgeColor', 'k','LineStyle','none');
% hold on
% hp(2)=fill([time fliplr(time)],[smooth(p83_2)' fliplr(smooth(p17_2)')] ,'k','facealpha',.2,'EdgeColor', 'k','LineStyle','none');
% hold on  
% hp(3)=fill([time fliplr(time)],[smooth(p75_2)' fliplr(smooth(p25_2)')] ,'k','facealpha',.25,'EdgeColor', 'k','LineStyle','none');
% hold on
% hp(4)=plot(time,smooth(p50_2)','--k','LineWidth',2)
% hold on
% set(gca,'FontName','Times New Roman','Fontsize',12); 
% hold on
% % plot(tt(8:86),cum_126_d,'r','LineWidth',2);
% % hold on
% ax = gca;
% ax.YLim = [-40 15];
% ax.FontSize =12;
% tickInterval =10;
% yMax = 15;
% yMin = -40;
% tickPositions = yMin:tickInterval:yMax;
% yticks(tickPositions);
% 
% legend({'5-95th percentile' '17-83th percentile' '25-75th percentile' '50th percentile' 'Weighted MME mean'},'Orientation','vertical','Location','southwest','FontName','Times New Roman','Fontsize',12);
% grid on
% set(gca,'FontName','Times New Roman','FontSize',12);
% title('All four emission scenarios','FontName','Times New Roman','FontSize',14);
% ylabel({'CSL Changes (m)'},'FontName','Times New Roman','FontSize',14); 
% xlabel({'Years'},'FontName','Times New Roman','FontSize',14);
% set(gca,'linew',1);
% 

figure(6)
% tiledlayout(2,2);
% nexttile;
subplot(2,2,1);
hp(1)=fill([time fliplr(time)],[smooth(p95_2)' fliplr(smooth(p5_2)')] ,[0.4940 0.1840 0.5560],'facealpha',.15,'EdgeColor', [0.4940 0.1840 0.5560],'LineStyle','none');
hold on
hp(2)=fill([time fliplr(time)],[smooth(p83_2)' fliplr(smooth(p17_2)')] ,[0.4940 0.1840 0.5560],'facealpha',.2,'EdgeColor', [0.4940 0.1840 0.5560],'LineStyle','none');
hold on  
hp(3)=fill([time fliplr(time)],[smooth(p75_2)' fliplr(smooth(p25_2)')] ,[0.4940 0.1840 0.5560],'facealpha',.25,'EdgeColor', [0.4940 0.1840 0.5560],'LineStyle','none');
hold on
hp(4)=plot(time,smooth(p50_2)','color',[0.4940 0.1840 0.5560],'linestyle','--','LineWidth',2)
hold on
set(gca,'FontName','Times New Roman','Fontsize',12); 
hold on
% plot(tt(8:86),cum_126_d,'r','LineWidth',2);
% hold on
ax = gca;
ax.YLim = [-40 30];
ax.FontSize =12;
tickInterval =10;
yMax = 30;
yMin = -40;
tickPositions = yMin:tickInterval:yMax;
yticks(tickPositions);

legend({'5-95th percentile' '17-83th percentile' '25-75th percentile' '50th percentile' 'Weighted MME mean'},'Orientation','vertical','Location','southwest','FontName','Times New Roman','Fontsize',12);
grid on
set(gca,'FontName','Times New Roman','FontSize',12);
title('All four emission scenarios','FontName','Times New Roman','FontSize',14);
ylabel({'CSL Changes (m)'},'FontName','Times New Roman','FontSize',14); 
xlabel({'Years'},'FontName','Times New Roman','FontSize',14);
set(gca,'linew',1);

ax2 = axes('Position', ax.Position, 'YAxisLocation', 'right', 'Color', 'none');
ax2.FontSize =12;
ax2.YLim = [-40 30];
tickInterval =10;
yMax =30;
yMin =-40;
tickPositions = yMin:tickInterval:yMax;
yticks(tickPositions);
 
ax2.XTick = [];
ax2.XTickLabel = [];
linkaxes([ax, ax2], 'y');
set(ax2,'FontName','Times New Roman','FontSize',12);
set(gca,'linew',1);


figure(6)
subplot(2,2,2);
% tiledlayout(2,2);
% nexttile;
hp(1)=fill([time fliplr(time)],[smooth(p95_3)' fliplr(smooth(p5_3)')] ,[0.4940 0.1840 0.5560],'facealpha',.15,'EdgeColor', [0.4940 0.1840 0.5560],'LineStyle','none');
hold on
hp(2)=fill([time fliplr(time)],[smooth(p83_3)' fliplr(smooth(p17_3)')] ,[0.4940 0.1840 0.5560],'facealpha',.2,'EdgeColor', [0.4940 0.1840 0.5560],'LineStyle','none');
hold on  
hp(3)=fill([time fliplr(time)],[smooth(p75_3)' fliplr(smooth(p25_3)')] ,[0.4940 0.1840 0.5560],'facealpha',.25,'EdgeColor', [0.4940 0.1840 0.5560],'LineStyle','none');
hold on
hp(4)=plot(time,smooth(p50_3)','color',[0.4940 0.1840 0.5560],'linestyle','--','LineWidth',2)
hold on
set(gca,'FontName','Times New Roman','Fontsize',12); 
hold on
% plot(tt(8:86),cum_126_d,'r','LineWidth',2);
% hold on
ax = gca;
ax.YLim = [-70 0];
ax.FontSize =12;
tickInterval =10;
yMax = 0;
yMin = -70;
tickPositions = yMin:tickInterval:yMax;
yticks(tickPositions);

legend({'5-95th percentile' '17-83th percentile' '25-75th percentile' '50th percentile' 'Weighted MME mean'},'Orientation','vertical','Location','southwest','FontName','Times New Roman','Fontsize',12);
grid on
set(gca,'FontName','Times New Roman','FontSize',12);
title('All four emission scenarios','FontName','Times New Roman','FontSize',14);
ylabel({'CSL in Baltic system (m)'},'FontName','Times New Roman','FontSize',14); 
xlabel({'Years'},'FontName','Times New Roman','FontSize',14);
set(gca,'linew',1);


ax2 = axes('Position', ax.Position, 'YAxisLocation', 'right', 'Color', 'none');
ax2.FontSize =12;
ax2.YLim = [-70 0];
tickInterval =10;
yMax =0;
yMin =-70;
tickPositions = yMin:tickInterval:yMax;
yticks(tickPositions);
 
ax2.XTick = [];
ax2.XTickLabel = [];
linkaxes([ax, ax2], 'y');
set(ax2,'FontName','Times New Roman','FontSize',12);
set(gca,'linew',1);


% figure(8)

figure(6)
subplot(2,2,3);
% tiledlayout(2,2);
% nexttile;
hp(1)=fill([time fliplr(time)],[smooth(p95_4)' fliplr(smooth(p5_4)')] ,[0.4940 0.1840 0.5560],'facealpha',.15,'EdgeColor', [0.4940 0.1840 0.5560],'LineStyle','none');
hold on
hp(2)=fill([time fliplr(time)],[smooth(p83_4)' fliplr(smooth(p17_4)')] ,[0.4940 0.1840 0.5560],'facealpha',.2,'EdgeColor', [0.4940 0.1840 0.5560],'LineStyle','none');
hold on  
hp(3)=fill([time fliplr(time)],[smooth(p75_4)' fliplr(smooth(p25_4)')] ,[0.4940 0.1840 0.5560],'facealpha',.25,'EdgeColor', [0.4940 0.1840 0.5560],'LineStyle','none');
hold on
hp(4)=plot(time,smooth(p50_4)','color',[0.4940 0.1840 0.5560],'linestyle','--','LineWidth',2)
hold on
set(gca,'FontName','Times New Roman','Fontsize',12); 
hold on
% plot(tt(8:86),cum_126_d,'r','LineWidth',2);
% hold on
ax = gca;
ax.YLim = [-70 0];
ax.FontSize =12;
tickInterval =10;
yMax = 0;
yMin = -70;
tickPositions = yMin:tickInterval:yMax;
yticks(tickPositions);

legend({'5-95th percentile' '17-83th percentile' '25-75th percentile' '50th percentile' 'Weighted MME mean'},'Orientation','vertical','Location','southwest','FontName','Times New Roman','Fontsize',12);
grid on
set(gca,'FontName','Times New Roman','FontSize',12);
title('All four emission scenarios','FontName','Times New Roman','FontSize',14);
ylabel({'CSL relative to Shahid Rajaee Port (m)'},'FontName','Times New Roman','FontSize',12); 
xlabel({'Years'},'FontName','Times New Roman','FontSize',14);
set(gca,'linew',1);

ax2 = axes('Position', ax.Position, 'YAxisLocation', 'right', 'Color', 'none');
ax2.FontSize =12;
ax2.YLim = [-70 0];
tickInterval =10;
yMax =0;
yMin =-70;
tickPositions = yMin:tickInterval:yMax;
yticks(tickPositions);
 
ax2.XTick = [];
ax2.XTickLabel = [];
linkaxes([ax, ax2], 'y');
set(ax2,'FontName','Times New Roman','FontSize',12);
set(gca,'linew',1);


range_total=zeros(6,8);
for i=1:8;
range_total(1,i)=round(p95_2(9+(i-1)*10),1);
range_total(2,i)=round(p5_2(9+(i-1)*10),1);

range_total(3,i)=round(p83_2(9+(i-1)*10),1);
range_total(4,i)=round(p17_2(9+(i-1)*10),1);

range_total(5,i)=round(p50_2(9+(i-1)*10),1);
end

range_total_2 = cell(2, 8);

for i = 1:8
    range_total_2{1,i} = [num2str(range_total(2, i)), '   -   ', num2str(range_total(1, i))];
    range_total_2{2,i} = [num2str(range_total(4, i)), '   -   ', num2str(range_total(3, i))];
end

range_total_3 = {num2str(year'),range_total_2', num2str(range_total(5,:)','%g'), num2str(range_total(6,:)','%g')};


range_total=zeros(6,8);
for i=1:8;
range_total(1,i)=round(p95_3(9+(i-1)*10),1);
range_total(2,i)=round(p5_3(9+(i-1)*10),1);
range_total(3,i)=round(p83_3(9+(i-1)*10),1);
range_total(4,i)=round(p17_3(9+(i-1)*10),1);
range_total(5,i)=round(p50_3(9+(i-1)*10),1);
% range_total(6,i)=round(cum_total_d(9+(i-1)*10)-28.29,1);
end

range_total_2 = cell(2, 8);

for i = 1:8
    range_total_2{1,i} = [num2str(range_total(2, i)), '   -   ', num2str(range_total(1, i))];
    range_total_2{2,i} = [num2str(range_total(4, i)), '   -   ', num2str(range_total(3, i))];
end

range_total_3_3 = {num2str(year'),range_total_2', num2str(range_total(5,:)','%g'), num2str(range_total(6,:)','%g')};
 

range_total=zeros(6,8);
for i=1:8;
range_total(1,i)=round(p95_4(9+(i-1)*10),1);
range_total(2,i)=round(p5_4(9+(i-1)*10),1);
range_total(3,i)=round(p83_4(9+(i-1)*10),1);
range_total(4,i)=round(p17_4(9+(i-1)*10),1);
range_total(5,i)=round(p50_4(9+(i-1)*10),1);
% range_total(6,i)=round(cum_total_d(9+(i-1)*10)-27.43,1);
end

range_total_2 = cell(2, 8);

for i = 1:8
    range_total_2{1,i} = [num2str(range_total(2, i)), '   -   ', num2str(range_total(1, i))];
    range_total_2{2,i} = [num2str(range_total(4, i)), '   -   ', num2str(range_total(3, i))];
end

range_total_3_4 = {num2str(year'),range_total_2', num2str(range_total(5,:)','%g'), num2str(range_total(6,:)','%g')};

% 
% clearvars -except median_126 median_245 median_370 median_585 tt cum_126_d cum_245_d cum_370_d cum_585_d;
% 
% 
% cd('H:\Downscaling\ensembles\caspian_basin\water budget_deterministic\new_area\probabilistic');
% save('median_probablistic');

%%

figure(7)
subplot(2,1,1);
ax = gca;
plot(tt(8:86),median_126,'r','LineWidth',2, 'LineStyle', '--');
hold on
plot(tt(8:86),median_245,'color',[1 0.9 0],'LineWidth',2, 'LineStyle', '--');
hold on
plot(tt(8:86),median_370,'b','LineWidth',2, 'LineStyle', '--');
hold on
plot(tt(8:86),median_585,'color',[0,0.5,0],'LineWidth',2, 'LineStyle', '--');
grid on;

hold on
plot(tt(8:86),cum_126_d,'r','LineWidth',2);
hold on
plot(tt(8:86),cum_245_d,'color',[1 0.9 0],'LineWidth',2);
hold on
plot(tt(8:86),cum_370_d,'b','LineWidth',2);
hold on
plot(tt(8:86),cum_585_d,'color',[0,0.5,0],'LineWidth',2);
grid on;


ylabel({'CSL changes (m)'},'FontName','Times New Roman','FontSize',14); 
xlabel({'Years'},'FontName','Times New Roman','FontSize',14); 
set(gca,'FontName','Times New Roman','FontSize',14);
set(gca,'linew',1);
legend({'SSP1-2.6' 'SSP2-4.5' 'SSP3-7.0' 'SSP5-8.5'},'Orientation','horizontal','Location','northwest','FontName','Times New Roman','Fontsize',14);

ax.YLim = [-7 3];
ax.FontSize =14;
tickInterval =1;
yMax = 3;
yMin = -7;
tickPositions = yMin:tickInterval:yMax;
yticks(tickPositions);

tickInterval = years(4);
tickPositions = tt(8):tickInterval:tt(end);
xticks(tickPositions);
xticklabels(datestr(tickPositions, 'yyyy'));

ax2 = axes('Position', ax.Position, 'YAxisLocation', 'right', 'Color', 'none');
ax2.FontSize =14;
ax2.YLim = [-7 3];

tickInterval =1;
yMax = 3;
yMin = -7;
tickPositions = yMin:tickInterval:yMax;
yticks(tickPositions);

ax2.XTick = [];
ax2.XTickLabel = [];
linkaxes([ax, ax2], 'y');
set(gca,'FontName','Times New Roman','FontSize',14);
set(gca,'linew',1);
ax2.FontSize =14;
title('Caspian Sea Level Fluctuations','FontName','Times New Roman','Fontsize',18,'fontweight','bold');


figure(7)
subplot(2,1,2);
ax = gca;
plot(tt(8:86),median_126,'r','LineWidth',2, 'LineStyle', '--');
hold on
plot(tt(8:86),median_245,'color',[1 0.9 0],'LineWidth',2, 'LineStyle', '--');
hold on
plot(tt(8:86),median_370,'b','LineWidth',2, 'LineStyle', '--');
hold on
plot(tt(8:86),median_585,'color',[0,0.5,0],'LineWidth',2, 'LineStyle', '--');
grid on;


ylabel({'CSL changes (m)'},'FontName','Times New Roman','FontSize',14); 
xlabel({'Years'},'FontName','Times New Roman','FontSize',14); 
set(gca,'FontName','Times New Roman','FontSize',14);
set(gca,'linew',1);
legend({'SSP1-2.6' 'SSP2-4.5' 'SSP3-7.0' 'SSP5-8.5'},'Orientation','horizontal','Location','northwest','FontName','Times New Roman','Fontsize',14);

ax.YLim = [-7 3];
ax.FontSize =14;
tickInterval =1;
yMax = 3;
yMin = -7;
tickPositions = yMin:tickInterval:yMax;
yticks(tickPositions);

tickInterval = years(4);
tickPositions = tt(8):tickInterval:tt(end);
xticks(tickPositions);
xticklabels(datestr(tickPositions, 'yyyy'));

ax2 = axes('Position', ax.Position, 'YAxisLocation', 'right', 'Color', 'none');
ax2.FontSize =14;
ax2.YLim = [-7 3];

tickInterval =1;
yMax = 3;
yMin = -7;
tickPositions = yMin:tickInterval:yMax;
yticks(tickPositions);

ax2.XTick = [];
ax2.XTickLabel = [];
linkaxes([ax, ax2], 'y');
set(gca,'FontName','Times New Roman','FontSize',14);
set(gca,'linew',1);
ax2.FontSize =14;
title('Caspian Sea Level Fluctuations','FontName','Times New Roman','Fontsize',18,'fontweight','bold');

%%
figure(8)
subplot(4,1,1);
ax = gca;
plot(tt(8:86),median_126,'r','LineWidth',2, 'LineStyle', '--');
hold on

grid on;

plot(tt(8:86),cum_126_d,'r','LineWidth',2);
hold on
ylabel({'CSL changes (m)'},'FontName','Times New Roman','FontSize',14); 
% xlabel({'Years'},'FontName','Times New Roman','FontSize',14); 
set(gca,'FontName','Times New Roman','FontSize',14);
set(gca,'linew',1);
legend({'Probabilistic (median)','Deterministic'},'Orientation','horizontal','Location','southwest','FontName','Times New Roman','Fontsize',12);
title({'SSP1-2.6'},'FontName','Times New Roman','FontSize',14); 
ax.YLim = [-7 2];
ax.FontSize =14;
tickInterval =2;
yMax = 2;
yMin = -7;
tickPositions = yMin:tickInterval:yMax;
yticks(tickPositions);

tickInterval = years(4);
tickPositions = tt(8):tickInterval:tt(end);
xticks(tickPositions);
xticklabels(datestr(tickPositions, 'yyyy'));

% ax2 = axes('Position', ax.Position, 'YAxisLocation', 'right', 'Color', 'none');
% ax2.FontSize =14;
% ax2.YLim = [-7 2];
% 
% tickInterval =2;
% yMax = 2;
% yMin = -7;
% tickPositions = yMin:tickInterval:yMax;
% yticks(tickPositions);
% 
% ax2.XTick = [];
% ax2.XTickLabel = [];
% linkaxes([ax, ax2], 'y');
% set(gca,'FontName','Times New Roman','FontSize',14);
% set(gca,'linew',1);
% ax2.FontSize =14;
% % title('Caspian Sea Level Fluctuations','FontName','Times New Roman','Fontsize',18,'fontweight','bold');


figure(8)
subplot(4,1,2);
ax = gca;
plot(tt(8:86),median_245,'color',[1 0.9 0],'LineWidth',2, 'LineStyle', '--');
hold on
plot(tt(8:86),cum_245_d,'color',[1 0.9 0],'LineWidth',2);
hold on
ylabel({'CSL changes (m)'},'FontName','Times New Roman','FontSize',14); 
title({'SSP2-4.5'},'FontName','Times New Roman','FontSize',14); 
set(gca,'FontName','Times New Roman','FontSize',14);
set(gca,'linew',1);
legend({'Probabilistic (median)','Deterministic'},'Orientation','horizontal','Location','southwest','FontName','Times New Roman','Fontsize',12);
grid on;
ax.YLim = [-7 2];
ax.FontSize =14;
tickInterval =2;
yMax = 2;
yMin = -7;
tickPositions = yMin:tickInterval:yMax;
yticks(tickPositions);

tickInterval = years(4);
tickPositions = tt(8):tickInterval:tt(end);
xticks(tickPositions);
xticklabels(datestr(tickPositions, 'yyyy'));

% ax2 = axes('Position', ax.Position, 'YAxisLocation', 'right', 'Color', 'none');
% ax2.FontSize =14;
% ax2.YLim = [-7 2];
% 
% tickInterval =2;
% yMax = 2;
% yMin = -7;
% tickPositions = yMin:tickInterval:yMax;
% yticks(tickPositions);
% 
% ax2.XTick = [];
% ax2.XTickLabel = [];
% linkaxes([ax, ax2], 'y');
% set(gca,'FontName','Times New Roman','FontSize',14);
% set(gca,'linew',1);
% ax2.FontSize =14;
% % title('Caspian Sea Level Fluctuations','FontName','Times New Roman','Fontsize',18,'fontweight','bold');


figure(8)
subplot(4,1,3);
ax = gca;
plot(tt(8:86),median_370,'b','LineWidth',2, 'LineStyle', '--');
hold on
plot(tt(8:86),cum_370_d,'b','LineWidth',2);
hold on
ylabel({'CSL changes (m)'},'FontName','Times New Roman','FontSize',14); 
title({'SSP3-7.0'},'FontName','Times New Roman','FontSize',14); 
set(gca,'FontName','Times New Roman','FontSize',14);
set(gca,'linew',1);
legend({'Probabilistic (median)','Deterministic'},'Orientation','horizontal','Location','southwest','FontName','Times New Roman','Fontsize',12);
grid on;
ax.YLim = [-7 2];
ax.FontSize =14;
tickInterval =2;
yMax = 2;
yMin = -7;
tickPositions = yMin:tickInterval:yMax;
yticks(tickPositions);

tickInterval = years(4);
tickPositions = tt(8):tickInterval:tt(end);
xticks(tickPositions);
xticklabels(datestr(tickPositions, 'yyyy'));

% ax2 = axes('Position', ax.Position, 'YAxisLocation', 'right', 'Color', 'none');
% ax2.FontSize =14;
% ax2.YLim = [-7 2];
% 
% tickInterval =2;
% yMax = 2;
% yMin = -7;
% tickPositions = yMin:tickInterval:yMax;
% yticks(tickPositions);
% 
% ax2.XTick = [];
% ax2.XTickLabel = [];
% linkaxes([ax, ax2], 'y');
% set(gca,'FontName','Times New Roman','FontSize',14);
% set(gca,'linew',1);
% ax2.FontSize =14;
% % title('Caspian Sea Level Fluctuations','FontName','Times New Roman','Fontsize',18,'fontweight','bold');
% 

figure(8)
subplot(4,1,4);
ax = gca;
plot(tt(8:86),median_585,'color',[0,0.5,0],'LineWidth',2, 'LineStyle', '--');
hold on
plot(tt(8:86),cum_585_d,'color',[0,0.5,0],'LineWidth',2);
hold on
ylabel({'CSL changes (m)'},'FontName','Times New Roman','FontSize',14); 
title({'SSP5-8.5'},'FontName','Times New Roman','FontSize',14); 
set(gca,'FontName','Times New Roman','FontSize',14);
set(gca,'linew',1);
legend({'Probabilistic (median)','Deterministic'},'Orientation','horizontal','Location','southwest','FontName','Times New Roman','Fontsize',12);
grid on;
ax.YLim = [-7 2];
ax.FontSize =14;
tickInterval =2;
yMax = 2;
yMin = -7;
tickPositions = yMin:tickInterval:yMax;
yticks(tickPositions);

tickInterval = years(4);
tickPositions = tt(8):tickInterval:tt(end);
xticks(tickPositions);
xticklabels(datestr(tickPositions, 'yyyy'));

% ax2 = axes('Position', ax.Position, 'YAxisLocation', 'right', 'Color', 'none');
% ax2.FontSize =14;
% ax2.YLim = [-7 2];
% 
% tickInterval =2;
% yMax = 2;
% yMin = -7;
% tickPositions = yMin:tickInterval:yMax;
% yticks(tickPositions);
% 
% ax2.XTick = [];
% ax2.XTickLabel = [];
% linkaxes([ax, ax2], 'y');
% set(gca,'FontName','Times New Roman','FontSize',14);
% set(gca,'linew',1);
% ax2.FontSize =14;
% % title('Caspian Sea Level Fluctuations','FontName','Times New Roman','Fontsize',18,'fontweight','bold');
% % 
% 
median_126=median_126';
median_245=median_245';
median_370=median_370';
median_585=median_585';


%clearvars -except median_126 median_245 median_370 median_585;
save('medians');
