clc
clear
cd('H:\Downscaling\ensembles\caspian_basin\water budget_deterministic\Area\GEBCO');
tiff_file_name = 'gebco_2023_n49.0_s35.0_w45.0_e56.0.tif';
image_data = imread(tiff_file_name);


% cd('H:\Downscaling\ensembles\caspian_basin\water budget_deterministic\csarea');
% utm_easting = 500000; % Easting value in meters
% utm_northing = 4649770; % Northing value in meters
% utm_zone = 40; % UTM zone (replace with the appropriate zone for your data)
% 
% % Convert UTM coordinates to longitude and latitude
% [lon, lat] = utm2ll(utm_easting, utm_northing, utm_zone);

addpath('H:\Downscaling\ensembles\caspian_basin\water budget_deterministic\new_area\probabilistic');
load('medians');

% cd='H:\Downscaling\ensembles\caspian_basin\water budget_deterministic';
fn='H:\Downscaling\ensembles\caspian_basin\water budget_deterministic\CSL_MME_MODEL_RESULTS.xlsx';
date=xlsread(fn,'Sheet2','A1:A79');
csl_m_126=-28.29+median_126;
csl_m_245=-28.29+median_245;
csl_m_370=-28.29+median_370;
csl_m_585=-28.29+median_585;


%*9238.98 conversion factor from km^2 to km^2 in the caspian sea

cd('H:\Downscaling\ensembles\caspian_basin\water budget_deterministic\new_area\deterministic\before_eslahat');
for i=1:size(csl_m_126,1)
x=csl_m_126(i);
[area]= computearea(x);
area_126(i)=int32(round(area*9238.98,0));
end

for i=1:size(csl_m_245,1)
x=csl_m_245(i);
[area]= computearea(x);
area_245(i)=int32(round(area*9238.98,0));
end

for i=1:size(csl_m_370,1)
x=csl_m_370(i);
[area]= computearea(x);
area_370(i)=int32(round(area*9238.98,0));
end

for i=1:size(csl_m_585,1)
x=csl_m_585(i);
[area]= computearea(x);
area_585(i)=int32(round(area*9238.98,0));
end
%%
%126
figure (1);
tiledlayout(4,9);
nexttile;
desired_depth =  csl_m_126(1); 
csarea=area_126(1); 
contour(image_data, [desired_depth, desired_depth], 'LineColor', 'r', 'LineWidth', 1.2);

% title(['CSL: ', num2str(desired_depth)]); 
title(sprintf('%d: %.2f m', date(1), desired_depth),'FontSize', 14);
axis equal
set(gca,'ydir','reverse');

image_data = double(image_data);
contour_data = contourc(image_data, [desired_depth, desired_depth]);
x = contour_data(1, 2:end); % x-coordinates of the contour segments
y = contour_data(2, 2:end); % y-coordinates of the contour segments

ylabel('Low', 'Color', 'k', 'FontName', 'Times New Roman', 'FontSize', 16, 'Fontweight', 'bold');



% csarea = polyarea(x, y)*0.000001;

% %text('String', sprintf('area: %.2f km^2', csarea), ...
%     %'Color', 'k', 'FontName', 'Times New Roman', 'FontSize', 12, ...
%     %'Units', 'normalized', 'Position', [0.02, 0.05]);

% %text('String', 'SSP1-2.6', %'Color', 'k', 'FontName', 'Times New Roman', 'FontSize', 12, ...
%     'Units', 'normalized', 'Position', [0.05, 0.95]);

xticks([]); xlabel(sprintf('%.0f km^2', csarea), 'FontName', 'Times New Roman', 'FontSize', 14); 
yticks([]);
set(gca, 'fontname','Times New Roman');

%xlabel(sprintf('%.0f km^2', csarea), 'FontName', 'Times New Roman', 'FontSize', 14,'FontWeight','bold');

nexttile;
desired_depth =  csl_m_126(9); 
csarea=area_126(9);
contour(image_data, [desired_depth, desired_depth], 'LineColor', 'r', 'LineWidth', 1.2);
% title(['CSL: ', num2str(desired_depth)]); 
title(sprintf('%d: %.2f m', date(9), desired_depth),'FontSize', 14);
axis equal
set(gca,'ydir','reverse');

image_data = double(image_data);
contour_data = contourc(image_data, [desired_depth, desired_depth]);
x = contour_data(1, 2:end); % x-coordinates of the contour segments
y = contour_data(2, 2:end); % y-coordinates of the contour segments
% csarea = polyarea(x, y)*0.000001;
% 
%xlabel(sprintf('%.0f km^2', csarea), 'FontName', 'Times New Roman', 'FontSize', 14,'FontWeight','bold');


% %text('String', sprintf('area: %.2f km^2', csarea), ...
%     %'Color', 'k', 'FontName', 'Times New Roman', 'FontSize', 12, ...
%     %'Units', 'normalized', 'Position', [0.02, 0.05]);

% %text('String', 'SSP1-2.6', %'Color', 'k', 'FontName', 'Times New Roman', 'FontSize', 12, ...
%     'Units', 'normalized', 'Position', [0.05, 0.95]);

xticks([]); xlabel(sprintf('%.0f km^2', csarea), 'FontName', 'Times New Roman', 'FontSize', 14); 
yticks([]);

set(gca, 'fontname','Times New Roman');



nexttile;
desired_depth =  csl_m_126(19); 
csarea=area_126(19);
contour(image_data, [desired_depth, desired_depth], 'LineColor', 'r', 'LineWidth', 1.2);
% title(['CSL: ', num2str(desired_depth)]); 
title(sprintf('%d: %.2f m', date(19), desired_depth),'FontSize', 14);
axis equal
set(gca,'ydir','reverse');

image_data = double(image_data);
contour_data = contourc(image_data, [desired_depth, desired_depth]);
x = contour_data(1, 2:end); % x-coordinates of the contour segments
y = contour_data(2, 2:end); % y-coordinates of the contour segments
% csarea = polyarea(x, y)*0.000001;

% %text('String', sprintf('area: %.2f km^2', csarea), ...
%     %'Color', 'k', 'FontName', 'Times New Roman', 'FontSize', 12, ...
%     %'Units', 'normalized', 'Position', [0.02, 0.05]);

% %text('String', 'SSP1-2.6', %'Color', 'k', 'FontName', 'Times New Roman', 'FontSize', 12, ...
%     'Units', 'normalized', 'Position', [0.05, 0.95]);

