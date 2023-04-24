clear all;
close all;
clc;

ModelNames = {'CESM2','CanESM5', 'GFDL-ESM4','INM-CM5-0','MIROC6','MRI-ESM2-0','NorESM2-LM'};
total_BCs_1995 = nan(288,192,7);
total_BCs_2100 = nan(288,192,7);
total_dusts_1995 = nan(288,192,7);
total_dusts_2100 = nan(288,192,7);

for model_i =1:7
    
    month_i_all = [];
    for year_i = 1995:2014
        index_i = year_i - 1949;
        month_i_all = [month_i_all (index_i-1)*12 + [1 2 3 4 5 12]];
    end
    
    load(['hist_aer_' ModelNames{model_i} '.mat']);
    total_BCs_1995(:,:,model_i) = nanmean(dry_BCs(:,:,month_i_all),3) + nanmean(wet_BCs(:,:,month_i_all),3);
    total_dusts_1995(:,:,model_i) = nanmean(dry_dusts(:,:,month_i_all),3) + nanmean(wet_dusts(:,:,month_i_all),3);
    
    
    month_i_all = [];
    for year_i = 2081:2100
        index_i = year_i - 2014;
        month_i_all = [month_i_all (index_i-1)*12 + [1 2 3 4 5 12]];
    end
    load(['aer_' ModelNames{model_i} '.mat']);
    total_BCs_2100(:,:,model_i) = nanmean(dry_BCs(:,:,month_i_all),3) + nanmean(wet_BCs(:,:,month_i_all),3);
    total_dusts_2100(:,:,model_i) = nanmean(dry_dusts(:,:,month_i_all),3) + nanmean(wet_dusts(:,:,month_i_all),3);
end


total_BCs_1995 = total_BCs_1995*10;
total_BCs_2100 = total_BCs_2100*10;
total_dusts_1995 = total_dusts_1995*10;
total_dusts_2100 = total_dusts_2100*10;

mean_BCs_1995 = nanmean(total_BCs_1995,3);
mean_BCs_2100 = nanmean(total_BCs_2100,3);
mean_dusts_1995 = nanmean(total_dusts_1995,3);
mean_dusts_2100 = nanmean(total_dusts_2100,3);

cv_BCs_1995 = nanstd(total_BCs_1995,[],3)./mean_BCs_1995;
cv_BCs_2100 = nanstd(total_BCs_2100,[],3)./mean_BCs_2100;
cv_dusts_1995 = nanstd(total_dusts_1995,[],3)./mean_dusts_1995;
cv_dusts_2100 = nanstd(total_dusts_2100,[],3)./mean_dusts_2100;


load('swe_CESM2.mat');
year_i = 2015;
index_i = year_i - 2014;
month_i_all = (index_i-1)*12 + [1 2 3 4 5 12];
mean_swes_1995 = nanmean(swes(:,:,month_i_all),3);

mean_swes_2100 = mean_swes_1995;

mean_BCs_1995(mean_swes_1995<=0.1 | isnan(mean_swes_1995)) = nan;
cv_BCs_1995(mean_swes_1995<=0.1 | isnan(mean_swes_1995)) = nan;
mean_dusts_1995(mean_swes_1995<=0.1 | isnan(mean_swes_1995)) = nan;
cv_dusts_1995(mean_swes_1995<=0.1 | isnan(mean_swes_1995)) = nan;

mean_BCs_2100(mean_swes_2100<=0.1 | isnan(mean_swes_2100)) = nan;
cv_BCs_2100(mean_swes_2100<=0.1 | isnan(mean_swes_2100)) = nan;
mean_dusts_2100(mean_swes_2100<=0.1 | isnan(mean_swes_2100)) = nan;
cv_dusts_2100(mean_swes_2100<=0.1 | isnan(mean_swes_2100)) = nan;

load('126_annual_trend_all.mat');
%% plot
[lons,lats] = meshgrid(double(lon_base),double(flipud(lat_base)));

colors_1 = flipud(brewermap(101, 'Spectral'));
%colors_1 = crameri('batlow');
set(gcf,'unit','normalized','position',[0.1,0.05,0.6,0.92]);
set(gca, 'Position', [0 0 1 1])

ax1 = subplot('position', [0.03 + 0.20*(1-1) 0.76 0.21 0.2]);
colormap(colors_1)
plot_global_map(lats, lons, mean_BCs_1995, 0,5,"1995~2020");
lab = ylabel('SSP126','fontweight','bold','fontsize',10);
x = lab.Position;
x(1) = x(1) + 0.25;
set(lab,'position',x)
text(-1.3,1.1,'a','fontweight','bold','fontsize',12)

