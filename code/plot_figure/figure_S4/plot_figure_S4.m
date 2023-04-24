clc;
clear all;
close all;

load('all_Data_snow_season.mat');
%% get mean
means_SSP126_SWE = nanmean(mean_SSP126_SWE,2);
stds_SSP126_SWE = nanstd(mean_SSP126_SWE,1,2);
means_SSP126_BC = nanmean(mean_SSP126_BC,2);
stds_SSP126_BC = nanstd(mean_SSP126_BC,1,2);
means_SSP126_dust = nanmean(mean_SSP126_dust,2);
stds_SSP126_dust = nanstd(mean_SSP126_dust,1,2);
means_SSP126_AER = nanmean(mean_SSP126_AER,2);
stds_SSP126_AER = nanstd(mean_SSP126_AER,1,2);

means_SSP126_BD_SWE = nanmean(mean_SSP126_BD_SWE,2);
stds_SSP126_BD_SWE = nanstd(mean_SSP126_BD_SWE,1,2);
means_SSP126_BD_BC = nanmean(mean_SSP126_BD_BC,2);
stds_SSP126_BD_BC = nanstd(mean_SSP126_BD_BC,1,2);
means_SSP126_BD_dust = nanmean(mean_SSP126_BD_dust,2);
stds_SSP126_BD_dust = nanstd(mean_SSP126_BD_dust,1,2);
means_SSP126_BD_AER = nanmean(mean_SSP126_BD_AER,2);
stds_SSP126_BD_AER = nanstd(mean_SSP126_BD_AER,1,2);

means_SSP585_SWE = nanmean(mean_SSP585_SWE,2);
stds_SSP585_SWE = nanstd(mean_SSP585_SWE,1,2);
means_SSP585_BC = nanmean(mean_SSP585_BC,2);
stds_SSP585_BC = nanstd(mean_SSP585_BC,1,2);
means_SSP585_dust = nanmean(mean_SSP585_dust,2);
stds_SSP585_dust = nanstd(mean_SSP585_dust,1,2);
means_SSP585_AER = nanmean(mean_SSP585_AER,2);
stds_SSP585_AER = nanstd(mean_SSP585_AER,1,2);

means_SSP585_BD_SWE = nanmean(mean_SSP585_BD_SWE,2);
stds_SSP585_BD_SWE = nanstd(mean_SSP585_BD_SWE,1,2);
means_SSP585_BD_BC = nanmean(mean_SSP585_BD_BC,2);
stds_SSP585_BD_BC = nanstd(mean_SSP585_BD_BC,1,2);
means_SSP585_BD_dust = nanmean(mean_SSP585_BD_dust,2);
stds_SSP585_BD_dust = nanstd(mean_SSP585_BD_dust,1,2);
means_SSP585_BD_AER = nanmean(mean_SSP585_BD_AER,2);
stds_SSP585_BD_AER = nanstd(mean_SSP585_BD_AER,1,2);

ratio_SWE_126 = (mean_SSP126_SWE - mean_SSP126_BD_SWE)./mean_SSP126_SWE*100;
ratio_SWE_585 = (mean_SSP585_SWE - mean_SSP585_BD_SWE)./mean_SSP585_SWE*100;

mean_ratio_SWE_126 = nanmean(ratio_SWE_126,2);
std_ratio_SWE_126 = nanstd(ratio_SWE_126,1,2);
mean_ratio_SWE_585 = nanmean(ratio_SWE_585,2);
std_ratio_SWE_585 = nanstd(ratio_SWE_585,1,2);

%% cal_slope
Years = [2015:2100]';
[taub tau h sig Z S sigma sen n senplot CIlower CIupper D Dall C3 nsigma] = ktaub([Years means_SSP126_BC(66:end)], 0.05, 0);
 sen*10
[taub tau h sig Z S sigma sen n senplot CIlower CIupper D Dall C3 nsigma] = ktaub([Years means_SSP126_BD_BC(66:end)], 0.05, 0);
 sen*10
[taub tau h sig Z S sigma sen n senplot CIlower CIupper D Dall C3 nsigma] = ktaub([Years means_SSP585_BC(66:end)], 0.05, 0);
 sen*10
