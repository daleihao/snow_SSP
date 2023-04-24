clear all;
close all;
clc;

%% get data
get_plotdata
% mean_BC_SAR_hist(mean_SWE_hist<=5) = nan;
%mean_BC_SAR_future_126(mean_SWE_future_126<=5) = nan;
%mean_BC_SAR_future_585(mean_SWE_future_585<=5) = nan;

%% plot
ratio_dust = mean_dust_SAR_hist./mean_AER_SAR_hist*100;
ratio_dust = flipud(ratio_dust');
res = 0.5;
lon_base = [0+res/2:res:360-res/2];
lat_base =  [90-res/2:-res:20+res/2];
[lons,lats] = meshgrid(double(lon_base),double(lat_base));

colors_1 = flipud(brewermap(21, 'Spectral'));
%colors_1 = crameri('batlow');
%% plot
res = 0.5;
lon_base = [0+res/2:res:360-res/2];
lat_base =  [90-res/2:-res:20+res/2];
[lons,lats] = meshgrid(double(lon_base),double(lat_base));

figure;
colors_1 = flipud(brewermap(21, 'Spectral'));
%colors_1 = crameri('batlow');
set(gcf,'unit','normalized','position',[0.1,0.05,0.42,0.5]);
set(gca, 'Position', [0.03 0.1 0.85 0.85])

colormap(colors_1)
plot_global_map_relative(lats, lons, ratio_dust, 0, 100,"");

hcb = colorbar;
hcb.Location = 'eastoutside';
hcb.Title.String = '%';
hcb.Title.FontSize = 10;
hcb.Title.FontWeight = 'Bold';
x1=get(gca,'position');
x=get(hcb,'Position');
 x(1) = 0.88;
% x(2)=0.035;
% x(3) = 0.37;
set(hcb,'Position',x)

set(gca,'fontsize',15)



%% output
print(gcf, '-dtiff', '-r300', '../../figures/figure_S3_albedo_change.tif')

close all