xticks([]); xlabel(sprintf('%.0f km^2', csarea), 'FontName', 'Times New Roman', 'FontSize', 14); 
yticks([]);

set(gca, 'fontname','Times New Roman');

nexttile;
desired_depth =  csl_m_126(29); 
csarea=area_126(29);
contour(image_data, [desired_depth, desired_depth], 'LineColor', 'r', 'LineWidth', 1.2);
% title(['CSL: ', num2str(desired_depth)]); 
title(sprintf('%d: %.2f m', date(29), desired_depth),'FontSize', 14);
axis equal
set(gca,'ydir','reverse');

image_data = double(image_data);
contour_data = contourc(image_data, [desired_depth, desired_depth]);
x = contour_data(1, 2:end); % x-coordinates of the contour segments
y = contour_data(2, 2:end); % y-coordinates of the contour segments
% csarea = polyarea(x, y)*0.000001;

% %text('String', sprintf('area: %.2f km^2', csarea), ...
%     %'Color', 'k', 'FontName', 'Times New Roman', 'FontSize', 12, ...
%     %'Units', 'normalized', 'Position', [0.02, 0.05]);

% %text('String', 'SSP1-2.6', %'Color', 'k', 'FontName', 'Times New Roman', 'FontSize', 12, ...
%     'Units', 'normalized', 'Position', [0.05, 0.95]);

xticks([]); xlabel(sprintf('%.0f km^2', csarea), 'FontName', 'Times New Roman', 'FontSize', 14); 
yticks([]);

set(gca, 'fontname','Times New Roman');

nexttile;
desired_depth =  csl_m_126(39); 
csarea=area_126(39);
contour(image_data, [desired_depth, desired_depth], 'LineColor', 'r', 'LineWidth', 1.2);
% title(['CSL: ', num2str(desired_depth)]); 
title(sprintf('%d: %.2f m', date(39), desired_depth),'FontSize', 14);
axis equal
set(gca,'ydir','reverse');

image_data = double(image_data);
contour_data = contourc(image_data, [desired_depth, desired_depth]);
x = contour_data(1, 2:end); % x-coordinates of the contour segments
y = contour_data(2, 2:end); % y-coordinates of the contour segments
% csarea = polyarea(x, y)*0.000001;

% %text('String', sprintf('area: %.2f km^2', csarea), ...
%     %'Color', 'k', 'FontName', 'Times New Roman', 'FontSize', 12, ...
%     %'Units', 'normalized', 'Position', [0.02, 0.05]);

% %text('String', 'SSP1-2.6', %'Color', 'k', 'FontName', 'Times New Roman', 'FontSize', 12, ...
%     'Units', 'normalized', 'Position', [0.05, 0.95]);

xticks([]); xlabel(sprintf('%.0f km^2', csarea), 'FontName', 'Times New Roman', 'FontSize', 14); 
yticks([]);

set(gca, 'fontname','Times New Roman');

nexttile;
desired_depth =  csl_m_126(49); 
csarea=area_126(49);
contour(image_data, [desired_depth, desired_depth], 'LineColor', 'r', 'LineWidth', 1.2);
% title(['CSL: ', num2str(desired_depth)]); 
title(sprintf('%d: %.2f m', date(49), desired_depth),'FontSize', 14);
axis equal
set(gca,'ydir','reverse');

image_data = double(image_data);
contour_data = contourc(image_data, [desired_depth, desired_depth]);
x = contour_data(1, 2:end); % x-coordinates of the contour segments
y = contour_data(2, 2:end); % y-coordinates of the contour segments
% csarea = polyarea(x, y)*0.000001;

% %text('String', sprintf('area: %.2f km^2', csarea), ...
%     %'Color', 'k', 'FontName', 'Times New Roman', 'FontSize', 12, ...
%     %'Units', 'normalized', 'Position', [0.02, 0.05]);

% %text('String', 'SSP1-2.6', %'Color', 'k', 'FontName', 'Times New Roman', 'FontSize', 12, ...
%     'Units', 'normalized', 'Position', [0.05, 0.95]);

xticks([]); xlabel(sprintf('%.0f km^2', csarea), 'FontName', 'Times New Roman', 'FontSize', 14); 
yticks([]);

set(gca, 'fontname','Times New Roman');

nexttile;
desired_depth =  csl_m_126(59); 
csarea=area_126(59);
contour(image_data, [desired_depth, desired_depth], 'LineColor', 'r', 'LineWidth', 1.2);
% title(['CSL: ', num2str(desired_depth)]); 
title(sprintf('%d: %.2f m', date(59), desired_depth),'FontSize', 14);
axis equal
set(gca,'ydir','reverse');

image_data = double(image_data);
contour_data = contourc(image_data, [desired_depth, desired_depth]);
x = contour_data(1, 2:end); % x-coordinates of the contour segments
y = contour_data(2, 2:end); % y-coordinates of the contour segments
% csarea = polyarea(x, y)*0.000001;

% %text('String', sprintf('area: %.2f km^2', csarea), ...
%     %'Color', 'k', 'FontName', 'Times New Roman', 'FontSize', 12, ...
%     %'Units', 'normalized', 'Position', [0.02, 0.05]);

% %text('String', 'SSP1-2.6', %'Color', 'k', 'FontName', 'Times New Roman', 'FontSize', 12, ...
%     'Units', 'normalized', 'Position', [0.05, 0.95]);

xticks([]); xlabel(sprintf('%.0f km^2', csarea), 'FontName', 'Times New Roman', 'FontSize', 14); 
yticks([]);

set(gca, 'fontname','Times New Roman');

nexttile;
desired_depth =  csl_m_126(69);
csarea=area_126(69);
contour(image_data, [desired_depth, desired_depth], 'LineColor', 'r', 'LineWidth', 1.2);
% title(['CSL: ', num2str(desired_depth)]); 
title(sprintf('%d: %.2f m', date(69), desired_depth),'FontSize', 14);
axis equal
set(gca,'ydir','reverse');

image_data = double(image_data);
contour_data = contourc(image_data, [desired_depth, desired_depth]);
x = contour_data(1, 2:end); % x-coordinates of the contour segments
y = contour_data(2, 2:end); % y-coordinates of the contour segments
% csarea = polyarea(x, y)*0.000001;

%text('String', sprintf('area: %.2f km^2', csarea), ...
%     %'Color', 'k', 'FontName', 'Times New Roman', 'FontSize', 12, ...
%     %'Units', 'normalized', 'Position', [0.02, 0.05]);

