clc;
clear all;
close all;

get_data_1

%% figure
figure;

colors =  [0.45, 0.80, 0.69;...
    0.98, 0.40, 0.35;...
    0.55, 0.60, 0.79];

set(gcf,'unit','normalized','position',[0.1,0.05,0.5,0.7]);
set(gca, 'Position', [0 0 1 1])

ax1 = subplot('position', [0.09 0.035 + 0.32*(3-1) 0.42 0.28]);
hold on
plot(1995:2100,time_series_pr_SSP126','-','color',[0.7 0.7 0.7],'linewidth',0.6)
%plot(1995:2100,time_series_pr_SSP126(1,:)','g-','linewidth',1.5)
plot(1995:2100,nanmean(time_series_pr_SSP126,1)','b-','linewidth',1.5,'color',colors(1,:))
plot(1995:2100,ELM_time_series_PR_SSP126(1,:)','r-','linewidth',1.5,'color',colors(2,:))

title('SSP126')
plot([2015 2015],[0 1e4],'k--','linewidth',1)
ylabel('Precipitation (mm/day)')
ylim([0.5 3.5])
xlim([1995 2100])
box on
set(gca,'linewidth',1,'fontsize',12,'xticklabel',[])
text(2000,3.5-3*0.07,'a','fontsize',15,'fontweight','bold')

%%plot2
ax2 = subplot('position', [0.55 0.035 + 0.32*(3-1)  0.42 0.28]);
hold on
plot(1995:2100, time_series_pr_SSP585','-','color',[0.7 0.7 0.7],'linewidth',0.6)
%plot(1995:2100,time_series_pr_SSP585(1,:)','g-','linewidth',1.5)
plot(1995:2100,nanmean(time_series_pr_SSP585,1)','b-','linewidth',1.5,'color',colors(1,:))
plot(1995:2100,ELM_time_series_PR_SSP585(1,:)','r-','linewidth',1.5,'color',colors(2,:))

plot([2015 2015],[0 1e4],'k--','linewidth',1)

title('SSP585')
ylim([0.5 3.5])
xlim([1995 2100])
box on
set(gca,'linewidth',1,'fontsize',12,'xticklabel',[],'yticklabel',[])
text(2000,3.5-3*0.07,'b','fontsize',15,'fontweight','bold')

%%plot
ax3 = subplot('position', [ 0.09 0.04 + 0.32*(2-1) 0.42 0.28]);
hold on
%plot(1995:2100,time_series_tas_SSP126(1,:)','g-','linewidth',1.5)
p3 = plot(1995:2100,time_series_tas_SSP126(1,:)','-','color',[0.7 0.7 0.7],'linewidth',0.6);
plot(1995:2100,time_series_tas_SSP126(2:end,:)','-','color',[0.7 0.7 0.7],'linewidth',0.6);

p2 = plot(1995:2100,nanmean(time_series_tas_SSP126,1)','b-','linewidth',1.5,'color',colors(1,:));
p1 = plot(1995:2100,ELM_time_series_TA_SSP126(1,:)','r-','linewidth',1.5,'color',colors(2,:));


plot([2015 2015],[0 1e4],'k--','linewidth',1)

ylabel('Air temperature (K)')
ylim([255 275])
xlim([1995 2100])
box on
set(gca,'linewidth',1,'fontsize',12,'xticklabel',[])
text(2000,275-(275-255)*0.07,'c','fontsize',15,'fontweight','bold')

legend([p1 p2 p3],{'CESM2/ELM','Mean of CMIP6','CMIP6'}); 

%%plot
ax4 = subplot('position', [ 0.55 0.04 + 0.32*(2-1) 0.42 0.28]);
hold on
plot(1995:2100,time_series_tas_SSP585','-','color',[0.7 0.7 0.7],'linewidth',0.6)
%plot(1995:2100,time_series_tas_SSP585(1,:)','g-','linewidth',1.5)
plot(1995:2100,nanmean(time_series_tas_SSP585,1)','b-','linewidth',1.5,'color',colors(1,:))
plot(1995:2100,ELM_time_series_TA_SSP585(1,:)','r-','linewidth',1.5,'color',colors(2,:))

plot([2015 2015],[0 1e4],'k--','linewidth',1)

ylim([255 275])
xlim([1995 2100])
box on
set(gca,'linewidth',1,'fontsize',12,'xticklabel',[],'yticklabel',[])
text(2000,275-(275-255)*0.07,'d','fontsize',15,'fontweight','bold')

%%plot
ax5 = subplot('position', [ 0.09 0.05 + 0.32*(1-1) 0.42 0.28]);
hold on
plot(1995:2100,time_series_swe_SSP126','-','color',[0.7 0.7 0.7],'linewidth',0.6)
plot([2015 2015],[0 1e4],'k--','linewidth',1)
plot(1995:2100,nanmean(time_series_swe_SSP126,1)','b-','linewidth',1.5,'color',colors(1,:))
plot(1995:2100,ELM_time_series_swe_SSP126(1,:)','r-','linewidth',1.5,'color',colors(2,:))
plot(1995:2100,time_series_swe_SSP585(1,:)','r-','linewidth',1.5,'color',colors(3,:))

%plot(1995:2100,time_series_swe_SSP126(1,:)','g-')
xlim([1995 2100])
ylim([0 400])
ylabel('April SWE (mm)')
box on
set(gca,'linewidth',1,'fontsize',12)
text(2000,400-400*0.07,'e','fontsize',15,'fontweight','bold')

ax6 = subplot('position', [ 0.55 0.05 + 0.32*(1-1) 0.42 0.28]);
hold on
plot(1995:2100,time_series_swe_SSP585','-','color',[0.7 0.7 0.7],'linewidth',0.6)
%plot(1995:2100,time_series_swe_SSP585(1,:)','g-')
%plot(1995:2014,ERA5_time_series_swe(1,:)','g-','linewidth',1.5)
plot([2015 2015],[0 1e4],'k--','linewidth',1)
plot(1995:2100,nanmean(time_series_swe_SSP585,1)','b-','linewidth',1.5,'color',colors(1,:))
plot(1995:2100,ELM_time_series_swe_SSP585(1,:)','r-','linewidth',1.5,'color',colors(2,:))
plot(1995:2100,time_series_swe_SSP585(1,:)','r-','linewidth',1.5,'color',colors(3,:))


xlim([1995 2100])
ylim([0 400])
box on
set(gca,'linewidth',1,'fontsize',12,'yticklabel',[])
text(2000,400-400*0.07,'f','fontsize',15,'fontweight','bold')

ax6.XAxis.FontSize = 11;
ax5.XAxis.FontSize = 11;

ax1.YAxis.FontSize = 11;
ax3.YAxis.FontSize = 11;
ax5.YAxis.FontSize = 11;


print(gcf, '-dtiff', '-r300', '../../figures/figure_S7_1.tif')
