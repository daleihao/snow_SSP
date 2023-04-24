clear all;
close all;
clc;

%% get data
get_plotdata
% mean_BC_SC_hist(mean_SWE_hist<=5) = nan;
%mean_BC_SC_future_126(mean_SWE_future_126<=5) = nan;
%mean_BC_SC_future_585(mean_SWE_future_585<=5) = nan;

%% plot
res = 0.5;
lon_base = [0+res/2:res:360-res/2];
lat_base =  [90-res/2:-res:20+res/2];
[lons,lats] = meshgrid(double(lon_base),double(lat_base));

colors_1 = flipud(brewermap(11, 'Spectral'));
%colors_1 = crameri('batlow');
set(gcf,'unit','normalized','position',[0.1,0.05,0.6,0.72]);
set(gca, 'Position', [0 0 1 1])

ax1 = subplot('position', [0.06 + 0.31*(1-1) 0.56 0.3 0.36]);
colormap(colors_1)
plot_global_map(lats, lons, mean_BC_SC_hist, 0, 500,"Historical");
lab = ylabel('BC','fontweight','bold','fontsize',14);
x = lab.Position;
x(1) = x(1) + 0.25;
set(lab,'position',x)

text(-1.3,1.1,'a','fontweight','bold','fontsize',14)
hcb = colorbar;
hcb.Location = 'southoutside';
hcb.Title.String = '\mug m^{-2}';
hcb.Title.FontSize = 8;
hcb.Title.FontWeight = 'Bold';
x1=get(gca,'position');
x=get(hcb,'Position');
x(1) = 0.09;
x(2)=0.5;
x(3) = 0.24;
set(hcb,'Position',x)

ax2 = subplot('position', [0.06 + 0.31*(2-1) 0.56 0.3 0.36]);
colormap(colors_1)
plot_global_map(lats, lons,  mean_BC_SC_future_126, 0, 500,"SSP126");
text(-1.3,1.1,'b','fontweight','bold','fontsize',14)
hcb = colorbar;
hcb.Location = 'southoutside';
hcb.Title.String = '\mug m^{-2}';
hcb.Title.FontSize = 8;
hcb.Title.FontWeight = 'Bold';
x1=get(gca,'position');
x=get(hcb,'Position');
x(1) = 0.09+0.31;
x(2)=0.5;
x(3) = 0.24;
set(hcb,'Position',x)

ax3 = subplot('position', [0.06 + 0.31*(3-1) 0.56 0.3 0.36]);
colormap(colors_1)
plot_global_map(lats, lons, mean_BC_SC_future_585,0, 500,"SSP585");
text(-1.3,1.1,'c','fontweight','bold','fontsize',14)
hcb = colorbar;
hcb.Location = 'southoutside';
hcb.Title.String = '\mug m^{-2}';
hcb.Title.FontSize = 8;
hcb.Title.FontWeight = 'Bold';
x1=get(gca,'position');
x=get(hcb,'Position');
x(1) = 0.09+0.31*2;
x(2)=0.5;
x(3) = 0.24;
set(hcb,'Position',x)


%%SWE
ax5 = subplot('position', [0.06 + 0.31*(1-1) 0.10 0.3 0.36]);
colormap(colors_1)
plot_global_map(lats, lons, mean_dust_SC_hist, 0, 500,"");
lab = ylabel('Dust','fontweight','bold','fontsize',14);
x = lab.Position;
x(1) = x(1) + 0.25;
set(lab,'position',x)

text(-1.3,1.1,'d','fontweight','bold','fontsize',14)
hcb = colorbar;
hcb.Location = 'southoutside';
hcb.Title.String = 'mg m^{-2}';
hcb.Title.FontSize = 10;
hcb.Title.FontWeight = 'Bold';
x1=get(gca,'position');
x=get(hcb,'Position');
x(1) = 0.09;
x(2)=0.04;
x(3) = 0.24;
set(hcb,'Position',x)

ax6 = subplot('position', [0.06 + 0.31*(2-1) 0.10 0.3 0.36]);
colormap(colors_1)
plot_global_map(lats, lons, mean_dust_SC_future_126, 0, 500,"");
text(-1.3,1.1,'e','fontweight','bold','fontsize',14)
hcb = colorbar;
hcb.Location = 'southoutside';
hcb.Title.String = 'mg m^{-2}';
hcb.Title.FontSize = 10;
hcb.Title.FontWeight = 'Bold';
x1=get(gca,'position');
x=get(hcb,'Position');
x(1) = 0.09+0.31;
x(2)=0.04;
x(3) = 0.24;
set(hcb,'Position',x)

ax7 = subplot('position', [0.06 + 0.31*(3-1) 0.10 0.3 0.36]);
colormap(colors_1)
plot_global_map(lats, lons, mean_dust_SC_future_585, 0, 500,"");
text(-1.3,1.1,'f','fontweight','bold','fontsize',14)
hcb = colorbar;
hcb.Location = 'southoutside';
hcb.Title.String = 'mg m^{-2}';
hcb.Title.FontSize = 10;
hcb.Title.FontWeight = 'Bold';
x1=get(gca,'position');
x=get(hcb,'Position');
x(1) = 0.09+0.31*2;
x(2)=0.04;
x(3) = 0.24;
set(hcb,'Position',x)



%% output
print(gcf, '-dtiff', '-r300', '../../figures/figure_S2.tif')

close all