% %text('String', 'SSP1-2.6', %'Color', 'k', 'FontName', 'Times New Roman', 'FontSize', 12, ...
%     'Units', 'normalized', 'Position', [0.05, 0.95]);

xticks([]); xlabel(sprintf('%.0f km^2', csarea), 'FontName', 'Times New Roman', 'FontSize', 14); 
yticks([]);

set(gca, 'fontname','Times New Roman');

nexttile;
desired_depth =  csl_m_126(79); 
csarea=area_126(79);
contour(image_data, [desired_depth, desired_depth], 'LineColor', 'r', 'LineWidth', 1.2);
% title(['CSL: ', num2str(desired_depth)]); 
title(sprintf('%d: %.2f m', date(79), desired_depth),'FontSize', 14);
axis equal
set(gca,'ydir','reverse');

image_data = double(image_data);
contour_data = contourc(image_data, [desired_depth, desired_depth]);
x = contour_data(1, 2:end); % x-coordinates of the contour segments
y = contour_data(2, 2:end); % y-coordinates of the contour segments
% csarea = polyarea(x, y)*0.000001;
% 
%text('String', sprintf('area: %.2f km^2', csarea), ...
%     %'Color', 'k', 'FontName', 'Times New Roman', 'FontSize', 12, ...
%     %'Units', 'normalized', 'Position', [0.02, 0.05]);

% %text('String', 'SSP1-2.6', %'Color', 'k', 'FontName', 'Times New Roman', 'FontSize', 12, ...
%     'Units', 'normalized', 'Position', [0.05, 0.95]);

xticks([]); xlabel(sprintf('%.0f km^2', csarea), 'FontName', 'Times New Roman', 'FontSize', 14); 
yticks([]);

set(gca, 'fontname','Times New Roman');


%%
%245
nexttile;
desired_depth =  csl_m_245(1); 
csarea=area_245(1); 
contour(image_data, [desired_depth, desired_depth], 'LineColor',[1 0.9 0], 'LineWidth', 1.2);

% title(['CSL: ', num2str(desired_depth)]); 
title(sprintf('%d: %.2f m', date(1), desired_depth),'FontSize', 14);
axis equal
set(gca,'ydir','reverse');

image_data = double(image_data);
contour_data = contourc(image_data, [desired_depth, desired_depth]);
x = contour_data(1, 2:end); % x-coordinates of the contour segments
y = contour_data(2, 2:end); % y-coordinates of the contour segments

ylabel('Medium', 'Color', 'k', 'FontName', 'Times New Roman', 'FontSize', 16, 'Fontweight', 'bold');



% csarea = polyarea(x, y)*0.000001;

%text('String', sprintf('area: %.2f km^2', csarea), ...
    %'Color', 'k', 'FontName', 'Times New Roman', 'FontSize', 12, ...
    %'Units', 'normalized', 'Position', [0.02, 0.05]);

% %text('String', 'SSP2-4.5', %'Color', 'k', 'FontName', 'Times New Roman', 'FontSize', 12, ...
%     'Units', 'normalized', 'Position', [0.05, 0.95]);

xticks([]); xlabel(sprintf('%.0f km^2', csarea), 'FontName', 'Times New Roman', 'FontSize', 14); 
yticks([]);

set(gca, 'fontname','Times New Roman');


nexttile;
desired_depth =  csl_m_245(9); 
csarea=area_245(9);
contour(image_data, [desired_depth, desired_depth], 'LineColor',[1 0.9 0], 'LineWidth', 1.2);
% title(['CSL: ', num2str(desired_depth)]); 
title(sprintf('%d: %.2f m', date(9), desired_depth),'FontSize', 14);
axis equal
set(gca,'ydir','reverse');

image_data = double(image_data);
contour_data = contourc(image_data, [desired_depth, desired_depth]);
x = contour_data(1, 2:end); % x-coordinates of the contour segments
y = contour_data(2, 2:end); % y-coordinates of the contour segments
% csarea = polyarea(x, y)*0.000001;
% 
%text('String', sprintf('area: %.2f km^2', csarea), ...
    %'Color', 'k', 'FontName', 'Times New Roman', 'FontSize', 12, ...
    %'Units', 'normalized', 'Position', [0.02, 0.05]);

% %text('String', 'SSP2-4.5', %'Color', 'k', 'FontName', 'Times New Roman', 'FontSize', 12, ...
%     'Units', 'normalized', 'Position', [0.05, 0.95]);

xticks([]); xlabel(sprintf('%.0f km^2', csarea), 'FontName', 'Times New Roman', 'FontSize', 14); 
yticks([]);

set(gca, 'fontname','Times New Roman');



nexttile;
desired_depth =  csl_m_245(19); 
csarea=area_245(19);
contour(image_data, [desired_depth, desired_depth], 'LineColor',[1 0.9 0], 'LineWidth', 1.2);
% title(['CSL: ', num2str(desired_depth)]); 
title(sprintf('%d: %.2f m', date(19), desired_depth),'FontSize', 14);
axis equal
set(gca,'ydir','reverse');

image_data = double(image_data);
contour_data = contourc(image_data, [desired_depth, desired_depth]);
x = contour_data(1, 2:end); % x-coordinates of the contour segments
y = contour_data(2, 2:end); % y-coordinates of the contour segments
% csarea = polyarea(x, y)*0.000001;

%text('String', sprintf('area: %.2f km^2', csarea), ...
    %'Color', 'k', 'FontName', 'Times New Roman', 'FontSize', 12, ...
    %'Units', 'normalized', 'Position', [0.02, 0.05]);

% %text('String', 'SSP2-4.5', %'Color', 'k', 'FontName', 'Times New Roman', 'FontSize', 12, ...
%     'Units', 'normalized', 'Position', [0.05, 0.95]);

xticks([]); xlabel(sprintf('%.0f km^2', csarea), 'FontName', 'Times New Roman', 'FontSize', 14); 
yticks([]);

set(gca, 'fontname','Times New Roman');

nexttile;
desired_depth =  csl_m_245(29); 
csarea=area_245(29);
contour(image_data, [desired_depth, desired_depth], 'LineColor',[1 0.9 0], 'LineWidth', 1.2);
% title(['CSL: ', num2str(desired_depth)]); 
title(sprintf('%d: %.2f m', date(29), desired_depth),'FontSize', 14);
axis equal
set(gca,'ydir','reverse');

