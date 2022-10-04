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
set(gcf,'unit','normalized','position',[0.1,0.05,0.6,0.9]);
set(gca, 'Position', [0 0 1 1])

ax1 = subplot('position', [0.05 + 0.295*(1-1) 0.64 0.28 0.34]);
plot_global_map(lats, lons, mean_SWE_hist, 0,400,"Historical");
lab = ylabel('April SWE','fontweight','bold','fontsize',14);
x = lab.Position;
x(1) = x(1) + 0.15;
set(lab,'position',x)
colormap(ax1, colors_1)

text(-1.3,1.1,'a','fontweight','bold','fontsize',14)
% hcb = colorbar;
% hcb.Location = 'southoutside';
% %hcb.Title.String = 'W m^{-2}';
% hcb.Title.FontSize = 8;
% hcb.Title.FontWeight = 'Bold';
% x1=get(gca,'position');
% x=get(hcb,'Position');
% % x(1) = 0.06;
% x(2)=0.66;
% % x(3) = 0.24;
% set(hcb,'Position',x)

ax2 = subplot('position', [0.05 + 0.295*(2-1) 0.64 0.28 0.32]);
plot_global_map(lats, lons, mean_SWE_future_126, 0,400,"SSP126");
% lab = ylabel('SSP126','fontweight','bold','fontsize',14);
% x = lab.Position;
%x(1) = x(1) + 0.25;
% set(lab,'position',x)
colormap(ax2, colors_1)

text(-1.3,1.1,'b','fontweight','bold','fontsize',14)
% hcb = colorbar;
% hcb.Location = 'southoutside';
% %hcb.Title.String = 'W m^{-2}';
% hcb.Title.FontSize = 8;
% hcb.Title.FontWeight = 'Bold';
% x1=get(gca,'position');
% x=get(hcb,'Position');
% % x(1) = 0.06;
% x(2)=0.66;
% % x(3) = 0.24;
% set(hcb,'Position',x)

%%SWE
ax3 = subplot('position', [0.05 + 0.295*(3-1) 0.64 0.28 0.32]);
plot_global_map(lats, lons, mean_SWE_future_585, 0,400,"SSP585");
% lab = ylabel('SSP585','fontweight','bold','fontsize',14);
% x = lab.Position;
% x(1) = x(1) + 0.25;
% set(lab,'position',x)
colormap(ax3, colors_1)

text(-1.3,1.1,'c','fontweight','bold','fontsize',14)
hcb = colorbar;
%hcb.Location = 'southoutside';
hcb.Title.String = 'mm';
hcb.Title.FontSize = 10;
hcb.Title.FontWeight = 'Bold';
x1=get(gca,'position');
x=get(hcb,'Position');
x(1) = 0.94;
x(2) = x(2) - 0.02;
x(4) = 0.26;%x(2)=0.66;
%x(3) = 0.21;
set(hcb,'Position',x)



ax4 = subplot('position', [0.06 + 0.295*(2-1) 0.32 0.28 0.32]);
plot_global_map(lats, lons,  mean_SWE_future_126-mean_SWE_future_126_BD, -20,20,"");
lab = ylabel('\DeltaSWE_{LAP}','fontweight','bold','fontsize',14);
x = lab.Position;
x(1) = x(1) + 0.1;
set(lab,'position',x)
text(-1.3,1.1,'d','fontweight','bold','fontsize',14)
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


ax5 = subplot('position', [0.06 + 0.295*(3-1) 0.32 0.28 0.32]);
plot_global_map(lats, lons, mean_SWE_future_585 - mean_SWE_future_585_BD, -20,20,"");
text(-1.3,1.1,'e','fontweight','bold','fontsize',14)
hcb = colorbar;
%hcb.Location = 'southoutside';
hcb.Title.String = 'mm';
hcb.Title.FontSize = 10;
hcb.Title.FontWeight = 'Bold';

x1=get(gca,'position');
x=get(hcb,'Position');

x(1) = 0.94;
x(2) = x(2) - 0.02;
x(4) = 0.26;
set(hcb,'Position',x)
colormap(ax5, colors_2)

ax6 = subplot('position', [0.08 + 0.4*(1-1) 0.05 0.42 0.24]);
%plot_global_map(lats, lons, (mean_SWE_future_126-mean_SWE_future_126_BD)./mean_SWE_future_126*100,-20, 20,"Relative \DeltaSWE");
text(2010,37,'f','fontweight','bold','fontsize',14)
%colormap(ax3,colors_2)

