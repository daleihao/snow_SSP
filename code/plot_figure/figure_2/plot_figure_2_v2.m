clear all;
close all;
clc;

%% get data
get_plotdata
% mean_BC_RF_hist(mean_SWE_hist<=5) = nan;
%mean_BC_RF_future_126(mean_SWE_future_126<=5) = nan;
%mean_BC_RF_future_585(mean_SWE_future_585<=5) = nan;

%% calculate average value
res = 0.5;
lon_base = [0+res/2:res:360-res/2];
lat_base =  [90-res/2:-res:20+res/2];
[lons,lats] = meshgrid(double(lon_base),double(lat_base));
% radius = 6378137;
% res_lat = 0.5;
% res_lon = 0.5;
% height = radius * res_lat*pi/180;
% width2 = radius*(cos((lats-res_lat/2)*pi/180)+cos((lats+res_lat/2)*pi/180))/2 * res_lon*pi/180;
% Areas = width2.*height/1e6;
% 
% tmp = flipud(mean_BC_RF_hist');
% filters = lats> 59 & lats <=90 & lons > (360-63) & lons < (360-11);
% tmp(filters) = nan;
% Areas(isnan(tmp)) = nan;
% mean_value = nansum(tmp(:).*Areas(:))./nansum(Areas(:));
% disp(mean_value);
mean_values = nan(3,3);
mean_values(1,1) = cal_mean_value(mean_BC_RF_hist);
mean_values(1,2) = cal_mean_value(mean_BC_RF_future_126);
mean_values(1,3) = cal_mean_value(mean_BC_RF_future_585);
mean_values(2,1) = cal_mean_value(mean_dust_RF_hist);
mean_values(2,2) = cal_mean_value(mean_dust_RF_future_126);
mean_values(2,3) = cal_mean_value(mean_dust_RF_future_585);
mean_values(3,1) = cal_mean_value(mean_AER_RF_hist);
mean_values(3,2) = cal_mean_value(mean_AER_RF_future_126);
mean_values(3,3) = cal_mean_value(mean_AER_RF_future_585);

%% plot
res = 0.5;
lon_base = [0+res/2:res:360-res/2];
lat_base =  [90-res/2:-res:20+res/2];
[lons,lats] = meshgrid(double(lon_base),double(lat_base));

colors_1 = flipud(brewermap(11, 'Spectral'));
colors_2 = flipud(brewermap(11, 'RdBu'));
colors_2(6,:) = [0.9 0.9 0.9];
%colors_1 = crameri('batlow');
set(gcf,'unit','normalized','position',[0.1,0.05,0.56,1]);
set(gca, 'Position', [0 0 1 1])

ax1 = subplot('position', [0.06 + 0.31*(1-1) 0.66 0.3 0.28]);
plot_global_map(lats, lons, mean_BC_RF_hist, 0, 10,"Historical");
lab = ylabel('BC','fontweight','bold','fontsize',14);
x = lab.Position;
x(1) = x(1) + 0.25;
set(lab,'position',x)
colormap(ax1, colors_1) 

text(-1.3,1.1,'a','fontweight','bold','fontsize',14)
% hcb = colorbar;
% hcb.Location = 'southoutside';
% hcb.Title.String = 'W m^{-2}';
% hcb.Title.FontSize = 8;
% hcb.Title.FontWeight = 'Bold';
% x1=get(gca,'position');
% x=get(hcb,'Position');
% x(1) = 0.06;
% x(2)=0.55;
% x(3) = 0.24;
% set(hcb,'Position',x)

ax2 = subplot('position', [0.06 + 0.31*(2-1) 0.66 0.3 0.28]);
plot_global_map(lats, lons,  mean_BC_RF_future_126 - mean_BC_RF_hist, -5, 5,{"SSP126","Future - Historical"});
text(-1.3,1.1,'b','fontweight','bold','fontsize',14)
colormap(ax2, colors_2) 

% hcb = colorbar;
% hcb.Location = 'southoutside';
% hcb.Title.String = 'W m^{-2}';
% hcb.Title.FontSize = 8;
% hcb.Title.FontWeight = 'Bold';
% x1=get(gca,'position');
% x=get(hcb,'Position');
% x(1) = 0.06+0.32;
% x(2)=0.55;
% x(3) = 0.24;
% set(hcb,'Position',x)

ax3 = subplot('position', [0.06 + 0.31*(3-1) 0.66 0.3 0.28]);
plot_global_map(lats, lons, mean_BC_RF_future_585 - mean_BC_RF_hist,-5, 5,{"SSP585","Future - Historical"});
text(-1.3,1.1,'c','fontweight','bold','fontsize',14)
colormap(ax3, colors_2) 

% hcb = colorbar;
% hcb.Location = 'southoutside';
% hcb.Title.String = 'W m^{-2}';
% hcb.Title.FontSize = 8;
% hcb.Title.FontWeight = 'Bold';
% x1=get(gca,'position');
% x=get(hcb,'Position');
% x(1) = 0.06+0.32*2;
% x(2)=0.55;
% x(3) = 0.24;
% set(hcb,'Position',x)


%%SWE
ax5 = subplot('position', [0.06 + 0.31*(1-1) 0.37 0.3 0.28]);
plot_global_map(lats, lons, mean_dust_RF_hist, 0, 10,"");
lab = ylabel('Dust','fontweight','bold','fontsize',14);
x = lab.Position;
x(1) = x(1) + 0.25;
set(lab,'position',x)

text(-1.3,1.1,'d','fontweight','bold','fontsize',14)
colormap(ax5, colors_1) 

% hcb = colorbar;
% hcb.Location = 'southoutside';
% hcb.Title.String = 'W m^{-2}';
% hcb.Title.FontSize = 10;
% hcb.Title.FontWeight = 'Bold';
% x1=get(gca,'position');
% x=get(hcb,'Position');
% x(1) = 0.08;
% x(2)=0.05;
% x(3) = 0.24;
% set(hcb,'Position',x)

ax6 = subplot('position', [0.06 + 0.31*(2-1) 0.37 0.3 0.28]);
plot_global_map(lats, lons, mean_dust_RF_future_126 - mean_dust_RF_hist, -5, 5,"");
text(-1.3,1.1,'e','fontweight','bold','fontsize',14)
colormap(ax6, colors_2) 

% hcb = colorbar;
% hcb.Location = 'southoutside';
% hcb.Title.String = 'W m^{-2}';
% hcb.Title.FontSize = 10;
% hcb.Title.FontWeight = 'Bold';
% x1=get(gca,'position');
% x=get(hcb,'Position');
% x(1) = 0.08+0.32;
% x(2)=0.05;
% x(3) = 0.24;
% set(hcb,'Position',x)

ax7 = subplot('position', [0.06 + 0.31*(3-1) 0.37 0.3 0.28]);

plot_global_map(lats, lons, mean_dust_RF_future_585 - mean_dust_RF_hist, -5, 5,"");
text(-1.3,1.1,'f','fontweight','bold','fontsize',14)
colormap(ax7, colors_2) 

% hcb = colorbar;
% hcb.Location = 'southoutside';
% hcb.Title.String = 'W m^{-2}';
% hcb.Title.FontSize = 10;
% hcb.Title.FontWeight = 'Bold';
% x1=get(gca,'position');
% x=get(hcb,'Position');
% x(1) = 0.08+0.32*2;
% x(2)=0.05;
% x(3) = 0.24;
% set(hcb,'Position',x)




%%AER
ax8 = subplot('position', [0.06 + 0.31*(1-1) 0.08 0.3 0.28]);

plot_global_map(lats, lons, mean_AER_RF_hist, 0, 10,"");
lab = ylabel('LAP','fontweight','bold','fontsize',14);
x = lab.Position;
x(1) = x(1) + 0.25;
set(lab,'position',x)

text(-1.3,1.1,'g','fontweight','bold','fontsize',14)
hcb = colorbar;
hcb.Location = 'southoutside';
hcb.Title.String = 'W m^{-2}';
hcb.Title.FontSize = 10;
hcb.Title.FontWeight = 'Bold';
x1=get(gca,'position');
x=get(hcb,'Position');
x(1) = 0.09;
x(2)=0.03;
x(3) = 0.24;
set(hcb,'Position',x)
colormap(ax8, colors_1) 

ax9 = subplot('position', [0.06 + 0.31*(2-1) 0.08 0.3 0.28]);

plot_global_map(lats, lons, mean_AER_RF_future_126 - mean_AER_RF_hist, -5, 5,"");
text(-1.3,1.1,'h','fontweight','bold','fontsize',14)
hcb = colorbar;
hcb.Location = 'southoutside';
hcb.Title.String = 'W m^{-2}';
hcb.Title.FontSize = 10;
hcb.Title.FontWeight = 'Bold';
x1=get(gca,'position');
x=get(hcb,'Position');
x(1) = 0.09+0.31;
x(2)=0.03;
x(3) = 0.24;
set(hcb,'Position',x)
colormap(ax9, colors_2) 

ax10 = subplot('position', [0.06 + 0.31*(3-1) 0.08 0.3 0.28]);

plot_global_map(lats, lons, mean_AER_RF_future_585 - mean_AER_RF_hist, -5, 5,"");
text(-1.3,1.1,'i','fontweight','bold','fontsize',14)
hcb = colorbar;
hcb.Location = 'southoutside';
hcb.Title.String = 'W m^{-2}';
hcb.Title.FontSize = 10;
hcb.Title.FontWeight = 'Bold';
x1=get(gca,'position');
x=get(hcb,'Position');
x(1) = 0.09+0.31*2;
x(2)=0.03;
x(3) = 0.24;
set(hcb,'Position',x)
colormap(ax10, colors_2) 

%% output
print(gcf, '-dtiff', '-r300', '../figures/figure_2_v2.tif')

close all
