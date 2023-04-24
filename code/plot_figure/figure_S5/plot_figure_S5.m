clear all;
close all;
clc;

clear all;
close all;
clc;

get_ELM_Data_with_April
% mean_TPs_SWE_SSP126 = [];
% mean_TPs_SWE_BD_SSP126 = [];
% mean_TPs_SWE_BC_SSP126 = [];
% mean_TPs_SWE_Dust_SSP126 = [];
% 
% mean_TPs_SWE_SSP585 = [];
% mean_TPs_SWE_BD_SSP585 = [];
% mean_TPs_SWE_BC_SSP585 = [];
% mean_TPs_SWE_Dust_SSP585 = []; 

mean_ratio_SWE_126 = (mean_TPs_SWE_SSP126 - mean_TPs_SWE_BD_SSP126)./mean_TPs_SWE_BD_SSP126 * 100;
mean_ratio_SWE_126_BC = (mean_TPs_SWE_BC_SSP126 - mean_TPs_SWE_BD_SSP126)./mean_TPs_SWE_BD_SSP126 * 100;
mean_ratio_SWE_126_Dust = (mean_TPs_SWE_Dust_SSP126 - mean_TPs_SWE_BD_SSP126)./mean_TPs_SWE_BD_SSP126 * 100;

mean_ratio_SWE_585 = (mean_TPs_SWE_SSP585 - mean_TPs_SWE_BD_SSP585)./mean_TPs_SWE_BD_SSP585 * 100;
mean_ratio_SWE_585_BC = (mean_TPs_SWE_BC_SSP585 - mean_TPs_SWE_BD_SSP585)./mean_TPs_SWE_BD_SSP585 * 100;
mean_ratio_SWE_585_Dust = (mean_TPs_SWE_Dust_SSP585 - mean_TPs_SWE_BD_SSP585)./mean_TPs_SWE_BD_SSP585 * 100;



% %% get mean
% means_SSP126_SWE = nanmean(mean_SSP126_SWE,2);
% stds_SSP126_SWE = nanstd(mean_SSP126_SWE,1,2);
% 
% 
% means_SSP126_BD_SWE = nanmean(mean_SSP126_BD_SWE,2);
% stds_SSP126_BD_SWE = nanstd(mean_SSP126_BD_SWE,1,2);
% 
% means_SSP585_SWE = nanmean(mean_SSP585_SWE,2);
% stds_SSP585_SWE = nanstd(mean_SSP585_SWE,1,2);
% 
% means_SSP585_BD_SWE = nanmean(mean_SSP585_BD_SWE,2);
% stds_SSP585_BD_SWE = nanstd(mean_SSP585_BD_SWE,1,2);
% 
% ratio_SWE_126 = (mean_SSP126_SWE - mean_SSP126_BD_SWE)./mean_SSP126_SWE*100;
% ratio_SWE_585 = (mean_SSP585_SWE - mean_SSP585_BD_SWE)./mean_SSP585_SWE*100;
% 
% mean_ratio_SWE_126 = nanmean(ratio_SWE_126,2);
% std_ratio_SWE_126 = nanstd(ratio_SWE_126,1,2);
% mean_ratio_SWE_585 = nanmean(ratio_SWE_585,2);
% std_ratio_SWE_585 = nanstd(ratio_SWE_585,1,2);

%% get data
get_plotdata
% mean_SWE_hist = nanmean(mean_SWE_hist(:,:,46:end),3);
% mean_SWE_future_126 = nanmean(mean_SWE_2100_126(:,:,(end-20+1):end),3);
% mean_SWE_future_585 = nanmean(mean_SWE_2100_585(:,:,(end-20+1):end),3);
% mean_SWE_future_126_BD = nanmean(mean_SWE_2100_126_BD(:,:,(end-20+1):end),3);
% mean_SWE_future_585_BD = nanmean(mean_SWE_2100_585_BD(:,:,(end-20+1):end),3);
filters = mean_SWE_hist>5;
mean_SWE_future_126(~filters) = nan;
mean_SWE_future_126_BD(~filters) = nan;

filters =  mean_SWE_hist>5;
mean_SWE_future_585(~filters) = nan;
mean_SWE_future_585_BD(~filters) = nan;
mean_SWE_hist(~filters) = nan;
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
set(gcf,'unit','normalized','position',[0.1,0.05,0.6,0.5]);
set(gca, 'Position', [0 0 1 1])


ax4 = subplot('position', [0.03 + 0.46*(1-1) 0.05 0.43 0.9]);
plot_global_map(lats, lons,  mean_SWE_future_126-mean_SWE_hist, -50,50,"SSP126 - Historical");
text(-1.3,1.1,'a','fontweight','bold','fontsize',14)
% hcb = colorbar;
% hcb.Location = 'southoutside';
% %hcb.Title.String = 'mm';
% hcb.Title.FontSize = 10;
% hcb.Title.FontWeight = 'Bold';
% x1=get(gca,'position');
% x=get(hcb,'Position');
% % x(1) = 0.08+0.25;
% x(2)=0.32;
% % x(3) = 0.21;
% set(hcb,'Position',x)
colormap(ax4, colors_2)


ax5 = subplot('position', [0.04 + 0.43*(2-1) 0.05 0.43 0.9]);
plot_global_map(lats, lons, mean_SWE_future_585 - mean_SWE_hist, -50,50,"SSP585 - Historical");
text(-1.3,1.1,'b','fontweight','bold','fontsize',14)
hcb = colorbar;
%hcb.Location = 'southoutside';
hcb.Title.String = 'mm';
hcb.Title.FontSize = 10;
hcb.Title.FontWeight = 'Bold';

x1=get(gca,'position');
x=get(hcb,'Position');

x(1) = 0.92;
x(2) = x(2) - 0.03;
x(4) = 0.75;
set(hcb,'Position',x)
colormap(ax5, colors_2)



%% output
print(gcf, '-dtiff', '-r300', '../../figures/figure_S5.tif')

close all