image_data = double(image_data);
contour_data = contourc(image_data, [desired_depth, desired_depth]);
x = contour_data(1, 2:end); % x-coordinates of the contour segments
y = contour_data(2, 2:end); % y-coordinates of the contour segments
% csarea = polyarea(x, y)*0.000001;

%text('String', sprintf('area: %.2f km^2', csarea), ...
    %'Color', 'k', 'FontName', 'Times New Roman', 'FontSize', 12, ...
    %'Units', 'normalized', 'Position', [0.02, 0.05]);

% %text('String', 'SSP2-4.5', %'Color', 'k', 'FontName', 'Times New Roman', 'FontSize', 12, ...
%     'Units', 'normalized', 'Position', [0.05, 0.95]);

xticks([]); xlabel(sprintf('%.0f km^2', csarea), 'FontName', 'Times New Roman', 'FontSize', 14); 
yticks([]);

set(gca, 'fontname','Times New Roman');

nexttile;
desired_depth =  csl_m_245(39); 
csarea=area_245(39);
contour(image_data, [desired_depth, desired_depth], 'LineColor',[1 0.9 0], 'LineWidth', 1.2);
% title(['CSL: ', num2str(desired_depth)]); 
title(sprintf('%d: %.2f m', date(39), desired_depth),'FontSize', 14);
axis equal
set(gca,'ydir','reverse');

image_data = double(image_data);
contour_data = contourc(image_data, [desired_depth, desired_depth]);
x = contour_data(1, 2:end); % x-coordinates of the contour segments
y = contour_data(2, 2:end); % y-coordinates of the contour segments
% csarea = polyarea(x, y)*0.000001;

%text('String', sprintf('area: %.2f km^2', csarea), ...
    %'Color', 'k', 'FontName', 'Times New Roman', 'FontSize', 12, ...
    %'Units', 'normalized', 'Position', [0.02, 0.05]);

% %text('String', 'SSP2-4.5', %'Color', 'k', 'FontName', 'Times New Roman', 'FontSize', 12, ...
%     'Units', 'normalized', 'Position', [0.05, 0.95]);

xticks([]); xlabel(sprintf('%.0f km^2', csarea), 'FontName', 'Times New Roman', 'FontSize', 14); 
yticks([]);

set(gca, 'fontname','Times New Roman');

nexttile;
desired_depth =  csl_m_245(49); 
csarea=area_245(49);
contour(image_data, [desired_depth, desired_depth], 'LineColor',[1 0.9 0], 'LineWidth', 1.2);
% title(['CSL: ', num2str(desired_depth)]); 
title(sprintf('%d: %.2f m', date(49), desired_depth),'FontSize', 14);
axis equal
set(gca,'ydir','reverse');

image_data = double(image_data);
contour_data = contourc(image_data, [desired_depth, desired_depth]);
x = contour_data(1, 2:end); % x-coordinates of the contour segments
y = contour_data(2, 2:end); % y-coordinates of the contour segments
% csarea = polyarea(x, y)*0.000001;

%text('String', sprintf('area: %.2f km^2', csarea), ...
    %'Color', 'k', 'FontName', 'Times New Roman', 'FontSize', 12, ...
    %'Units', 'normalized', 'Position', [0.02, 0.05]);

% %text('String', 'SSP2-4.5', %'Color', 'k', 'FontName', 'Times New Roman', 'FontSize', 12, ...
%     'Units', 'normalized', 'Position', [0.05, 0.95]);

xticks([]); xlabel(sprintf('%.0f km^2', csarea), 'FontName', 'Times New Roman', 'FontSize', 14); 
yticks([]);

set(gca, 'fontname','Times New Roman');

nexttile;
desired_depth =  csl_m_245(59); 
csarea=area_245(59);
contour(image_data, [desired_depth, desired_depth], 'LineColor',[1 0.9 0], 'LineWidth', 1.2);
% title(['CSL: ', num2str(desired_depth)]); 
title(sprintf('%d: %.2f m', date(59), desired_depth),'FontSize', 14);
axis equal
set(gca,'ydir','reverse');

image_data = double(image_data);
contour_data = contourc(image_data, [desired_depth, desired_depth]);
x = contour_data(1, 2:end); % x-coordinates of the contour segments
y = contour_data(2, 2:end); % y-coordinates of the contour segments
% csarea = polyarea(x, y)*0.000001;

%text('String', sprintf('area: %.2f km^2', csarea), ...
    %'Color', 'k', 'FontName', 'Times New Roman', 'FontSize', 12, ...
    %'Units', 'normalized', 'Position', [0.02, 0.05]);

% %text('String', 'SSP2-4.5', %'Color', 'k', 'FontName', 'Times New Roman', 'FontSize', 12, ...
%     'Units', 'normalized', 'Position', [0.05, 0.95]);

xticks([]); xlabel(sprintf('%.0f km^2', csarea), 'FontName', 'Times New Roman', 'FontSize', 14); 
yticks([]);

set(gca, 'fontname','Times New Roman');

nexttile;
desired_depth =  csl_m_245(69);
csarea=area_245(69);
contour(image_data, [desired_depth, desired_depth], 'LineColor',[1 0.9 0], 'LineWidth', 1.2);
% title(['CSL: ', num2str(desired_depth)]); 
title(sprintf('%d: %.2f m', date(69), desired_depth),'FontSize', 14);
axis equal
set(gca,'ydir','reverse');

image_data = double(image_data);
contour_data = contourc(image_data, [desired_depth, desired_depth]);
x = contour_data(1, 2:end); % x-coordinates of the contour segments
y = contour_data(2, 2:end); % y-coordinates of the contour segments
% csarea = polyarea(x, y)*0.000001;

%text('String', sprintf('area: %.2f km^2', csarea), ...
    %'Color', 'k', 'FontName', 'Times New Roman', 'FontSize', 12, ...
    %'Units', 'normalized', 'Position', [0.02, 0.05]);

% %text('String', 'SSP2-4.5', %'Color', 'k', 'FontName', 'Times New Roman', 'FontSize', 12, ...
%     'Units', 'normalized', 'Position', [0.05, 0.95]);

xticks([]); xlabel(sprintf('%.0f km^2', csarea), 'FontName', 'Times New Roman', 'FontSize', 14); 
yticks([]);

set(gca, 'fontname','Times New Roman');

