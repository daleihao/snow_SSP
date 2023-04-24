
load('all_Data.mat');
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
set(gcf,'unit','normalized','position',[0.1,0.05,0.85,0.52]);
set(gca, 'Position', [0 0 1 1])


ax1 = subplot('position', [0.06 0.50 0.43 0.4]);
hold on
plot(1:8,nanmean(mean_SSP126_AER(46:65,:)),'ro', 'MarkerSize',6,...
    'MarkerEdgeColor',colors(1,:),...
    'MarkerFaceColor',colors(1,:))
plot(1:8,nanmean(mean_SSP126_AER((end-19):end,:)),'bp','MarkerSize',6,...
    'MarkerEdgeColor',colors(2,:),...
    'MarkerFaceColor',colors(2,:))
plot(1:8,nanmean(mean_SSP126_BD_AER((end-19):end,:)),'k^','MarkerSize',6,...
    'MarkerEdgeColor',colors(3,:),...
    'MarkerFaceColor',colors(3,:))

hist_tmp = nanmean(mean_SSP126_AER(46:65,:));
future_tmp1 = nanmean(mean_SSP126_AER((end-19):end,:));
future_tmp2 = nanmean(mean_SSP126_BD_AER((end-19):end,:));

 ratio_tmp = (future_tmp2 - future_tmp1)./(hist_tmp - future_tmp1)*100;
% for k = 1:8
% text(k-0.3,0.6,[num2str(ratio_tmp(k),'%2.1f') '%'],'fontsize',10);
% end

nanmean(ratio_tmp)
nanstd(ratio_tmp,1)

ylim([0 8])
xlim([0.5 8.5])
text(-0.5,8+8*0.05,'a','fontsize',14,'fontweight','bold')

box on
set(gca,'linewidth',1,'fontsize',10,'xticklabel',{})
ylabel('RF_{LAP} (W m^{-2})')

title('SSP126');
%legend('Historical','Future_{future\_LAPs}','Future_{hist\_LAPs}','location','northeast');
%set(gca,'linewidth',1,'fontsize',10,'xtick',[1:8],'xticklabel',{'Control','Koch','PP','extBC','intDust','noLULCC','MSE_2','MSE_0.02'})

ax2 = subplot('position', [0.55 0.50 0.43 0.4]);
hold on
plot(1:8,nanmean(mean_SSP585_AER(46:65,:)),'ro', 'MarkerSize',6,...
    'MarkerEdgeColor',colors(1,:),...
    'MarkerFaceColor',colors(1,:))
plot(1:8,nanmean(mean_SSP585_AER((end-19):end,:)),'bp','MarkerSize',6,...
    'MarkerEdgeColor',colors(2,:),...
    'MarkerFaceColor',colors(2,:))
plot(1:8,nanmean(mean_SSP585_BD_AER((end-19):end,:)),'k^','MarkerSize',6,...
    'MarkerEdgeColor',colors(3,:),...
    'MarkerFaceColor',colors(3,:))
ylim([0 8])
xlim([0.5 8.5])
text(-0.3,8+8*0.05,'b','fontsize',14,'fontweight','bold')

hist_tmp = nanmean(mean_SSP585_AER(46:65,:));
future_tmp1 = nanmean(mean_SSP585_AER((end-19):end,:));
future_tmp2 = nanmean(mean_SSP585_BD_AER((end-19):end,:));

% ratio_tmp = (future_tmp1 - future_tmp2)./(hist_tmp - future_tmp2)*100;
% for k = 1:8
% text(k-0.3,0.6,[num2str(ratio_tmp(k),'%2.1f') '%'],'fontsize',10);
% end
 ratio_tmp = (future_tmp2 - future_tmp1)./(hist_tmp - future_tmp1)*100;

nanmean(ratio_tmp)
nanstd(ratio_tmp,1)

box on
%set(gca,'linewidth',1,'fontsize',8,'xtick',[1:8],'xticklabel',{'Control','Koch','PP','extBC','intDust','noLULCC','MSE_2','MSE_0.02'})
set(gca,'linewidth',1,'fontsize',10,'xticklabel',{})
title('SSP585');



