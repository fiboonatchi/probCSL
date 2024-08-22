clc
clear

cd('H:\Downscaling\ensembles\caspian_basin\water budget_deterministic\new_area\probabilistic');
load('probabilistic_csl_area_ta_inja_fl_prctile_after_eslahat');
p=wbudget_d_126(8:86,:);

for j=1:10000
for i=1:79;
p2(i,j)=sum(p(1:i,j));
end
end

p2=p2';

percentiles = [100,99,95,90,85,80,75,70,65,60,55,50,45,40,35,30,25,20,15,10,5,1,0];
p_126 = zeros(23,79);
percentiles2=100-percentiles;

for i=1:79
p_126(:,i)= prctile(p2(1:10000,i), percentiles);
end

j=9;

for i=1:8    
        P1_1(i,:)=p_126(:,j);
        j=j+10;
end

figure (1)
subplot(2,2,1);
for i=1:8
plot(P1_1(i,:),percentiles','LineWidth',2);
hold on;
end
xlim([-4 2]);
xticks([-4:0.5:2]);

ylim([0 100]);
yticks([0:10:100]);


leg=legend('2030','2040','2050','2060','2070','2080','2090','2100','FontName','Times New Roman','Fontsize',12,'Location','northwest')
set(gcf,'color','white') 
title(leg,'Year')
set(gca,'FontName','Times New Roman','Fontsize',12); 
ylabel('Non-exceedance Probability (%)','FontName','Times New Roman','Fontsize',12);
xlabel('CSL changes relative to 2021','FontName','Times New Roman','Fontsize',12);
title('Low emission scenario','FontName','Times New Roman','Fontsize',18);
set(gca, 'ColorOrder', jet(8))
grid on;


%%

p=wbudget_d_245(8:86,:);

for j=1:10000
for i=1:79;
p2(i,j)=sum(p(1:i,j));
end
end

p2=p2';

percentiles = [100,99,95,90,85,80,75,70,65,60,55,50,45,40,35,30,25,20,15,10,5,1,0];
p_245= zeros(23,79);
percentiles2=100-percentiles;

for i=1:79
p_245(:,i)= prctile(p2(1:10000,i), percentiles);
end

j=9;

for i=1:8    
        P1_1(i,:)=p_245(:,j);
        j=j+10;
end

figure (1)
subplot(2,2,2);
for i=1:8
plot(P1_1(i,:),percentiles','LineWidth',2);
hold on;
end
xlim([-40 5]);
xticks([-40:5:5]);

ylim([0 100]);
yticks([0:10:100]);
leg=legend('2030','2040','2050','2060','2070','2080','2090','2100','FontName','Times New Roman','Fontsize',12,'Location','northwest')
set(gcf,'color','white') 
title(leg,'Year')
set(gca,'FontName','Times New Roman','Fontsize',12); 
ylabel('Non-exceedance Probability (%)','FontName','Times New Roman','Fontsize',12);
xlabel('CSL changes relative to 2021','FontName','Times New Roman','Fontsize',12);
title('Medium emission scenario','FontName','Times New Roman','Fontsize',18);
set(gca, 'ColorOrder', jet(8))
grid on;

%%

p=wbudget_d_370(8:86,:);

for j=1:10000
for i=1:79;
p2(i,j)=sum(p(1:i,j));
end
end

p2=p2';

percentiles = [100,99,95,90,85,80,75,70,65,60,55,50,45,40,35,30,25,20,15,10,5,1,0];
p_370= zeros(23,79);
percentiles2=100-percentiles;

for i=1:79
p_370(:,i)= prctile(p2(1:10000,i), percentiles);
end

j=9;

for i=1:8    
        P1_1(i,:)=p_370(:,j);
        j=j+10;
end

figure (1)
subplot(2,2,3);
for i=1:8
plot(P1_1(i,:),percentiles','LineWidth',2);
hold on;
end
xlim([-40 5]);
xticks([-40:5:5]);

ylim([0 100]);
yticks([0:10:100]);
leg=legend('2030','2040','2050','2060','2070','2080','2090','2100','FontName','Times New Roman','Fontsize',12,'Location','northwest')
set(gcf,'color','white') 
title(leg,'Year')
set(gca,'FontName','Times New Roman','Fontsize',12); 
ylabel('Non-exceedance Probability (%)','FontName','Times New Roman','Fontsize',12);
xlabel('CSL changes relative to 2021','FontName','Times New Roman','Fontsize',12);
title('Medium-to-high emission scenario','FontName','Times New Roman','Fontsize',18);
set(gca, 'ColorOrder', jet(8))
grid on;
%%

p=wbudget_d_585(8:86,:);

for j=1:10000
for i=1:79;
p2(i,j)=sum(p(1:i,j));
end
end

p2=p2';

percentiles = [100,99,95,90,85,80,75,70,65,60,55,50,45,40,35,30,25,20,15,10,5,1,0];
p_585= zeros(23,79);
percentiles2=100-percentiles;

for i=1:79
p_585(:,i)= prctile(p2(1:10000,i), percentiles);
end

j=9;

for i=1:8    
        P1_1(i,:)=p_585(:,j);
        j=j+10;
end

figure (1)
subplot(2,2,4);
for i=1:8
plot(P1_1(i,:),percentiles','LineWidth',2);
hold on;
end
xlim([-50 5]);
xticks([-50:5:5]);
ylim([0 100]);
yticks([0:10:100]);
leg=legend('2030','2040','2050','2060','2070','2080','2090','2100','FontName','Times New Roman','Fontsize',12,'Location','northwest')
set(gcf,'color','white') 
title(leg,'Year')
set(gca,'FontName','Times New Roman','Fontsize',12); 
ylabel('Non-exceedance Probability (%)','FontName','Times New Roman','Fontsize',12);
xlabel('CSL changes relative to 2021','FontName','Times New Roman','Fontsize',12);
title('High emission scenario','FontName','Times New Roman','Fontsize',18);
set(gca, 'ColorOrder', jet(8))
grid on;

%%

clc
clear

cd('H:\Downscaling\ensembles\caspian_basin\water budget_deterministic\new_area\probabilistic');
load('probabilistic_csl_area_ta_inja_fl');

p=wbudget_d_126(8:86,:);

for j=1:10000
for i=1:79;
p2(i,j)=sum(p(1:i,j));
end
end
p2=p2-28.29;
p2=p2';

percentiles = [100,99,95,90,85,80,75,70,65,60,55,50,45,40,35,30,25,20,15,10,5,1,0];
p_126 = zeros(23,79);
percentiles2=100-percentiles;

for i=1:79
p_126(:,i)= prctile(p2(1:10000,i), percentiles);
end

j=9;

for i=1:8    
        P1_1(i,:)=p_126(:,j);
        j=j+10;
end

figure (2)
subplot(2,2,1);
for i=1:8
plot(P1_1(i,:),percentiles','LineWidth',2);
hold on;
end
xlim([-33 -27]);
xticks([-33:1:-27]);

ylim([0 100]);
yticks([0:10:100]);


leg=legend('2030','2040','2050','2060','2070','2080','2090','2100','FontName','Times New Roman','Fontsize',12,'Location','northwest')
set(gcf,'color','white') 
title(leg,'Year')
set(gca,'FontName','Times New Roman','Fontsize',12); 
ylabel('Non-exceedance Probability (%)','FontName','Times New Roman','Fontsize',12);
xlabel('CSL in Baltic system (m)','FontName','Times New Roman','Fontsize',12);
title('Low emission scenario','FontName','Times New Roman','Fontsize',18);
set(gca, 'ColorOrder', jet(8))
grid on;


%%

p=wbudget_d_245(8:86,:);

for j=1:10000
for i=1:79;
p2(i,j)=sum(p(1:i,j));
end
end

p2=p2-28.29;
p2=p2';

percentiles = [100,99,95,90,85,80,75,70,65,60,55,50,45,40,35,30,25,20,15,10,5,1,0];
p_245= zeros(23,79);
percentiles2=100-percentiles;

for i=1:79
p_245(:,i)= prctile(p2(1:10000,i), percentiles);
end

j=9;

for i=1:8    
        P1_1(i,:)=p_245(:,j);
        j=j+10;
end

figure (2)
subplot(2,2,2);
for i=1:8
plot(P1_1(i,:),percentiles','LineWidth',2);
hold on;
end
xlim([-70 -25]);
xticks([-70:5:-25]);

ylim([0 100]);
yticks([0:10:100]);
leg=legend('2030','2040','2050','2060','2070','2080','2090','2100','FontName','Times New Roman','Fontsize',12,'Location','northwest')
set(gcf,'color','white') 
title(leg,'Year')
set(gca,'FontName','Times New Roman','Fontsize',12); 
ylabel('Non-exceedance Probability (%)','FontName','Times New Roman','Fontsize',12);
xlabel('CSL in Baltic system (m)','FontName','Times New Roman','Fontsize',12);
title('Medium emission scenario','FontName','Times New Roman','Fontsize',18);
set(gca, 'ColorOrder', jet(8))
grid on;

%%

p=wbudget_d_370(8:86,:);

for j=1:10000
for i=1:79;
p2(i,j)=sum(p(1:i,j));
end
end

p2=p2-28.29;
p2=p2';

percentiles = [100,99,95,90,85,80,75,70,65,60,55,50,45,40,35,30,25,20,15,10,5,1,0];
p_370= zeros(23,79);
percentiles2=100-percentiles;

for i=1:79
p_370(:,i)= prctile(p2(1:10000,i), percentiles);
end

j=9;

for i=1:8    
        P1_1(i,:)=p_370(:,j);
        j=j+10;
end

figure (2)
subplot(2,2,3);
for i=1:8
plot(P1_1(i,:),percentiles','LineWidth',2);
hold on;
end
xlim([-70 -25]);
xticks([-70:5:-25]);

ylim([0 100]);
yticks([0:10:100]);
leg=legend('2030','2040','2050','2060','2070','2080','2090','2100','FontName','Times New Roman','Fontsize',12,'Location','northwest')
set(gcf,'color','white') 
title(leg,'Year')
set(gca,'FontName','Times New Roman','Fontsize',12); 
ylabel('Non-exceedance Probability (%)','FontName','Times New Roman','Fontsize',12);
xlabel('CSL in Baltic system (m)','FontName','Times New Roman','Fontsize',12);
title('Medium-to-high emission scenario','FontName','Times New Roman','Fontsize',18);
set(gca, 'ColorOrder', jet(8))
grid on;
%%

p=wbudget_d_585(8:86,:);

for j=1:10000
for i=1:79;
p2(i,j)=sum(p(1:i,j));
end
end

p2=p2-28.29;
p2=p2';

percentiles = [100,99,95,90,85,80,75,70,65,60,55,50,45,40,35,30,25,20,15,10,5,1,0];
p_585= zeros(23,79);
percentiles2=100-percentiles;

for i=1:79
p_585(:,i)= prctile(p2(1:10000,i), percentiles);
end

j=9;

for i=1:8    
        P1_1(i,:)=p_585(:,j);
        j=j+10;
end

figure (2)
subplot(2,2,4);
for i=1:8
plot(P1_1(i,:),percentiles','LineWidth',2);
hold on;
end
xlim([-70 -25]);
xticks([-70:5:-25]);
ylim([0 100]);
yticks([0:10:100]);
leg=legend('2030','2040','2050','2060','2070','2080','2090','2100','FontName','Times New Roman','Fontsize',12,'Location','northwest')
set(gcf,'color','white') 
title(leg,'Year')
set(gca,'FontName','Times New Roman','Fontsize',12); 
ylabel('Non-exceedance Probability (%)','FontName','Times New Roman','Fontsize',12);
xlabel('CSL in Baltic system (m)','FontName','Times New Roman','Fontsize',12);
title('High emission scenario','FontName','Times New Roman','Fontsize',18);
set(gca, 'ColorOrder', jet(8))
grid on;

%%

clc
clear

cd('H:\Downscaling\ensembles\caspian_basin\water budget_deterministic\new_area\probabilistic');
load('probabilistic_csl_area_ta_inja_fl');

p=wbudget_d_126(8:86,:);

for j=1:10000
for i=1:79;
p2(i,j)=sum(p(1:i,j));
end
end
p2=p2-27.43;
p2=p2';

percentiles = [100,99,95,90,85,80,75,70,65,60,55,50,45,40,35,30,25,20,15,10,5,1,0];
p_126 = zeros(23,79);
percentiles2=100-percentiles;

for i=1:79
p_126(:,i)= prctile(p2(1:10000,i), percentiles);
end

j=9;

for i=1:8    
        P1_1(i,:)=p_126(:,j);
        j=j+10;
end

figure (9)
subplot(2,2,1);
for i=1:8
plot(P1_1(i,:),percentiles','LineWidth',2);
hold on;
end
xlim([-33 -26]);
xticks([-33:1:-26]);

ylim([0 100]);
yticks([0:10:100]);


leg=legend('2030','2040','2050','2060','2070','2080','2090','2100','FontName','Times New Roman','Fontsize',12,'Location','northwest')
set(gcf,'color','white') 
title(leg,'Year')
set(gca,'FontName','Times New Roman','Fontsize',12); 
ylabel('Non-exceedance Probability (%)','FontName','Times New Roman','Fontsize',12);
xlabel('CSL relative to Shahid Rajaee Port (m)','FontName','Times New Roman','Fontsize',12);
title('Low emission scenario','FontName','Times New Roman','Fontsize',18);
set(gca, 'ColorOrder', jet(8))
grid on;


%%

p=wbudget_d_245(8:86,:);

for j=1:10000
for i=1:79;
p2(i,j)=sum(p(1:i,j));
end
end

p2=p2-27.43;
p2=p2';

percentiles = [100,99,95,90,85,80,75,70,65,60,55,50,45,40,35,30,25,20,15,10,5,1,0];
p_245= zeros(23,79);
percentiles2=100-percentiles;

for i=1:79
p_245(:,i)= prctile(p2(1:10000,i), percentiles);
end

j=9;

for i=1:8    
        P1_1(i,:)=p_245(:,j);
        j=j+10;
end

figure (9)
subplot(2,2,2);
for i=1:8
plot(P1_1(i,:),percentiles','LineWidth',2);
hold on;
end
xlim([-70 -20]);
xticks([-70:5:-20]);

ylim([0 100]);
yticks([0:10:100]);
leg=legend('2030','2040','2050','2060','2070','2080','2090','2100','FontName','Times New Roman','Fontsize',12,'Location','northwest')
set(gcf,'color','white') 
title(leg,'Year')
set(gca,'FontName','Times New Roman','Fontsize',12); 
ylabel('Non-exceedance Probability (%)','FontName','Times New Roman','Fontsize',12);
xlabel('CSL relative to Shahid Rajaee Port (m)','FontName','Times New Roman','Fontsize',12);
title('Medium emission scenario','FontName','Times New Roman','Fontsize',18);
set(gca, 'ColorOrder', jet(8))
grid on;

%%

p=wbudget_d_370(8:86,:);

for j=1:10000
for i=1:79;
p2(i,j)=sum(p(1:i,j));
end
end

p2=p2-27.43;
p2=p2';

percentiles = [100,99,95,90,85,80,75,70,65,60,55,50,45,40,35,30,25,20,15,10,5,1,0];
p_370= zeros(23,79);
percentiles2=100-percentiles;

for i=1:79
p_370(:,i)= prctile(p2(1:10000,i), percentiles);
end

j=9;

for i=1:8    
        P1_1(i,:)=p_370(:,j);
        j=j+10;
end

figure (9)
subplot(2,2,3);
for i=1:8
plot(P1_1(i,:),percentiles','LineWidth',2);
hold on;
end
xlim([-70 -25]);
xticks([-70:5:-25]);

ylim([0 100]);
yticks([0:10:100]);
leg=legend('2030','2040','2050','2060','2070','2080','2090','2100','FontName','Times New Roman','Fontsize',12,'Location','northwest')
set(gcf,'color','white') 
title(leg,'Year')
set(gca,'FontName','Times New Roman','Fontsize',12); 
ylabel('Non-exceedance Probability (%)','FontName','Times New Roman','Fontsize',12);
xlabel('CSL relative to Shahid Rajaee Port (m)','FontName','Times New Roman','Fontsize',12);
title('Medium-to-high emission scenario','FontName','Times New Roman','Fontsize',18);
set(gca, 'ColorOrder', jet(8))
grid on;
%%

p=wbudget_d_585(8:86,:);

for j=1:10000
for i=1:79;
p2(i,j)=sum(p(1:i,j));
end
end

p2=p2-27.43;
p2=p2';

percentiles = [100,99,95,90,85,80,75,70,65,60,55,50,45,40,35,30,25,20,15,10,5,1,0];
p_585= zeros(23,79);
percentiles2=100-percentiles;

for i=1:79
p_585(:,i)= prctile(p2(1:10000,i), percentiles);
end

j=9;

for i=1:8    
        P1_1(i,:)=p_585(:,j);
        j=j+10;
end

figure (9)
subplot(2,2,4);
for i=1:8
plot(P1_1(i,:),percentiles','LineWidth',2);
hold on;
end
xlim([-70 -25]);
xticks([-70:5:-25]);
ylim([0 100]);
yticks([0:10:100]);
leg=legend('2030','2040','2050','2060','2070','2080','2090','2100','FontName','Times New Roman','Fontsize',12,'Location','northwest')
set(gcf,'color','white') 
title(leg,'Year')
set(gca,'FontName','Times New Roman','Fontsize',12); 
ylabel('Non-exceedance Probability (%)','FontName','Times New Roman','Fontsize',12);
xlabel('CSL relative to Shahid Rajaee Port (m)','FontName','Times New Roman','Fontsize',12);
title('High emission scenario','FontName','Times New Roman','Fontsize',18);
set(gca, 'ColorOrder', jet(8))
grid on;

