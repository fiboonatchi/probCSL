clc
clearvars
close all

%PCSbasin without CS
cd('H:\Downscaling\ensembles\caspian_basin\calculations\pr\probabilistic');
load('weighted_combination_E_CSbasin_without_CS_yearly');

fl=0.993;
Pcsbasin126=ds_126_total*fl;
Pcsbasin245=ds_245_total*fl;
Pcsbasin370=ds_370_total*fl;
Pcsbasin585=ds_585_total*fl;
Pcsbasinhist=ds_hist_total*fl;

clearvars -except Pcsbasin126 Pcsbasin245 Pcsbasin370 Pcsbasin585 Pcsbasinhist;

%ECSbasin without CS
cd('H:\Downscaling\ensembles\caspian_basin\evaporation\Probabilistic');
load('weighted_combination');

Ecsbasin126=ds_126_total;
Ecsbasin245=ds_245_total;
Ecsbasin370=ds_370_total;
Ecsbasin585=ds_585_total;
Ecsbasinhist=ds_hist_total;

clearvars -except Ecsbasin126 Ecsbasin245 Ecsbasin370 Ecsbasin585 Ecsbasinhist Pcsbasin126 Pcsbasin245 Pcsbasin370 Pcsbasin585 Pcsbasinhist;

%P CS
cd('H:\Downscaling\ensembles\caspian\pr\pr-probabilistic');
load('weighted_combination2');

Pcs126=ds_126_total;
Pcs245=ds_245_total;
Pcs370=ds_370_total;
Pcs585=ds_585_total;
Pcshist=ds_hist_total;

clearvars -except Pcs126 Pcs245 Pcs370 Pcs585 Pcshist Ecsbasin126 Ecsbasin245 Ecsbasin370 Ecsbasin585 Ecsbasinhist Pcsbasin126 Pcsbasin245 Pcsbasin370 Pcsbasin585 Pcsbasinhist;


%P CS
cd('H:\Downscaling\ensembles\caspian\pr\pr-probabilistic');
load('weighted_combination2');

Pcs126=ds_126_total;
Pcs245=ds_245_total;
Pcs370=ds_370_total;
Pcs585=ds_585_total;
Pcshist=ds_hist_total;
Pcshist=Pcshist(31:end,:);

clearvars -except Pcs126 Pcs245 Pcs370 Pcs585 Pcshist Ecsbasin126 Ecsbasin245 Ecsbasin370 Ecsbasin585 Ecsbasinhist Pcsbasin126 Pcsbasin245 Pcsbasin370 Pcsbasin585 Pcsbasinhist;

%E CS
cd('H:\Downscaling\ensembles\caspian\tas\evaporation\final codes\concatnate_repeat weight');
load('concatnate_repeat.mat');

Ecs126=e_total_126_repeat_weight;
Ecs245=e_total_245_repeat_weight;
Ecs370=e_total_370_repeat_weight;
Ecs585=e_total_585_repeat_weight;
Ecshist=e_total_hist_repeat_weight;
Ecshist=Ecshist(31:end,:);

clearvars -except Ecs126 Ecs245 Ecs370 Ecs585 Ecshist Pcs126 Pcs245 Pcs370 Pcs585 Pcshist Ecsbasin126 Ecsbasin245 Ecsbasin370 Ecsbasin585 Ecsbasinhist Pcsbasin126 Pcsbasin245 Pcsbasin370 Pcsbasin585 Pcsbasinhist;


% SSP126 CDF exceedence probability
for i=1:86
for j=1:10000
    x(j)=rand;
    PCS_126_MC(j,i)=prctile(Pcs126(i,:), x(j)*100);
    ECS_126_MC(j,i)=prctile(Ecs126(i,:), x(j)*100);
    PCSbasin_126_MC(j,i)=prctile(Pcsbasin126(i,:), x(j)*100);
    ECSbasin_126_MC(j,i)=prctile(Ecsbasin126(i,:), x(j)*100);
end
end
PCS_126_MC=PCS_126_MC';
ECS_126_MC=ECS_126_MC';
PCSbasin_126_MC=PCSbasin_126_MC';
ECSbasin_126_MC=ECSbasin_126_MC';

% SSP245 CDF exceedence probability
for i=1:86
for j=1:10000
%     x(j)=rand;
    PCS_245_MC(j,i)=prctile(Pcs245(i,:), x(j)*100);
    ECS_245_MC(j,i)=prctile(Ecs245(i,:), x(j)*100);
    PCSbasin_245_MC(j,i)=prctile(Pcsbasin245(i,:), x(j)*100);
    ECSbasin_245_MC(j,i)=prctile(Ecsbasin245(i,:), x(j)*100);
end
end
PCS_245_MC=PCS_245_MC';
ECS_245_MC=ECS_245_MC';
PCSbasin_245_MC=PCSbasin_245_MC';
ECSbasin_245_MC=ECSbasin_245_MC';