[taub tau h sig Z S sigma sen n senplot CIlower CIupper D Dall C3 nsigma] = ktaub([Years means_SSP585_BD_BC(66:end)], 0.05, 0);
 sen*10
 
 
 
 [taub tau h sig Z S sigma sen n senplot CIlower CIupper D Dall C3 nsigma] = ktaub([Years means_SSP126_dust(66:end)], 0.05, 0);
 sen*10
 sig
[taub tau h sig Z S sigma sen n senplot CIlower CIupper D Dall C3 nsigma] = ktaub([Years means_SSP126_BD_dust(66:end)], 0.05, 0);
 sen*10
  sig

[taub tau h sig Z S sigma sen n senplot CIlower CIupper D Dall C3 nsigma] = ktaub([Years means_SSP585_dust(66:end)], 0.05, 0);
 sen*10
  sig

[taub tau h sig Z S sigma sen n senplot CIlower CIupper D Dall C3 nsigma] = ktaub([Years means_SSP585_BD_dust(66:end)], 0.05, 0);
 sen*10
  sig

  [taub tau h sig Z S sigma sen n senplot CIlower CIupper D Dall C3 nsigma] = ktaub([Years means_SSP126_AER(66:end)], 0.05, 0);
 sen*10
 sig
[taub tau h sig Z S sigma sen n senplot CIlower CIupper D Dall C3 nsigma] = ktaub([Years means_SSP126_BD_AER(66:end)], 0.05, 0);
 sen*10
  sig

[taub tau h sig Z S sigma sen n senplot CIlower CIupper D Dall C3 nsigma] = ktaub([Years means_SSP585_AER(66:end)], 0.05, 0);
 sen*10
  sig

[taub tau h sig Z S sigma sen n senplot CIlower CIupper D Dall C3 nsigma] = ktaub([Years means_SSP585_BD_AER(66:end)], 0.05, 0);
 sen*10
  sig

%% plot 
colors =  [0.45, 0.80, 0.69;...
    0.98, 0.40, 0.35;...
    0.55, 0.60, 0.79];
% figure;
% subplot(211)
% hold on
% plot(1950:2100,nanmean(mean_SSP126(:,1),2),'b')
% plot(1950:2100,nanmean(mean_SSP126_BD(:,1),2),'r')
figure;
set(gcf,'unit','normalized','position',[0.1,0.05,0.65,0.82]);
set(gca, 'Position', [0 0 1 1])

ax1 = subplot('position', [0.1 0.68 0.86 0.3]);
hold on
t1 = plot(1950:2100,means_SSP126_BC,'r','linewidth',1,'color',colors(1,:));
patch([[1950:2100]'; flipud([1950:2100]')],[means_SSP126_BC-stds_SSP126_BC; flipud(means_SSP126_BC+stds_SSP126_BC)],colors(1,:),'LineStyle','none');
alpha(0.3)

t2 = plot(1950:2100, means_SSP126_BD_BC,'r:','linewidth',1.5,'color',colors(1,:));
patch([[1950:2100]'; flipud([1950:2100]')],[means_SSP126_BD_BC-stds_SSP126_BD_BC; flipud(means_SSP126_BD_BC+stds_SSP126_BD_BC)],colors(1,:),'LineStyle','none');
alpha(0.3)

t3 = plot(1950:2100, means_SSP585_BC,'b','linewidth',1.5,'color',colors(2,:));
patch([[1950:2100]'; flipud([1950:2100]')],[means_SSP585_BC-stds_SSP585_BC; flipud(means_SSP585_BC+stds_SSP585_BC)],colors(2,:),'LineStyle','none');
alpha(0.3)

t4 = plot(1950:2100, means_SSP585_BD_BC,'b:','linewidth',1.5,'color',colors(2,:));
patch([[1950:2100]'; flipud([1950:2100]')],[means_SSP585_BD_BC-stds_SSP585_BD_BC; flipud(means_SSP585_BD_BC+stds_SSP585_BD_BC)],colors(2,:),'LineStyle','none');
alpha(0.3)

set(gca,'linewidth',1,'fontsize',10,'xticklabel',{})
box on
xlim([2015 2100])
ylabel('RF_{BC} (W m^{-2})')
ylim([0 6.5])
text(2008,6.5+6.5*0.05,'a','fontsize',14,'fontweight','bold')

ax2 = subplot('position', [0.1 0.36 0.86 0.3]);
hold on