ax3 = subplot('position', [0.06 0.07 0.43 0.4]);
hold on
plot(1:8,nanmean(mean_SSP126_SWE(46:65,:)),'ro', 'MarkerSize',6,...
    'MarkerEdgeColor',colors(1,:),...
    'MarkerFaceColor',colors(1,:))
plot(1:8,nanmean(mean_SSP126_SWE((end-19):end,:)),'bp','MarkerSize',6,...
    'MarkerEdgeColor',colors(2,:),...
    'MarkerFaceColor',colors(2,:))
plot(1:8,nanmean(mean_SSP126_BD_SWE((end-19):end,:)),'k^','MarkerSize',6,...
    'MarkerEdgeColor',colors(3,:),...
    'MarkerFaceColor',colors(3,:))

hist_tmp = nanmean(mean_SSP126_SWE(46:65,:));
future_tmp1 = nanmean(mean_SSP126_SWE((end-19):end,:));
future_tmp2 = nanmean(mean_SSP126_BD_SWE((end-19):end,:));

ratio_tmp = (future_tmp1 - future_tmp2)./(hist_tmp - future_tmp2)*100;
nanmean(ratio_tmp)
nanstd(ratio_tmp,1)
for k = 1:8
text(k-0.3,45,[num2str(ratio_tmp(k),'%2.1f') '%'],'fontsize',10);
end

ylim([30 200])
xlim([0.5 8.5])
text(-0.5,200+170*0.05,'c','fontsize',14,'fontweight','bold')

box on
set(gca,'linewidth',1,'fontsize',10)
ylabel('April SWE (mm)')

set(gca,'linewidth',1,'fontsize',9,'xtick',[1:8],'xticklabel',{'Control','PP','Koch','extBC','intDust','noLULCC','MSE\_high','MSE\_low'})
t = legend('Climate_{hist}+LAP_{hist}','Climate_{future}+LAP_{future}','Climate_{future}+LAP_{hist}','location','north');
t.Position(2) = 0.12;
t.FontSize = 10;
t.NumColumns = 2;
ax4 = subplot('position', [0.55 0.07 0.43 0.4]);
hold on
plot(1:8,nanmean(mean_SSP585_SWE(46:65,:)),'ro', 'MarkerSize',6,...
    'MarkerEdgeColor',colors(1,:),...
    'MarkerFaceColor',colors(1,:))
plot(1:8,nanmean(mean_SSP585_SWE((end-19):end,:)),'bp','MarkerSize',6,...
    'MarkerEdgeColor',colors(2,:),...
    'MarkerFaceColor',colors(2,:))
plot(1:8,nanmean(mean_SSP585_BD_SWE((end-19):end,:)),'k^','MarkerSize',6,...
    'MarkerEdgeColor',colors(3,:),...
    'MarkerFaceColor',colors(3,:))
ylim([30 200])
xlim([0.5 8.5])
text(-0.3,200+170*0.05,'d','fontsize',14,'fontweight','bold')

hist_tmp = nanmean(mean_SSP585_SWE(46:65,:));
future_tmp1 = nanmean(mean_SSP585_SWE((end-19):end,:));
future_tmp2 = nanmean(mean_SSP585_BD_SWE((end-19):end,:));

ratio_tmp = (future_tmp1 - future_tmp2)./(hist_tmp - future_tmp2)*100;
nanmean(ratio_tmp)
nanstd(ratio_tmp,1)
for k = 1:8
text(k-0.3,45,[num2str(ratio_tmp(k),'%2.1f') '%'],'fontsize',10);
end

box on
set(gca,'linewidth',1,'fontsize',9,'xtick',[1:8],'xticklabel',{'Control','PP','Koch','extBC','intDust','noLULCC','MSE\_high','MSE\_low'})


print(gcf, '-dtiff', '-r300', '../figures/figure_3.tif');
close all