% SSP370 CDF exceedence probability
for i=1:86
for j=1:10000
%     x(j)=rand;
    PCS_370_MC(j,i)=prctile(Pcs370(i,:), x(j)*100);
    ECS_370_MC(j,i)=prctile(Ecs370(i,:), x(j)*100);
    PCSbasin_370_MC(j,i)=prctile(Pcsbasin370(i,:), x(j)*100);
    ECSbasin_370_MC(j,i)=prctile(Ecsbasin370(i,:), x(j)*100);
end
end
PCS_370_MC=PCS_370_MC';
ECS_370_MC=ECS_370_MC';
PCSbasin_370_MC=PCSbasin_370_MC';
ECSbasin_370_MC=ECSbasin_370_MC';

% SSP585 CDF exceedence probability
for i=1:86
for j=1:10000
%     x(j)=rand;
    PCS_585_MC(j,i)=prctile(Pcs585(i,:), x(j)*100);
    ECS_585_MC(j,i)=prctile(Ecs585(i,:), x(j)*100);
    PCSbasin_585_MC(j,i)=prctile(Pcsbasin585(i,:), x(j)*100);
    ECSbasin_585_MC(j,i)=prctile(Ecsbasin585(i,:), x(j)*100);
end
end
PCS_585_MC=PCS_585_MC';
ECS_585_MC=ECS_585_MC';
PCSbasin_585_MC=PCSbasin_585_MC';
ECSbasin_585_MC=ECSbasin_585_MC';

% SSPhist CDF exceedence probability
for i=1:35
for j=1:10000
%     x(j)=rand;
    PCS_hist_MC(j,i)=prctile(Pcshist(i,:), x(j)*100);
    ECS_hist_MC(j,i)=prctile(Ecshist(i,:), x(j)*100);
    PCSbasin_hist_MC(j,i)=prctile(Pcsbasinhist(i,:), x(j)*100);
    ECSbasin_hist_MC(j,i)=prctile(Ecsbasinhist(i,:), x(j)*100);
end
end
PCS_hist_MC=PCS_hist_MC';
ECS_hist_MC=ECS_hist_MC';
PCSbasin_hist_MC=PCSbasin_hist_MC';
ECSbasin_hist_MC=ECSbasin_hist_MC';


% cd('H:\Downscaling\ensembles\caspian_basin\water budget_deterministic\water_budget_changing_area');
% load('probabilistic_csl_MCs');


PECS126_MC=PCS_126_MC-ECS_126_MC;
PECSbasin126_MC=PCSbasin_126_MC-ECSbasin_126_MC;

PECS245_MC=PCS_245_MC-ECS_245_MC;
PECSbasin245_MC=PCSbasin_245_MC-ECSbasin_245_MC;

PECS370_MC=PCS_370_MC-ECS_370_MC;
PECSbasin370_MC=PCSbasin_370_MC-ECSbasin_370_MC;

PECS585_MC=PCS_585_MC-ECS_585_MC;
PECSbasin585_MC=PCSbasin_585_MC-ECSbasin_585_MC;

PECShist_MC=PCS_hist_MC-ECS_hist_MC;
PECSbasinhist_MC=PCSbasin_hist_MC-ECSbasin_hist_MC;


cd('H:\Downscaling\ensembles\caspian_basin\water budget_deterministic\new_area\probabilistic');

[wl_126_a, wl_245_a, wl_370_a, wl_585_a, wl_126_m, wl_245_m, wl_370_m, wl_585_m, wl_ref_total_a, wl_ref_total_m, wbudget_d_ref_total,wbudget_d_126,wbudget_d_245,wbudget_d_370,wbudget_d_585]=ratioareaconsideringprobabilistic_after_eslahat(PECShist_MC,PECSbasinhist_MC,PECS126_MC,PECSbasin126_MC,PECS245_MC,PECSbasin245_MC,PECS370_MC,PECSbasin370_MC,PECS585_MC,PECSbasin585_MC,PCS_hist_MC,PCS_126_MC,PCS_245_MC,PCS_370_MC,PCS_585_MC,ECS_hist_MC,ECS_126_MC,ECS_245_MC,ECS_370_MC,ECS_585_MC)


