clear all;
close all;
clc;

ModelNames = {'CESM2','CanESM5', 'GFDL-ESM4','INM-CM5-0','MIROC6','MRI-ESM2-0','NorESM2-LM'};
total_BCs_2015 = nan(288,192,7);
total_BCs_2100 = nan(288,192,7);
total_dusts_2015 = nan(288,192,7);
total_dusts_2100 = nan(288,192,7);

for model_i =1:7
    year_i = 2015;
    index_i = year_i - 2014;
    month_i_all = (index_i-1)*12 + [1 2 3 4 5 12];
    
    load(['585_aer_' ModelNames{model_i} '.mat']);
    total_BCs_2015(:,:,model_i) = nanmean(dry_BCs(:,:,month_i_all),3) + nanmean(wet_BCs(:,:,month_i_all),3);
    total_dusts_2015(:,:,model_i) = nanmean(dry_dusts(:,:,month_i_all),3) + nanmean(wet_dusts(:,:,month_i_all),3);
    
    year_i = 2100;
    index_i = year_i - 2014;
    month_i_all = (index_i-1)*12 + [1 2 3 4 5 12];
    total_BCs_2100(:,:,model_i) = nanmean(dry_BCs(:,:,month_i_all),3) + nanmean(wet_BCs(:,:,month_i_all),3);
    total_dusts_2100(:,:,model_i) = nanmean(dry_dusts(:,:,month_i_all),3) + nanmean(wet_dusts(:,:,month_i_all),3);
end



mean_BCs_2015 = nanmean(total_BCs_2015,3);
mean_BCs_2100 = nanmean(total_BCs_2100,3);
mean_dusts_2015 = nanmean(total_dusts_2015,3);
mean_dusts_2100 = nanmean(total_dusts_2100,3);

cv_BCs_2015 = nanstd(total_BCs_2015,[],3)./mean_BCs_2015;
cv_BCs_2100 = nanstd(total_BCs_2100,[],3)./mean_BCs_2100;
cv_dusts_2015 = nanstd(total_dusts_2015,[],3)./mean_dusts_2015;
cv_dusts_2100 = nanstd(total_dusts_2100,[],3)./mean_dusts_2100;


load('585_swe_CESM2.mat');
year_i = 2015;
index_i = year_i - 2014;
month_i_all = (index_i-1)*12 + [1 2 3 4 5 12];
mean_swes_2015 = nanmean(swes(:,:,month_i_all),3);

year_i = 2100;
index_i = year_i - 2014;
month_i_all = (index_i-1)*12 + [1 2 3 4 5 12];
mean_swes_2100 = nanmean(swes(:,:,month_i_all),3);

mean_BCs_2015(mean_swes_2015<=0.1 | isnan(mean_swes_2015)) = nan;
cv_BCs_2015(mean_swes_2015<=0.1 | isnan(mean_swes_2015)) = nan;
mean_dusts_2015(mean_swes_2015<=0.1 | isnan(mean_swes_2015)) = nan;
cv_dusts_2015(mean_swes_2015<=0.1 | isnan(mean_swes_2015)) = nan;

mean_BCs_2100(mean_swes_2100<=0.1 | isnan(mean_swes_2100)) = nan;
cv_BCs_2100(mean_swes_2100<=0.1 | isnan(mean_swes_2100)) = nan;
mean_dusts_2100(mean_swes_2100<=0.1 | isnan(mean_swes_2100)) = nan;
cv_dusts_2100(mean_swes_2100<=0.1 | isnan(mean_swes_2100)) = nan;

load('585_annual_trend.mat');
%% plot
[lons,lats] = meshgrid(double(lon_base),double(flipud(lat_base)));

colors_1 = flipud(brewermap(101, 'Spectral'));
set(gcf,'unit','normalized','position',[0.1,0.1,0.7,0.6]);
set(gca, 'Position', [0 0 1 1])

ax1 = subplot('position', [0.03 + 0.22*(1-1) 0.48 0.21 0.4]);
colormap(colors_1)
plot_global_map(lats, lons, mean_BCs_2015, 0,0.5,"2015");
colorbar('Location','southoutside')

ax2 = subplot('position', [0.03 + 0.22*(2-1) 0.48 0.21 0.4]);
colormap(colors_1)
plot_global_map(lats, lons, mean_BCs_2100, 0,0.5,"2100");
colorbar('Location','southoutside')

ax3 = subplot('position', [0.03 + 0.22*(3-1) 0.48 0.21 0.4]);
colormap(colors_1)
plot_global_map(lats, lons, mean_BCs_2100 - mean_BCs_2015,-0.1,0.1,"Difference");
colorbar('Location','southoutside')

ax4 = subplot('position', [0.03 + 0.22*(4-1) 0.55 0.25 0.3]);
hold on
plot([2015:2100],BCs_time_series(:,:,1)','r-')
plot([2015:2100],BCs_time_series(:,:,2)','b--')
xlim([2015 2100])
% subplot(2,3,4)
% colormap(colors_1)
% plot_global_map(lats, lons, cv_BCs_2015, 0,0.5,"2015 BC");
% colorbar
% subplot(2,3,5)
% colormap(colors_1)
% plot_global_map(lats, lons, cv_BCs_2100, 0,0.5,"2100 BC");
% colorbar
% subplot(2,3,6)
% colormap(colors_1)
% plot_global_map(lats, lons, cv_BCs_2100 - cv_BCs_2015,-0.2,0.2,"Trend Dust");
% colorbar


%%dust
ax5 = subplot('position', [0.03 + 0.22*(1-1) 0.05 0.21 0.4]);
colormap(colors_1)
plot_global_map(lats, lons, mean_dusts_2015, 0,0.5,"");
colorbar('Location','southoutside')
ax6 = subplot('position', [0.03 + 0.22*(2-1) 0.05 0.21 0.4]);
colormap(colors_1)
plot_global_map(lats, lons, mean_dusts_2100, 0,0.5,"");
colorbar('Location','southoutside')
ax7 = subplot('position', [0.03 + 0.22*(3-1) 0.05 0.21 0.4]);
colormap(colors_1)
plot_global_map(lats, lons, mean_dusts_2100 - mean_dusts_2015,-0.1,0.1,"");
colorbar('Location','southoutside')

ax8 = subplot('position', [0.03 + 0.22*(4-1) 0.1 0.25 0.3]);
hold on
plot([2015:2100],dusts_time_series(:,:,1)','r-')
plot([2015:2100],dusts_time_series(:,:,2)','b--')
xlim([2015 2100])

% subplot(2,3,10)
% colormap(colors_1)
% plot_global_map(lats, lons, cv_dusts_2015, 0,1,"2015 Dust");
% colorbar
% subplot(2,3,11)
% colormap(colors_1)
% plot_global_map(lats, lons, cv_dusts_2100, 0,1,"2100 Dust");
% colorbar
% subplot(2,3,12)
% colormap(colors_1)
% plot_global_map(lats, lons, cv_dusts_2100 - cv_dusts_2015,-0.2,0.2,"Trend Dust");
% colorbar
