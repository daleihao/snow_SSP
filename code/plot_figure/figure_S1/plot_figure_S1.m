clear all;
close all;
clc;

%% get data
load('latlons.mat');

load('126_p_values.mat');
load('126_total_SWE_all.mat');
load('126_total_BC_all.mat');

Slope_BC_126 = Slope_BCs./nanmean(total_BCs_all(:,:,1:20),3)*100;
Slope_Dust_126 = Slope_dusts./nanmean(total_dusts_all(:,:,1:20),3)*100;

Slope_BC_126(p_val_BCs>=0.05 | nanmean(total_SWEs_all,3)<=5) = nan*100;
Slope_Dust_126(p_val_dusts>=0.05 | nanmean(total_SWEs_all,3)<=5) = nan*100;

load('585_p_values.mat');
load('585_total_SWE_all.mat');
load('585_total_BC_all.mat');

Slope_BC_585 = Slope_BCs./nanmean(total_BCs_all(:,:,1:20),3)*100;
Slope_Dust_585 = Slope_dusts./nanmean(total_dusts_all(:,:,1:20),3)*100;


Slope_BC_585(p_val_BCs>=0.05 | nanmean(total_SWEs_all,3)<=5) = nan;
Slope_Dust_585(p_val_dusts>=0.05 | nanmean(total_SWEs_all,3)<=5) = nan;

%% plot
[lons,lats] = meshgrid(double(lon_base),double(flipud(lat_base)));
figure;
colors_1 = flipud(brewermap(11, 'Spectral'));
colors_1 = flipud(brewermap(11, 'RdBu'));
colors_(6,:) = [0.9 0.9 0.9];

%colors_1 = crameri('batlow');
set(gcf,'unit','normalized','position',[0.1,0.05,0.42,0.72]);
set(gca, 'Position', [0 0 1 1])

ax1 = subplot('position', [0.06 + 0.421*(1-1) 0.53 0.43 0.426]);
colormap(colors_1)
plot_global_map(lats, lons, Slope_BC_126, -1, 1,"SSP126");
lab = ylabel('BC','fontweight','bold','fontsize',14);
x = lab.Position;
x(1) = x(1) + 0.25;
set(lab,'position',x)

text(-1.3,1.1,'a','fontweight','bold','fontsize',14)
% hcb = colorbar;
% hcb.Location = 'southoutside';
% hcb.Title.String = '%';
% hcb.Title.FontSize = 8;
% hcb.Title.FontWeight = 'Bold';
% x1=get(gca,'position');
% x=get(hcb,'Position');
% x(1) = 0.09;
% x(2)=0.5;
% x(3) = 0.24;
% set(hcb,'Position',x)
% 
ax2 = subplot('position', [0.06 + 0.46*(2-1) 0.53 0.43 0.426]);
colormap(colors_1)
plot_global_map(lats, lons,  Slope_BC_585, -1, 1,"SSP585");
text(-1.3,1.1,'b','fontweight','bold','fontsize',14)
% hcb = colorbar;
% hcb.Location = 'southoutside';
% hcb.Title.String = '%';
% hcb.Title.FontSize = 8;
% hcb.Title.FontWeight = 'Bold';
% x1=get(gca,'position');
% x=get(hcb,'Position');
% x(1) = 0.09+0.421;
% x(2)=0.5;
% x(3) = 0.24;
% set(hcb,'Position',x)



%%SWE
ax5 = subplot('position', [0.06 + 0.421*(1-1) 0.10 0.43 0.426]);
colormap(colors_1)
plot_global_map(lats, lons, Slope_Dust_126, -1, 1,"");
lab = ylabel('Dust','fontweight','bold','fontsize',14);
x = lab.Position;
x(1) = x(1) + 0.25;
set(lab,'position',x)

text(-1.3,1.1,'c','fontweight','bold','fontsize',14)
hcb = colorbar;
hcb.Location = 'southoutside';
hcb.Title.String = '%/yr';
hcb.Title.FontSize = 10;
hcb.Title.FontWeight = 'Bold';
x1=get(gca,'position');
x=get(hcb,'Position');
x(1) = 0.09;
x(2)=0.035;
x(3) = 0.37;
set(hcb,'Position',x)

ax6 = subplot('position', [0.06 + 0.46*(2-1) 0.10 0.43 0.426]);
colormap(colors_1)
plot_global_map(lats, lons, Slope_Dust_585, -1, 1,"");
text(-1.3,1.1,'d','fontweight','bold','fontsize',14)
hcb = colorbar;
hcb.Location = 'southoutside';
hcb.Title.String = '%/yr';
hcb.Title.FontSize = 10;
hcb.Title.FontWeight = 'Bold';
x1=get(gca,'position');
x=get(hcb,'Position');
x(1) = 0.09+0.46;
x(2)=0.035;
x(3) = 0.37;
set(hcb,'Position',x)



%% output
print(gcf, '-dtiff', '-r300', '../../figures/figure_S1_r1.tif')

close all

%% relative difference
load('126_total_BC_all.mat');
load('126_total_SWE_all.mat');


hist_value =nanmean(total_BCs_all(:,:,1:20),3);
future_value =nanmean(total_BCs_all(:,:,(end-19):end),3);

hist_value(nanmean(total_SWEs_all,3)<=5) = nan;
future_value(nanmean(total_SWEs_all,3)<=5) = nan;

figure;
imagesc((future_value - hist_value)./hist_value)

load('126_total_BC_all.mat');
load('126_total_SWE_all.mat');


hist_value =nanmean(total_BCs_all(:,:,1:20),3);
future_value =nanmean(total_BCs_all(:,:,(end-19):end),3);

hist_value(nanmean(total_SWEs_all,3)<=5) = nan;
future_value(nanmean(total_SWEs_all,3)<=5) = nan;

figure;
imagesc((future_value - hist_value)./hist_value)