clearvars -except wl_126_a wl_245_a wl_370_a wl_585_a wl_126_m wl_245_m wl_370_m wl_585_m wl_ref_total_a wl_ref_total_m wbudget_d_ref_total wbudget_d_126 wbudget_d_245 wbudget_d_370 wbudget_d_585;


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
figure(5)
subplot(3,1,1)
plot(t_obs3(1:end)',makh_obs_changes(80:121),'b','LineWidth',1.5,'Marker','o');
hold on
plot(t_obs4,wbudget_d_ref_total(1:end),'k','LineWidth',1.5);
hold on

ax=gca;
ax.YLim = [-0.7 0.7];
ax.FontSize =12;
tickInterval =0.1;
yMax = 0.7;
yMin = -0.7;
tickPositions = yMin:tickInterval:yMax;
yticks(tickPositions);

tickInterval = years(4);
tickPositions = t_obs3(1):tickInterval:tt(7);
xticks(tickPositions);
xticklabels(datestr(tickPositions, 'yyyy'));
set(gca,'FontName','Times New Roman','FontSize',14);
set(ax,'FontName','Times New Roman','FontSize',14);
ylabel({'CS water budget (m)'},'FontName','Times New Roman','FontSize',16); 
% legend({'Measurment' 'Historical' 'SSP1-2.6' 'SSP2-4.5' 'SSP3-7.0' 'SSP5-8.5'},'Orientation','horizontal','Location','southwest','FontName','Times New Roman','Fontsize',14);

legend({'Measured' 'Simulated'},'Orientation','horizontal','Location','southwest','FontName','Times New Roman','Fontsize',16);
title('Annual Caspian Sea Water Budget','FontName','Times New Roman','Fontsize',18,'fontweight','bold');
set(gca,'linew',1);


ax2 = axes('Position', ax.Position, 'YAxisLocation', 'right', 'Color', 'none');
ax2.FontSize =12;
ax2.YLim = [-0.7 0.7];

tickInterval =0.1;
yMax =0.7;
yMin =-0.7;
tickPositions = yMin:tickInterval:yMax;
yticks(tickPositions);

ax2.XTick = [];
ax2.XTickLabel = [];
linkaxes([ax, ax2], 'y');
set(ax2,'FontName','Times New Roman','FontSize',14);
set(gca,'linew',1);


% yline(0,'k','LineWidth',0.5);
yline(0,'k','LineWidth',0.5);


subplot(3,1,2)
bar(obs_hist,'k');
hold on
bar(model_hist,'b');
hold on
ax=gca;
ax.YLim = [-1.5 2];
ax.FontSize =12;
tickInterval =0.5;
yMax = 2;
yMin = -1.5;
tickPositions = yMin:tickInterval:yMax;
yticks(tickPositions);
ylabel({'Total CS water budget (m)'},'FontName','Times New Roman','FontSize',16); 
% tickInterval = years(4);
% tickPositions = t_obs3(1):tickInterval:tt(7);
% xticks(tickPositions);
% xticklabels(datestr(tickPositions, 'yyyy'));
set(gca, 'XTickLabel', {'Rise-period','Drop-period'},'FontName','Times New Roman','FontSize', 14);
% ylabel({'CS water budget (m)'},'FontName','Times New Roman','FontSize',16); 
% legend({'Measurment' 'Historical' 'SSP1-2.6' 'SSP2-4.5' 'SSP3-7.0' 'SSP5-8.5'},'Orientation','horizontal','Location','southwest','FontName','Times New Roman','Fontsize',14);
legend({'Simulated' 'Measured'},'Orientation','horizontal','Location','southwest','FontName','Times New Roman','Fontsize',16);
title('Caspian Sea Water Budget','FontName','Times New Roman','Fontsize',18,'fontweight','bold');
set(gca,'linew',1);
ax2 = axes('Position', ax.Position, 'YAxisLocation', 'right', 'Color', 'none');
ax2.FontSize =12;
ax2.YLim = [-1.5 2];

tickInterval =0.5;
yMax =2;
yMin =-1.5;
tickPositions = yMin:tickInterval:yMax;
yticks(tickPositions);

ax2.XTick = [];
ax2.XTickLabel = [];
linkaxes([ax, ax2], 'y');
set(ax2,'FontName','Times New Roman','FontSize',14);
set(gca,'linew',1);
% yline(0,'k','LineWidth',0.5);
yline(0,'k','LineWidth',0.5);



subplot(3,1,3);
xx =makh_obs_changes(80:114);
yy =wbudget_d_ref_total;
scatter(xx, yy, 'o', 'filled');
hold on
x =min(xx):0.05:max(xx);
y = x;
plot(x, y,'color', 'r','LineWidth',2);
set(gca,'FontName','Times New Roman','FontSize',14);
ylabel({'Simulated (m)'},'FontName','Times New Roman','FontSize',16); 
xlabel({'Measured (m)'},'FontName','Times New Roman','FontSize',16); 
%legend({'CSL changes (m)' 'y=x'},'Orientation','horizontal','Location','northwest','FontName','Times New Roman','Fontsize',12);
title('Annual Caspian Sea Water Budget (1980-2014)','FontName','Times New Roman','Fontsize',18,'fontweight','bold');
grid on;
box on;
set(gca,'linew',1);

actual_data = xx;
predicted_data =yy;

rmse =sqrt(mean((actual_data - predicted_data).^2));
bias = mean(predicted_data - actual_data);
mae = mean(abs(predicted_data - actual_data));
correlation_coef = corrcoef(actual_data, predicted_data);
correlation_coef = correlation_coef(1, 2);

legend1 = {'CSL water budget', 'x=y'};
h = legend(legend1, 'Orientation', 'horizontal', 'Location', 'northwest', 'FontName', 'Times New Roman', 'Fontsize', 16);
metrics_text = sprintf('RMSE=%.2f\nBIAS=%.2f\nMAE=%.2f\nCC=%.2f', round(rmse, 2), round(bias, 2), round(mae, 2), round(correlation_coef, 2));
annotation('textbox', [0.14, 0.77, 0.1, 0.1], 'String', metrics_text, 'FontName', 'Times New Roman', 'FontSize', 16);