hold on
t1 = plot(1950:2100,mean_ratio_SWE_126 ,'r','linewidth',2,'color',colors(1,:))
% patch([[1950:2100]'; flipud([1950:2100]')],[mean_ratio_SWE_126-std_ratio_SWE_126; flipud(mean_ratio_SWE_126+std_ratio_SWE_126)],colors(1,:),'LineStyle','none');
% alpha(0.3)
t2 = plot(1950:2100,mean_ratio_SWE_126_Dust ,'r','linewidth',2,'color',colors(2,:))
t3 = plot(1950:2100,mean_ratio_SWE_126_BC ,'r','linewidth',2,'color',colors(3,:))

Years = [2015:2100]';
[taub tau h sig Z S sigma sen n senplot CIlower CIupper D Dall C3 nsigma] = ktaub([Years mean_ratio_SWE_585(66:end)'], 0.05, 0);
 sen*10
 sig
 Years = [2015:2100]';
[taub tau h sig Z S sigma sen n senplot CIlower CIupper D Dall C3 nsigma] = ktaub([Years mean_ratio_SWE_585_Dust(66:end)'], 0.05, 0);
 sen*10
 sig
Years = [2015:2100]';
[taub tau h sig Z S sigma sen n senplot CIlower CIupper D Dall C3 nsigma] = ktaub([Years mean_ratio_SWE_585_BC(66:end)'], 0.05, 0);
 sen*10

sig
plot([1950 2100], [0 0],'k--','linewidth',1)
ylabel('Relative \DeltaSWE_{LAP} (%)')
set(gca,'linewidth',1,'fontsize',12)
box on
xlim([2015 2100])
ylim([-5 35])
legend('BC_{future}+Dust_{future}','BC_{future}+Dust_{hist}','BC_{hist}+Dust_{future}','Location','NorthWest')
title('SSP126')
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




ax7 = subplot('position', [0.075 + 0.48*(2-1) 0.05 0.42 0.24]);
%plot_global_map(lats, lons, (mean_SWE_future_585 - mean_SWE_future_585_BD)./mean_SWE_future_585*100, -20,20,"");
text(2010,37,'g','fontweight','bold','fontsize',14)
% hcb = colorbar;
% hcb.Location = 'southoutside';
% hcb.Title.String = '%';
% hcb.Title.FontSize = 10;
% hcb.Title.FontWeight = 'Bold';
% x1=get(gca,'position');
% x=get(hcb,'Position');
% x(1) = 0.08+0.32*2;
% x(2)=0.05;
% x(3) = 0.24;
% set(hcb,'Position',x)
% colormap(ax7, colors_2)
title('SSP585')

hold on
t1 = plot(1950:2100,mean_ratio_SWE_585 ,'r','linewidth',2,'color',colors(1,:))
% patch([[1950:2100]'; flipud([1950:2100]')],[mean_ratio_SWE_585-std_ratio_SWE_585; flipud(mean_ratio_SWE_585+std_ratio_SWE_585)],colors(1,:),'LineStyle','none');
% alpha(0.3)
t2 = plot(1950:2100,mean_ratio_SWE_585_Dust ,'r','linewidth',2,'color',colors(2,:))
t3 = plot(1950:2100,mean_ratio_SWE_585_BC ,'r','linewidth',2,'color',colors(3,:))


Years = [2015:2100]';
[taub tau h sig Z S sigma sen n senplot CIlower CIupper D Dall C3 nsigma] = ktaub([Years mean_ratio_SWE_585(66:end)'], 0.05, 0);
 sen*10
 sig
 Years = [2015:2100]';
[taub tau h sig Z S sigma sen n senplot CIlower CIupper D Dall C3 nsigma] = ktaub([Years mean_ratio_SWE_585_Dust(66:end)'], 0.05, 0);
 sen*10
 sig
Years = [2015:2100]';
[taub tau h sig Z S sigma sen n senplot CIlower CIupper D Dall C3 nsigma] = ktaub([Years mean_ratio_SWE_585_BC(66:end)'], 0.05, 0);
 sen*10
sig
plot([1950 2100], [0 0],'k--','linewidth',1)
%ylabel('Relative \DeltaSWE (%)')
set(gca,'linewidth',1,'fontsize',12)
box on
xlim([2015 2100])
ylim([-5 35])


%% output
print(gcf, '-dtiff', '-r300', '../figures/figure_4.tif')

close all