hold on
t1 = plot(1950:2100, means_SSP126_dust,'r','linewidth',1,'color',colors(1,:))
patch([[1950:2100]'; flipud([1950:2100]')],[means_SSP126_dust-stds_SSP126_dust; flipud(means_SSP126_dust+stds_SSP126_dust)],colors(1,:),'LineStyle','none');
alpha(0.3)

t2 = plot(1950:2100, means_SSP126_BD_dust,'r:','linewidth',1.5,'color',colors(1,:))
patch([[1950:2100]'; flipud([1950:2100]')],[means_SSP126_BD_dust-stds_SSP126_BD_dust; flipud(means_SSP126_BD_dust+stds_SSP126_BD_dust)],colors(1,:),'LineStyle','none');
alpha(0.3)

t3 = plot(1950:2100, means_SSP585_dust,'b','linewidth',1.5,'color',colors(2,:))
patch([[1950:2100]'; flipud([1950:2100]')],[means_SSP585_dust-stds_SSP585_dust; flipud(means_SSP585_dust+stds_SSP585_dust)],colors(2,:),'LineStyle','none');
alpha(0.3)

t4 = plot(1950:2100, means_SSP585_BD_dust,'b:','linewidth',1.5,'color',colors(2,:))
patch([[1950:2100]'; flipud([1950:2100]')],[means_SSP585_BD_dust-stds_SSP585_BD_dust; flipud(means_SSP585_BD_dust+stds_SSP585_BD_dust)],colors(2,:),'LineStyle','none');
alpha(0.3)

plot([1950 2100], [0 0],'k--','linewidth',1)

set(gca,'linewidth',1,'fontsize',10,'xticklabel',{})
box on
xlim([2015 2100])
ylabel('RF_{dust} (W m^{-2})')

ylim([0 6.5])
text(2008,6.5+6.5*0.05,'b','fontsize',14,'fontweight','bold')
lgd = legend([t1 t2 t3 t4],{'SSP126_{LAP_{future}}','SSP126_{LAP_{hist}}','SSP585_{LAP_{future}}','SSP585_{LAP_{hist}}'},...
    'Orientation','horizontal','location','north');
lgd.NumColumns = 2;
lgd.FontSize = 12;

ax3 = subplot('position', [0.1 0.04 0.86 0.30]);
hold on
t1 = plot(1950:2100, means_SSP126_AER,'r','linewidth',1,'color',colors(1,:))
patch([[1950:2100]'; flipud([1950:2100]')],[means_SSP126_AER-stds_SSP126_AER; flipud(means_SSP126_AER+stds_SSP126_AER)],colors(1,:),'LineStyle','none');
alpha(0.3)

t2 = plot(1950:2100, means_SSP126_BD_AER,'r:','linewidth',1.5,'color',colors(1,:))
patch([[1950:2100]'; flipud([1950:2100]')],[means_SSP126_BD_AER-stds_SSP126_BD_AER; flipud(means_SSP126_BD_AER+stds_SSP126_BD_AER)],colors(1,:),'LineStyle','none');
alpha(0.3)

t3 = plot(1950:2100, means_SSP585_AER,'b','linewidth',1.5,'color',colors(2,:))
patch([[1950:2100]'; flipud([1950:2100]')],[means_SSP585_AER-stds_SSP585_AER; flipud(means_SSP585_AER+stds_SSP585_AER)],colors(2,:),'LineStyle','none');
alpha(0.3)

t4 = plot(1950:2100, means_SSP585_BD_AER,'b:','linewidth',1.5,'color',colors(2,:))
patch([[1950:2100]'; flipud([1950:2100]')],[means_SSP585_BD_AER-stds_SSP585_BD_AER; flipud(means_SSP585_BD_AER+stds_SSP585_BD_AER)],colors(2,:),'LineStyle','none');
alpha(0.3)

plot([1950 2100], [0 0],'k--','linewidth',1)

set(gca,'linewidth',1,'fontsize',10)
box on
xlim([2015 2100])
ylabel('RF_{LAP} (W m^{-2})')

ylim([0 6.5])
text(2008,6.5+6.5*0.05,'c','fontsize',14,'fontweight','bold')
% legend([t1 t2 t3 t4],{'SSP126_{future\_LAPs}','SSP126_{hist\_LAPs}','SSP585_{future\_LAPs}','SSP585_{hist\_LAPs}'},...
%     'Orientation','horizontal','location','northwest');



print(gcf, '-dtiff', '-r300', '../../figures/figure_S4.tif');
close all