nexttile;
desired_depth =  csl_m_245(79); 
csarea=area_245(79);
contour(image_data, [desired_depth, desired_depth], 'LineColor',[1 0.9 0], 'LineWidth', 1.2);
% title(['CSL: ', num2str(desired_depth)]); 
title(sprintf('%d: %.2f m', date(79), desired_depth),'FontSize', 14);
axis equal
set(gca,'ydir','reverse');

image_data = double(image_data);
contour_data = contourc(image_data, [desired_depth, desired_depth]);
x = contour_data(1, 2:end); % x-coordinates of the contour segments
y = contour_data(2, 2:end); % y-coordinates of the contour segments
% csarea = polyarea(x, y)*0.000001;
% 
%text('String', sprintf('area: %.2f km^2', csarea), ...
    %'Color', 'k', 'FontName', 'Times New Roman', 'FontSize', 12, ...
    %'Units', 'normalized', 'Position', [0.02, 0.05]);

% %text('String', 'SSP2-4.5', %'Color', 'k', 'FontName', 'Times New Roman', 'FontSize', 12, ...
%     'Units', 'normalized', 'Position', [0.05, 0.95]);

xticks([]); xlabel(sprintf('%.0f km^2', csarea), 'FontName', 'Times New Roman', 'FontSize', 14); 
yticks([]);

set(gca, 'fontname','Times New Roman');
%%
%370
nexttile;
desired_depth =  csl_m_370(1); 
csarea=area_370(1); 
contour(image_data, [desired_depth, desired_depth], 'LineColor','b', 'LineWidth', 1.2);

% title(['CSL: ', num2str(desired_depth)]); 
title(sprintf('%d: %.2f m', date(1), desired_depth),'FontSize', 14);
axis equal
set(gca,'ydir','reverse');

image_data = double(image_data);
contour_data = contourc(image_data, [desired_depth, desired_depth]);
x = contour_data(1, 2:end); % x-coordinates of the contour segments
y = contour_data(2, 2:end); % y-coordinates of the contour segments

ylabel('Medium-to-high', 'Color', 'k', 'FontName', 'Times New Roman', 'FontSize', 16, 'Fontweight', 'bold');



% csarea = polyarea(x, y)*0.000001;

%text('String', sprintf('area: %.2f km^2', csarea), ...
    %'Color', 'k', 'FontName', 'Times New Roman', 'FontSize', 12, ...
    %'Units', 'normalized', 'Position', [0.02, 0.05]);

% %text('String', 'SSP3-7.0', %'Color', 'k', 'FontName', 'Times New Roman', 'FontSize', 12, ...
%     'Units', 'normalized', 'Position', [0.05, 0.95]);

xticks([]); xlabel(sprintf('%.0f km^2', csarea), 'FontName', 'Times New Roman', 'FontSize', 14); 
yticks([]);

set(gca, 'fontname','Times New Roman');


nexttile;
desired_depth =  csl_m_370(9); 
csarea=area_370(9);
contour(image_data, [desired_depth, desired_depth], 'LineColor','b', 'LineWidth', 1.2);
% title(['CSL: ', num2str(desired_depth)]); 
title(sprintf('%d: %.2f m', date(9), desired_depth),'FontSize', 14);
axis equal
set(gca,'ydir','reverse');

image_data = double(image_data);
contour_data = contourc(image_data, [desired_depth, desired_depth]);
x = contour_data(1, 2:end); % x-coordinates of the contour segments
y = contour_data(2, 2:end); % y-coordinates of the contour segments
% csarea = polyarea(x, y)*0.000001;
% 
%text('String', sprintf('area: %.2f km^2', csarea), ...
    %'Color', 'k', 'FontName', 'Times New Roman', 'FontSize', 12, ...
    %'Units', 'normalized', 'Position', [0.02, 0.05]);

% %text('String', 'SSP3-7.0', %'Color', 'k', 'FontName', 'Times New Roman', 'FontSize', 12, ...
%     'Units', 'normalized', 'Position', [0.05, 0.95]);

xticks([]); xlabel(sprintf('%.0f km^2', csarea), 'FontName', 'Times New Roman', 'FontSize', 14); 
yticks([]);

set(gca, 'fontname','Times New Roman');



nexttile;
desired_depth =  csl_m_370(19); 
csarea=area_370(19);
contour(image_data, [desired_depth, desired_depth], 'LineColor','b', 'LineWidth', 1.2);
% title(['CSL: ', num2str(desired_depth)]); 
title(sprintf('%d: %.2f m', date(19), desired_depth),'FontSize', 14);
axis equal
set(gca,'ydir','reverse');

image_data = double(image_data);
contour_data = contourc(image_data, [desired_depth, desired_depth]);
x = contour_data(1, 2:end); % x-coordinates of the contour segments
y = contour_data(2, 2:end); % y-coordinates of the contour segments
% csarea = polyarea(x, y)*0.000001;

%text('String', sprintf('area: %.2f km^2', csarea), ...
    %'Color', 'k', 'FontName', 'Times New Roman', 'FontSize', 12, ...
    %'Units', 'normalized', 'Position', [0.02, 0.05]);

% %text('String', 'SSP3-7.0', %'Color', 'k', 'FontName', 'Times New Roman', 'FontSize', 12, ...
%     'Units', 'normalized', 'Position', [0.05, 0.95]);

xticks([]); xlabel(sprintf('%.0f km^2', csarea), 'FontName', 'Times New Roman', 'FontSize', 14); 
yticks([]);

set(gca, 'fontname','Times New Roman');

nexttile;
desired_depth =  csl_m_370(29); 
csarea=area_370(29);
contour(image_data, [desired_depth, desired_depth], 'LineColor','b', 'LineWidth', 1.2);
% title(['CSL: ', num2str(desired_depth)]); 
title(sprintf('%d: %.2f m', date(29), desired_depth),'FontSize', 14);
axis equal
set(gca,'ydir','reverse');

image_data = double(image_data);
contour_data = contourc(image_data, [desired_depth, desired_depth]);
x = contour_data(1, 2:end); % x-coordinates of the contour segments
y = contour_data(2, 2:end); % y-coordinates of the contour segments
% csarea = polyarea(x, y)*0.000001;

%text('String', sprintf('area: %.2f km^2', csarea), ...
    %'Color', 'k', 'FontName', 'Times New Roman', 'FontSize', 12, ...
    %'Units', 'normalized', 'Position', [0.02, 0.05]);