ax2 = subplot('position', [0.03 + 0.21*(2-1) 0.76 0.21 0.2]);
colormap(colors_1)
plot_global_map(lats, lons, mean_BCs_2100, 0,5,"2095~2100");
text(-1.3,1.1,'b','fontweight','bold','fontsize',12)

ax3 = subplot('position', [0.03 + 0.21*(3-1) 0.76 0.21 0.2]);
colormap(colors_1)
plot_global_map(lats, lons, mean_BCs_2100 - mean_BCs_1995,-1,1,"Difference");
text(-1.3,1.1,'c','fontweight','bold','fontsize',12)

colors =  [0.45, 0.80, 0.69;...
    0.98, 0.40, 0.35;...
    0.55, 0.60, 0.79];

ax4 = subplot('position', [0.03 + 0.21*(4-1)+ 0.04  0.76 0.27 0.19]);
mean_BC_time_series = mean(squeeze(BCs_time_series_all(:,(1995-1950+1):end,1)'),2);
min_BC_time_series = min(squeeze(BCs_time_series_all(:,(1995-1950+1):end,1)'),[],2);
max_BC_time_series = max(squeeze(BCs_time_series_all(:,(1995-1950+1):end,1)'),[],2);

hold on
patch([[1995:2100]'; flipud([1995:2100]')],[min_BC_time_series; flipud(max_BC_time_series)],colors(1,:),'LineStyle','none');
alpha(0.3)
dry_BC = plot([1995:2100],mean_BC_time_series,'r-','linewidth',2,'color',colors(1,:))

mean_BC_time_series = mean(squeeze(BCs_time_series_all(:,(1995-1950+1):end,2)'),2);
min_BC_time_series = min(squeeze(BCs_time_series_all(:,(1995-1950+1):end,2)'),[],2);
max_BC_time_series = max(squeeze(BCs_time_series_all(:,(1995-1950+1):end,2)'),[],2);
patch([[1995:2100]'; flipud([1995:2100]')],[min_BC_time_series; flipud(max_BC_time_series)],colors(2,:),'LineStyle','none');
alpha(0.3)
wet_BC = plot([1995:2100],mean_BC_time_series,'-','linewidth',2,'color',colors(2,:));
plot([1995:2100],BCs_time_series_all(1,(1995-1950+1):end,1),'-','linewidth',2,'color','k');
plot([1995:2100],BCs_time_series_all(1,(1995-1950+1):end,2),'--','linewidth',2,'color','k');

legend([dry_BC, wet_BC],{'Dry BC','Wet BC'},'NumColumns',2);
xlim([1995 2100])
ylim([0 0.6])
box on
xlim([1995 2100])
ylabel('ng m^{-2} s^{-1}')
text(2000,0.58,'d','fontweight','bold','fontsize',12)





%%dust
ax5 = subplot('position', [0.03 + 0.21*(1-1) 0.28 0.21 0.2]);
colormap(colors_1)
plot_global_map(lats, lons, mean_dusts_1995, 0,5,"");
lab = ylabel('SSP126','fontweight','bold','fontsize',10);
x = lab.Position;
x(1) = x(1) + 0.25;
set(lab,'position',x)
text(-1.3,1.1,'i','fontweight','bold','fontsize',12)

ax6 = subplot('position', [0.03 + 0.21*(2-1) 0.28 0.21 0.2]);
colormap(colors_1)
plot_global_map(lats, lons, mean_dusts_2100, 0,5,"");
text(-1.3,1.1,'j','fontweight','bold','fontsize',12)

ax7 = subplot('position', [0.03 + 0.21*(3-1) 0.28 0.21 0.2]);
colormap(colors_1)
plot_global_map(lats, lons, mean_dusts_2100 - mean_dusts_1995,-1,1,"");
text(-1.3,1.1,'k','fontweight','bold','fontsize',12)

ax8 = subplot('position', [0.03 + 0.21*(4-1)+ 0.04  0.28 0.27 0.19]);
mean_dust_time_series = mean(squeeze(dusts_time_series_all(:,(1995-1950+1):end,1)'),2);
min_dust_time_series = min(squeeze(dusts_time_series_all(:,(1995-1950+1):end,1)'),[],2);
max_dust_time_series = max(squeeze(dusts_time_series_all(:,(1995-1950+1):end,1)'),[],2);

hold on
patch([[1995:2100]'; flipud([1995:2100]')],[min_dust_time_series; flipud(max_dust_time_series)],colors(1,:),'LineStyle','none');
alpha(0.3)
dry_dust = plot([1995:2100],mean_dust_time_series,'r-','linewidth',2,'color',colors(1,:))

mean_dust_time_series = mean(squeeze(dusts_time_series_all(:,(1995-1950+1):end,2)'),2);
min_dust_time_series = min(squeeze(dusts_time_series_all(:,(1995-1950+1):end,2)'),[],2);
max_dust_time_series = max(squeeze(dusts_time_series_all(:,(1995-1950+1):end,2)'),[],2);
patch([[1995:2100]'; flipud([1995:2100]')],[min_dust_time_series; flipud(max_dust_time_series)],colors(2,:),'LineStyle','none');
alpha(0.3)
wet_dust = plot([1995:2100],mean_dust_time_series,'b-','linewidth',2,'color',colors(2,:));

plot([1995:2100],dusts_time_series_all(1,(1995-1950+1):end,1),'-','linewidth',2,'color','k');
plot([1995:2100],dusts_time_series_all(1,(1995-1950+1):end,2),'--','linewidth',2,'color','k');

legend([dry_dust, wet_dust],{'Dry dust','Wet dust'},'NumColumns',2);
xlim([1995 2100])
ylim([0 0.6])
ylabel('\mug m^{-2} s^{-1}')
box on
text(2000,0.59,'l','fontweight','bold','fontsize',12)

%% 585 process data


ModelNames = {'CESM2','CanESM5', 'GFDL-ESM4','INM-CM5-0','MIROC6','MRI-ESM2-0','NorESM2-LM'};
total_BCs_1995 = nan(288,192,7);
total_BCs_2100 = nan(288,192,7);
total_dusts_1995 = nan(288,192,7);
total_dusts_2100 = nan(288,192,7);

for model_i =1:7
    
    month_i_all = [];
    for year_i = 1995:2014
        index_i = year_i - 1949;
        month_i_all = [month_i_all (index_i-1)*12 + [1 2 3 4 5 12]];
    end
    
    load(['hist_aer_' ModelNames{model_i} '.mat']);
    total_BCs_1995(:,:,model_i) = nanmean(dry_BCs(:,:,month_i_all),3) + nanmean(wet_BCs(:,:,month_i_all),3);
    total_dusts_1995(:,:,model_i) = nanmean(dry_dusts(:,:,month_i_all),3) + nanmean(wet_dusts(:,:,month_i_all),3);
    
    month_i_all = [];
    for year_i = 2081:2100
        index_i = year_i - 2014;
        month_i_all = [month_i_all (index_i-1)*12 + [1 2 3 4 5 12]];
    end
    
    load(['585_aer_' ModelNames{model_i} '.mat']);
    total_BCs_2100(:,:,model_i) = nanmean(dry_BCs(:,:,month_i_all),3) + nanmean(wet_BCs(:,:,month_i_all),3);
    total_dusts_2100(:,:,model_i) = nanmean(dry_dusts(:,:,month_i_all),3) + nanmean(wet_dusts(:,:,month_i_all),3);
end


total_BCs_1995 = total_BCs_1995*10;
total_BCs_2100 = total_BCs_2100*10;
total_dusts_1995 = total_dusts_1995*10;
total_dusts_2100 = total_dusts_2100*10;

mean_BCs_1995 = nanmean(total_BCs_1995,3);
mean_BCs_2100 = nanmean(total_BCs_2100,3);
mean_dusts_1995 = nanmean(total_dusts_1995,3);
mean_dusts_2100 = nanmean(total_dusts_2100,3);

cv_BCs_1995 = nanstd(total_BCs_1995,[],3)./mean_BCs_1995;
cv_BCs_2100 = nanstd(total_BCs_2100,[],3)./mean_BCs_2100;
cv_dusts_1995 = nanstd(total_dusts_1995,[],3)./mean_dusts_1995;
cv_dusts_2100 = nanstd(total_dusts_2100,[],3)./mean_dusts_2100;


load('585_swe_CESM2.mat');
year_i = 2015;
index_i = year_i - 2014;
month_i_all = (index_i-1)*12 + [1 2 3 4 5 12];
mean_swes_1995 = nanmean(swes(:,:,month_i_all),3);

mean_swes_2100 = mean_swes_1995;


mean_BCs_1995(mean_swes_1995<=0.1 | isnan(mean_swes_1995)) = nan;
cv_BCs_1995(mean_swes_1995<=0.1 | isnan(mean_swes_1995)) = nan;
mean_dusts_1995(mean_swes_1995<=0.1 | isnan(mean_swes_1995)) = nan;
cv_dusts_1995(mean_swes_1995<=0.1 | isnan(mean_swes_1995)) = nan;

mean_BCs_2100(mean_swes_2100<=0.1 | isnan(mean_swes_2100)) = nan;
cv_BCs_2100(mean_swes_2100<=0.1 | isnan(mean_swes_2100)) = nan;
mean_dusts_2100(mean_swes_2100<=0.1 | isnan(mean_swes_2100)) = nan;
cv_dusts_2100(mean_swes_2100<=0.1 | isnan(mean_swes_2100)) = nan;

load('585_annual_trend_all.mat');

%% plot
ax1 = subplot('position', [0.03 + 0.21*(1-1) 0.55 0.21 0.2]);
colormap(colors_1)
plot_global_map(lats, lons, mean_BCs_1995, 0,5,"");
hcb = colorbar;
hcb.Location = 'southoutside';
hcb.Title.String = 'BC (ng m^{-2} s^{-1})';
hcb.Title.FontSize = 8;
hcb.Title.FontWeight = 'Bold';
x1=get(gca,'position');
x=get(hcb,'Position');
x(1) = 0.06;
x(2)=0.51;
x(3) = 0.15;
set(hcb,'Position',x)
lab = ylabel('SSP585','fontweight','bold','fontsize',10);
x = lab.Position;
x(1) = x(1) + 0.25;
set(lab,'position',x)
text(-1.3,1.1,'e','fontweight','bold','fontsize',12)

ax2 = subplot('position', [0.03 + 0.21*(2-1) 0.55 0.21 0.2]);
colormap(colors_1)
plot_global_map(lats, lons, mean_BCs_2100, 0,5,"");
hcb = colorbar;
hcb.Location = 'southoutside';
hcb.Title.String = 'BC (ng m^{-2} s^{-1})';
hcb.Title.FontSize = 8;
hcb.Title.FontWeight = 'Bold';
x1=get(gca,'position');
x=get(hcb,'Position');
x(1) = 0.06+0.21;
x(2)=0.51;
x(3) = 0.15;
set(hcb,'Position',x)
text(-1.3,1.1,'f','fontweight','bold','fontsize',12)

ax3 = subplot('position', [0.03 + 0.21*(3-1) 0.55 0.21 0.2]);
colormap(colors_1)
plot_global_map(lats, lons, mean_BCs_2100 - mean_BCs_1995,-1,1,"");
hcb = colorbar;
hcb.Location = 'southoutside';
hcb.Title.String = '\DeltaBC (ng m^{-2} s^{-1})';
hcb.Title.FontSize = 8;
hcb.Title.FontWeight = 'Bold';
x1=get(gca,'position');
x=get(hcb,'Position');
x(1) = 0.06+0.21*2;
x(2)=0.51;
x(3) = 0.15;
set(hcb,'Position',x)
text(-1.3,1.1,'g','fontweight','bold','fontsize',12)

ax4 = subplot('position', [0.03 + 0.21*(4-1)+ 0.04  0.53 0.27 0.19]);
mean_BC_time_series = mean(squeeze(BCs_time_series_all(:,(1995-1950+1):end,1)'),2);
min_BC_time_series = min(squeeze(BCs_time_series_all(:,(1995-1950+1):end,1)'),[],2);
max_BC_time_series = max(squeeze(BCs_time_series_all(:,(1995-1950+1):end,1)'),[],2);

hold on
patch([[1995:2100]'; flipud([1995:2100]')],[min_BC_time_series; flipud(max_BC_time_series)],colors(1,:),'LineStyle','none');
alpha(0.3)
plot([1995:2100],mean_BC_time_series,'r-','linewidth',2,'color',colors(1,:))

mean_BC_time_series = mean(squeeze(BCs_time_series_all(:,(1995-1950+1):end,2)'),2);
min_BC_time_series = min(squeeze(BCs_time_series_all(:,(1995-1950+1):end,2)'),[],2);
max_BC_time_series = max(squeeze(BCs_time_series_all(:,(1995-1950+1):end,2)'),[],2);
patch([[1995:2100]'; flipud([1995:2100]')],[min_BC_time_series; flipud(max_BC_time_series)],colors(2,:),'LineStyle','none');
alpha(0.3)
plot([1995:2100],mean_BC_time_series,'b-','linewidth',2,'color',colors(2,:))
plot([1995:2100],BCs_time_series_all(1,(1995-1950+1):end,1),'-','linewidth',2,'color','k');
plot([1995:2100],BCs_time_series_all(1,(1995-1950+1):end,2),'--','linewidth',2,'color','k');

xlim([1995 2100])
ylim([0 0.6])
box on
xlim([1995 2100])

ylabel('ng m^{-2} s^{-1}')
text(2000,0.65,'h','fontweight','bold','fontsize',12)


%%dust
ax5 = subplot('position', [0.03 + 0.21*(1-1) 0.07 0.21 0.2]);
colormap(colors_1)
plot_global_map(lats, lons, mean_dusts_1995, 0,5,"");
hcb = colorbar;
hcb.Location = 'southoutside';
hcb.Title.String = 'Dust (\mug m^{-2} s^{-1})';
hcb.Title.FontSize = 8;
hcb.Title.FontWeight = 'Bold';
x1=get(gca,'position');
x=get(hcb,'Position');
x(1) = 0.06;
x(2)=0.03;
x(3) = 0.15;
set(hcb,'Position',x)
lab = ylabel('SSP585','fontweight','bold','fontsize',10);
x = lab.Position;
x(1) = x(1) + 0.25;
set(lab,'position',x)
text(-1.3,1.1,'m','fontweight','bold','fontsize',12)

ax6 = subplot('position', [0.03 + 0.21*(2-1) 0.07 0.21 0.2]);
colormap(colors_1)
plot_global_map(lats, lons, mean_dusts_2100, 0,5,"");
hcb = colorbar;
hcb.Location = 'southoutside';
hcb.Title.String = 'Dust (\mug m^{-2} s^{-1})';
hcb.Title.FontSize = 8;
hcb.Title.FontWeight = 'Bold';
x1=get(gca,'position');
x=get(hcb,'Position');
x(1) = 0.06+0.21;
x(2)=0.03;
x(3) = 0.15;
set(hcb,'Position',x)
text(-1.3,1.1,'n','fontweight','bold','fontsize',12)

ax7 = subplot('position', [0.03 + 0.21*(3-1) 0.07 0.21 0.2]);
colormap(colors_1)
plot_global_map(lats, lons, mean_dusts_2100 - mean_dusts_1995,-1,1,"");
hcb = colorbar;
hcb.Location = 'southoutside';
hcb.Title.String = '\DeltaDust (\mug m^{-2} s^{-1})';
hcb.Title.FontSize = 8;
hcb.Title.FontWeight = 'Bold';
x1=get(gca,'position');
x=get(hcb,'Position');
x(1) = 0.06+0.21*2;
x(2)=0.03;
x(3) = 0.15;
set(hcb,'Position',x)
text(-1.3,1.1,'o','fontweight','bold','fontsize',12)

ax8 = subplot('position', [0.03 + 0.21*(4-1) + 0.04 0.05 0.27 0.19]);
mean_dust_time_series = mean(squeeze(dusts_time_series_all(:,(1995-1950+1):end,1)'),2);
min_dust_time_series = min(squeeze(dusts_time_series_all(:,(1995-1950+1):end,1)'),[],2);
max_dust_time_series = max(squeeze(dusts_time_series_all(:,(1995-1950+1):end,1)'),[],2);

hold on
patch([[1995:2100]'; flipud([1995:2100]')],[min_dust_time_series; flipud(max_dust_time_series)],colors(1,:),'LineStyle','none');
alpha(0.3)
plot([1995:2100],mean_dust_time_series,'r-','linewidth',2,'color',colors(1,:))

mean_dust_time_series = mean(squeeze(dusts_time_series_all(:,(1995-1950+1):end,2)'),2);
min_dust_time_series = min(squeeze(dusts_time_series_all(:,(1995-1950+1):end,2)'),[],2);
max_dust_time_series = max(squeeze(dusts_time_series_all(:,(1995-1950+1):end,2)'),[],2);
patch([[1995:2100]'; flipud([1995:2100]')],[min_dust_time_series; flipud(max_dust_time_series)],colors(2,:),'LineStyle','none');
alpha(0.3)
plot([1995:2100],mean_dust_time_series,'b-','linewidth',2,'color',colors(2,:))

plot([1995:2100],dusts_time_series_all(1,(1995-1950+1):end,1),'-','linewidth',2,'color','k');
plot([1995:2100],dusts_time_series_all(1,(1995-1950+1):end,2),'--','linewidth',2,'color','k');

xlim([1995 2100])
ylim([0 0.6])
box on
ylabel('\mug m^{-2} s^{-1}')
text(2000,0.66,'p','fontweight','bold','fontsize',12)


%% output
print(gcf, '-dtiff', '-r300', '../../figure/aero_deposit_pattern_trend.tif')

close all
