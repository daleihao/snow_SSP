clear all;
close all;
clc;




%% get data
get_plotdata
%mean_SWE_hist = nanmean(mean_SWE_hist(:,:,46:end),3);
% mean_SWE_future_126 = nanmean(mean_SWE_2100_126(:,:,(end-20+1):end),3);
% mean_SWE_future_585 = nanmean(mean_SWE_2100_585(:,:,(end-20+1):end),3);
% mean_SWE_future_126_BD = nanmean(mean_SWE_2100_126_BD(:,:,(end-20+1):end),3);
% mean_SWE_future_585_BD = nanmean(mean_SWE_2100_585_BD(:,:,(end-20+1):end),3);
filters = mean_SWE_hist>5;
mean_SWE_hist(~filters) = nan;
mean_SWE_future_126(~filters) = nan;
mean_SWE_future_126_BD(~filters) = nan;
mean_ratio_126 = (mean_SWE_future_126 - mean_SWE_future_126_BD)./(mean_SWE_hist - mean_SWE_future_126_BD)*100;
mean_ratio_126 = abs(mean_ratio_126);

filters = mean_SWE_hist>5;
mean_SWE_future_585(~filters) = nan;
mean_SWE_future_585_BD(~filters) = nan;
mean_ratio_585 = (mean_SWE_future_585 - mean_SWE_future_585_BD)./(mean_SWE_hist - mean_SWE_future_585_BD)*100;
mean_ratio_585 = abs(mean_ratio_585);
%% plot
colors =  [0.45, 0.80, 0.69;...
    0.98, 0.40, 0.35;...
    0.55, 0.60, 0.79];

res = 0.5;
lon_base = [0+res/2:res:360-res/2];
lat_base =  [90-res/2:-res:20+res/2];
[lons,lats] = meshgrid(double(lon_base),double(lat_base));

colors_1 = flipud(brewermap(11, 'Spectral'));
colors_2 = flipud(brewermap(11, 'RdBu'));
colors_2(6,:) = [0.9 0.9 0.9];
%colors_1 = crameri('batlow');
figure;
set(gcf,'unit','normalized','position',[0.1,0.05,0.5,0.45]);
set(gca, 'Position', [0 0 1 1])

ax1 = subplot('position', [0.05 + 0.45*(1-1) 0.14 0.43 0.8]);
plot_global_map(lats, lons, mean_ratio_126, 0,60,"SSP126");

colormap(ax1, colors_1)

text(-1.3,1.4,'a','fontweight','bold','fontsize',14)
hcb = colorbar;
hcb.Location = 'southoutside';
hcb.Title.String = '%';
hcb.Title.FontSize = 8;
hcb.Title.FontWeight = 'Bold';
x1=get(gca,'position');
x=get(hcb,'Position');
x(1) = 0.06;
x(2)=0.06;
x(3) = 0.38;
x(4) = 0.04;

set(hcb,'Position',x)

ax2 = subplot('position', [0.06 + 0.45*(2-1) 0.14 0.43 0.8]);
plot_global_map(lats, lons,  mean_ratio_585, 0,60,"SSP585");
text(-1.3,1.4,'b','fontweight','bold','fontsize',14)
hcb = colorbar;
hcb.Location = 'southoutside';
hcb.Title.String = '%';
hcb.Title.FontSize = 8;
hcb.Title.FontWeight = 'Bold';
x1=get(gca,'position');
x=get(hcb,'Position');
x(1) = 0.08+0.45;
x(2)=0.06;
x(3) = 0.38;
x(4) = 0.04;
set(hcb,'Position',x)
colormap(ax2, colors_1)



%% output
print(gcf, '-dtiff', '-r300', '../../figures/figure_S6.tif')

close all