% %text('String', 'SSP3-7.0', %'Color', 'k', 'FontName', 'Times New Roman', 'FontSize', 12, ...
%     'Units', 'normalized', 'Position', [0.05, 0.95]);

xticks([]); xlabel(sprintf('%.0f km^2', csarea), 'FontName', 'Times New Roman', 'FontSize', 14); 
yticks([]);

set(gca, 'fontname','Times New Roman');

nexttile;
desired_depth =  csl_m_370(39); 
csarea=area_370(39);
contour(image_data, [desired_depth, desired_depth], 'LineColor','b', 'LineWidth', 1.2);
% title(['CSL: ', num2str(desired_depth)]); 
title(sprintf('%d: %.2f m', date(39), desired_depth),'FontSize', 14);
axis equal
set(gca,'ydir','reverse');

image_data = double(image_data);
contour_data = contourc(image_data, [desired_depth, desired_depth]);
x = contour_data(1, 2:end); % x-coordinates of the contour segments
y = contour_data(2, 2:end); % y-coordinates of the contour segments
% csarea = polyarea(x, y)*0.000001;

%text('String', sprintf('area: %.2f km^2', csarea), ...
    %'Color', 'k', 'FontName', 'Times New Roman', 'FontSize', 12, ...
    %'Units', 'normalized', 'Position', [0.02, 0.05]);

% %text('String', 'SSP3-7.0', %'Color', 'k', 'FontName', 'Times New Roman', 'FontSize', 12, ...
%     'Units', 'normalized', 'Position', [0.05, 0.95]);

xticks([]); xlabel(sprintf('%.0f km^2', csarea), 'FontName', 'Times New Roman', 'FontSize', 14); 
yticks([]);

set(gca, 'fontname','Times New Roman');

nexttile;
desired_depth =  csl_m_370(49); 
csarea=area_370(49);
contour(image_data, [desired_depth, desired_depth], 'LineColor','b', 'LineWidth', 1.2);
% title(['CSL: ', num2str(desired_depth)]); 
title(sprintf('%d: %.2f m', date(49), desired_depth),'FontSize', 14);
axis equal
set(gca,'ydir','reverse');

image_data = double(image_data);
contour_data = contourc(image_data, [desired_depth, desired_depth]);
x = contour_data(1, 2:end); % x-coordinates of the contour segments
y = contour_data(2, 2:end); % y-coordinates of the contour segments
% csarea = polyarea(x, y)*0.000001;

%text('String', sprintf('area: %.2f km^2', csarea), ...
    %'Color', 'k', 'FontName', 'Times New Roman', 'FontSize', 12, ...
    %'Units', 'normalized', 'Position', [0.02, 0.05]);

% %text('String', 'SSP3-7.0', %'Color', 'k', 'FontName', 'Times New Roman', 'FontSize', 12, ...
%     'Units', 'normalized', 'Position', [0.05, 0.95]);

xticks([]); xlabel(sprintf('%.0f km^2', csarea), 'FontName', 'Times New Roman', 'FontSize', 14); 
yticks([]);

set(gca, 'fontname','Times New Roman');

nexttile;
desired_depth =  csl_m_370(59); 
csarea=area_370(59);
contour(image_data, [desired_depth, desired_depth], 'LineColor','b', 'LineWidth', 1.2);
% title(['CSL: ', num2str(desired_depth)]); 
title(sprintf('%d: %.2f m', date(59), desired_depth),'FontSize', 14);
axis equal
set(gca,'ydir','reverse');

image_data = double(image_data);
contour_data = contourc(image_data, [desired_depth, desired_depth]);
x = contour_data(1, 2:end); % x-coordinates of the contour segments
y = contour_data(2, 2:end); % y-coordinates of the contour segments
% csarea = polyarea(x, y)*0.000001;

%text('String', sprintf('area: %.2f km^2', csarea), ...
    %'Color', 'k', 'FontName', 'Times New Roman', 'FontSize', 12, ...
    %'Units', 'normalized', 'Position', [0.02, 0.05]);

% %text('String', 'SSP3-7.0', %'Color', 'k', 'FontName', 'Times New Roman', 'FontSize', 12, ...
%     'Units', 'normalized', 'Position', [0.05, 0.95]);

xticks([]); xlabel(sprintf('%.0f km^2', csarea), 'FontName', 'Times New Roman', 'FontSize', 14); 
yticks([]);

set(gca, 'fontname','Times New Roman');

nexttile;
desired_depth =  csl_m_370(69);
csarea=area_370(69);
contour(image_data, [desired_depth, desired_depth], 'LineColor','b', 'LineWidth', 1.2);
% title(['CSL: ', num2str(desired_depth)]); 
title(sprintf('%d: %.2f m', date(69), desired_depth),'FontSize', 14);
axis equal
set(gca,'ydir','reverse');

image_data = double(image_data);
contour_data = contourc(image_data, [desired_depth, desired_depth]);
x = contour_data(1, 2:end); % x-coordinates of the contour segments
y = contour_data(2, 2:end); % y-coordinates of the contour segments
% csarea = polyarea(x, y)*0.000001;

%text('String', sprintf('area: %.2f km^2', csarea), ...
    %'Color', 'k', 'FontName', 'Times New Roman', 'FontSize', 12, ...
    %'Units', 'normalized', 'Position', [0.02, 0.05]);

% %text('String', 'SSP3-7.0', %'Color', 'k', 'FontName', 'Times New Roman', 'FontSize', 12, ...
%     'Units', 'normalized', 'Position', [0.05, 0.95]);

xticks([]); xlabel(sprintf('%.0f km^2', csarea), 'FontName', 'Times New Roman', 'FontSize', 14); 
yticks([]);

set(gca, 'fontname','Times New Roman');

nexttile;
desired_depth =  csl_m_370(79); 
csarea=area_370(79);
contour(image_data, [desired_depth, desired_depth], 'LineColor','b', 'LineWidth', 1.2);
% title(['CSL: ', num2str(desired_depth)]); 
title(sprintf('%d: %.2f m', date(79), desired_depth),'FontSize', 14);
axis equal
set(gca,'ydir','reverse');

image_data = double(image_data);
contour_data = contourc(image_data, [desired_depth, desired_depth]);
x = contour_data(1, 2:end); % x-coordinates of the contour segments
y = contour_data(2, 2:end); % y-coordinates of the contour segments
% csarea = polyarea(x, y)*0.000001;
% 
%text('String', sprintf('area: %.2f km^2', csarea), ...
    %'Color', 'k', 'FontName', 'Times New Roman', 'FontSize', 12, ...
    %'Units', 'normalized', 'Position', [0.02, 0.05]);

% %text('String', 'SSP3-7.0', %'Color', 'k', 'FontName', 'Times New Roman', 'FontSize', 12, ...
%     'Units', 'normalized', 'Position', [0.05, 0.95]);

xticks([]); xlabel(sprintf('%.0f km^2', csarea), 'FontName', 'Times New Roman', 'FontSize', 14); 
yticks([]);

set(gca, 'fontname','Times New Roman');

%%

nexttile;
desired_depth =  csl_m_585(1); 
csarea=area_585(1); 
contour(image_data, [desired_depth, desired_depth], 'LineColor',[0,0.5,0], 'LineWidth', 1.2);

% title(['CSL: ', num2str(desired_depth)]); 
title(sprintf('%d: %.2f m', date(1), desired_depth),'FontSize', 14);
axis equal
set(gca,'ydir','reverse');

image_data = double(image_data);
contour_data = contourc(image_data, [desired_depth, desired_depth]);
x = contour_data(1, 2:end); % x-coordinates of the contour segments
y = contour_data(2, 2:end); % y-coordinates of the contour segments

ylabel('High', 'Color', 'k', 'FontName', 'Times New Roman', 'FontSize', 16, 'Fontweight', 'bold');



% csarea = polyarea(x, y)*0.000001;

%text('String', sprintf('area: %.2f km^2', csarea), ...
    %'Color', 'k', 'FontName', 'Times New Roman', 'FontSize', 12, ...
    %'Units', 'normalized', 'Position', [0.02, 0.05]);

% %text('String', 'SSP5-8.5', %'Color', 'k', 'FontName', 'Times New Roman', 'FontSize', 12, ...
%     'Units', 'normalized', 'Position', [0.05, 0.95]);

xticks([]); xlabel(sprintf('%.0f km^2', csarea), 'FontName', 'Times New Roman', 'FontSize', 14); 
yticks([]);

set(gca, 'fontname','Times New Roman');


nexttile;
desired_depth =  csl_m_585(9); 
csarea=area_585(9);
contour(image_data, [desired_depth, desired_depth], 'LineColor',[0,0.5,0], 'LineWidth', 1.2);
% title(['CSL: ', num2str(desired_depth)]); 
title(sprintf('%d: %.2f m', date(9), desired_depth),'FontSize', 14);
axis equal
set(gca,'ydir','reverse');

image_data = double(image_data);
contour_data = contourc(image_data, [desired_depth, desired_depth]);
x = contour_data(1, 2:end); % x-coordinates of the contour segments
y = contour_data(2, 2:end); % y-coordinates of the contour segments
% csarea = polyarea(x, y)*0.000001;
% 
%text('String', sprintf('area: %.2f km^2', csarea), ...
    %'Color', 'k', 'FontName', 'Times New Roman', 'FontSize', 12, ...
    %'Units', 'normalized', 'Position', [0.02, 0.05]);

% %text('String', 'SSP5-8.5', %'Color', 'k', 'FontName', 'Times New Roman', 'FontSize', 12, ...
%     'Units', 'normalized', 'Position', [0.05, 0.95]);

xticks([]); xlabel(sprintf('%.0f km^2', csarea), 'FontName', 'Times New Roman', 'FontSize', 14); 
yticks([]);

set(gca, 'fontname','Times New Roman');



nexttile;
desired_depth =  csl_m_585(19); 
csarea=area_585(19);
contour(image_data, [desired_depth, desired_depth], 'LineColor',[0,0.5,0], 'LineWidth', 1.2);
% title(['CSL: ', num2str(desired_depth)]); 
title(sprintf('%d: %.2f m', date(19), desired_depth),'FontSize', 14);
axis equal
set(gca,'ydir','reverse');

image_data = double(image_data);
contour_data = contourc(image_data, [desired_depth, desired_depth]);
x = contour_data(1, 2:end); % x-coordinates of the contour segments
y = contour_data(2, 2:end); % y-coordinates of the contour segments
% csarea = polyarea(x, y)*0.000001;

%text('String', sprintf('area: %.2f km^2', csarea), ...
    %'Color', 'k', 'FontName', 'Times New Roman', 'FontSize', 12, ...
    %'Units', 'normalized', 'Position', [0.02, 0.05]);

% %text('String', 'SSP5-8.5', %'Color', 'k', 'FontName', 'Times New Roman', 'FontSize', 12, ...
%     'Units', 'normalized', 'Position', [0.05, 0.95]);

xticks([]); xlabel(sprintf('%.0f km^2', csarea), 'FontName', 'Times New Roman', 'FontSize', 14); 
yticks([]);

set(gca, 'fontname','Times New Roman');

nexttile;
desired_depth =  csl_m_585(29); 
csarea=area_585(29);
contour(image_data, [desired_depth, desired_depth], 'LineColor',[0,0.5,0], 'LineWidth', 1.2);
% title(['CSL: ', num2str(desired_depth)]); 
title(sprintf('%d: %.2f m', date(29), desired_depth),'FontSize', 14);
axis equal
set(gca,'ydir','reverse');

image_data = double(image_data);
contour_data = contourc(image_data, [desired_depth, desired_depth]);
x = contour_data(1, 2:end); % x-coordinates of the contour segments
y = contour_data(2, 2:end); % y-coordinates of the contour segments
% csarea = polyarea(x, y)*0.000001;

%text('String', sprintf('area: %.2f km^2', csarea), ...
    %'Color', 'k', 'FontName', 'Times New Roman', 'FontSize', 12, ...
    %'Units', 'normalized', 'Position', [0.02, 0.05]);

% %text('String', 'SSP5-8.5', %'Color', 'k', 'FontName', 'Times New Roman', 'FontSize', 12, ...
%     'Units', 'normalized', 'Position', [0.05, 0.95]);

xticks([]); xlabel(sprintf('%.0f km^2', csarea), 'FontName', 'Times New Roman', 'FontSize', 14); 
yticks([]);

set(gca, 'fontname','Times New Roman');

nexttile;
desired_depth =  csl_m_585(39); 
csarea=area_585(39);
contour(image_data, [desired_depth, desired_depth], 'LineColor',[0,0.5,0], 'LineWidth', 1.2);
% title(['CSL: ', num2str(desired_depth)]); 
title(sprintf('%d: %.2f m', date(39), desired_depth),'FontSize', 14);
axis equal
set(gca,'ydir','reverse');

image_data = double(image_data);
contour_data = contourc(image_data, [desired_depth, desired_depth]);
x = contour_data(1, 2:end); % x-coordinates of the contour segments
y = contour_data(2, 2:end); % y-coordinates of the contour segments
% csarea = polyarea(x, y)*0.000001;

%text('String', sprintf('area: %.2f km^2', csarea), ...
    %'Color', 'k', 'FontName', 'Times New Roman', 'FontSize', 12, ...
    %'Units', 'normalized', 'Position', [0.02, 0.05]);

% %text('String', 'SSP5-8.5', %'Color', 'k', 'FontName', 'Times New Roman', 'FontSize', 12, ...
%     'Units', 'normalized', 'Position', [0.05, 0.95]);

xticks([]); xlabel(sprintf('%.0f km^2', csarea), 'FontName', 'Times New Roman', 'FontSize', 14); 
yticks([]);

set(gca, 'fontname','Times New Roman');

nexttile;
desired_depth =  csl_m_585(49); 
csarea=area_585(49);
contour(image_data, [desired_depth, desired_depth], 'LineColor',[0,0.5,0], 'LineWidth', 1.2);
% title(['CSL: ', num2str(desired_depth)]); 
title(sprintf('%d: %.2f m', date(49), desired_depth),'FontSize', 14);
axis equal
set(gca,'ydir','reverse');

image_data = double(image_data);
contour_data = contourc(image_data, [desired_depth, desired_depth]);
x = contour_data(1, 2:end); % x-coordinates of the contour segments
y = contour_data(2, 2:end); % y-coordinates of the contour segments
% csarea = polyarea(x, y)*0.000001;

%text('String', sprintf('area: %.2f km^2', csarea), ...
    %'Color', 'k', 'FontName', 'Times New Roman', 'FontSize', 12, ...
    %'Units', 'normalized', 'Position', [0.02, 0.05]);

% %text('String', 'SSP5-8.5', %'Color', 'k', 'FontName', 'Times New Roman', 'FontSize', 12, ...
%     'Units', 'normalized', 'Position', [0.05, 0.95]);

xticks([]); xlabel(sprintf('%.0f km^2', csarea), 'FontName', 'Times New Roman', 'FontSize', 14); 
yticks([]);

set(gca, 'fontname','Times New Roman');

nexttile;
desired_depth =  csl_m_585(59); 
csarea=area_585(59);
contour(image_data, [desired_depth, desired_depth], 'LineColor',[0,0.5,0], 'LineWidth', 1.2);
% title(['CSL: ', num2str(desired_depth)]); 
title(sprintf('%d: %.2f m', date(59), desired_depth),'FontSize', 14);
axis equal
set(gca,'ydir','reverse');

image_data = double(image_data);
contour_data = contourc(image_data, [desired_depth, desired_depth]);
x = contour_data(1, 2:end); % x-coordinates of the contour segments
y = contour_data(2, 2:end); % y-coordinates of the contour segments
% csarea = polyarea(x, y)*0.000001;

%text('String', sprintf('area: %.2f km^2', csarea), ...
    %'Color', 'k', 'FontName', 'Times New Roman', 'FontSize', 12, ...
    %'Units', 'normalized', 'Position', [0.02, 0.05]);

% %text('String', 'SSP5-8.5', %'Color', 'k', 'FontName', 'Times New Roman', 'FontSize', 12, ...
%     'Units', 'normalized', 'Position', [0.05, 0.95]);

xticks([]); xlabel(sprintf('%.0f km^2', csarea), 'FontName', 'Times New Roman', 'FontSize', 14); 
yticks([]);

set(gca, 'fontname','Times New Roman');

nexttile;
desired_depth =  csl_m_585(69);
csarea=area_585(69);
contour(image_data, [desired_depth, desired_depth], 'LineColor',[0,0.5,0], 'LineWidth', 1.2);
% title(['CSL: ', num2str(desired_depth)]); 
title(sprintf('%d: %.2f m', date(69), desired_depth),'FontSize', 14);
axis equal
set(gca,'ydir','reverse');

image_data = double(image_data);
contour_data = contourc(image_data, [desired_depth, desired_depth]);
x = contour_data(1, 2:end); % x-coordinates of the contour segments
y = contour_data(2, 2:end); % y-coordinates of the contour segments
% csarea = polyarea(x, y)*0.000001;

%text('String', sprintf('area: %.2f km^2', csarea), ...
    %'Color', 'k', 'FontName', 'Times New Roman', 'FontSize', 12, ...
    %'Units', 'normalized', 'Position', [0.02, 0.05]);

% %text('String', 'SSP5-8.5', %'Color', 'k', 'FontName', 'Times New Roman', 'FontSize', 12, ...
%     'Units', 'normalized', 'Position', [0.05, 0.95]);

xticks([]); xlabel(sprintf('%.0f km^2', csarea), 'FontName', 'Times New Roman', 'FontSize', 14); 
yticks([]);

set(gca, 'fontname','Times New Roman');

nexttile;
desired_depth =  csl_m_585(79); 
csarea=area_585(79);
contour(image_data, [desired_depth, desired_depth], 'LineColor',[0,0.5,0], 'LineWidth', 1.2);
% title(['CSL: ', num2str(desired_depth)]); 
title(sprintf('%d: %.2f m', date(79), desired_depth),'FontSize', 14);
axis equal
set(gca,'ydir','reverse');

image_data = double(image_data);
contour_data = contourc(image_data, [desired_depth, desired_depth]);
x = contour_data(1, 2:end); % x-coordinates of the contour segments
y = contour_data(2, 2:end); % y-coordinates of the contour segments
% csarea = polyarea(x, y)*0.000001;
% 
%text('String', sprintf('area: %.2f km^2', csarea), ...
    %'Color', 'k', 'FontName', 'Times New Roman', 'FontSize', 12, ...
    %'Units', 'normalized', 'Position', [0.02, 0.05]);

% %text('String', 'SSP5-8.5', %'Color', 'k', 'FontName', 'Times New Roman', 'FontSize', 12, ...
%     'Units', 'normalized', 'Position', [0.05, 0.95]);

xticks([]); xlabel(sprintf('%.0f km^2', csarea), 'FontName', 'Times New Roman', 'FontSize', 14); 
yticks([]);

set(gca, 'fontname','Times New Roman');
