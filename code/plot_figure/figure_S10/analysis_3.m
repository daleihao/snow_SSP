figure;
subplot(121)
hold on
plot(nanmean(mean_TPs_AER_Control_SSP585(:,(end-19):end),2),'r')
plot(nanmean(mean_TPs_AER_Control_Hist_SSP585(:,(end-19):end),2),'b')
plot(nanmean(mean_TPs_AER_Control_SSP585(:,46:65),2),'k')


subplot(122)
hold on
plot(nanmean(mean_TPs_AER_Control_SSP126(:,(end-19):end),2),'r')
plot(nanmean(mean_TPs_AER_Control_Hist_SSP126(:,(end-19):end),2),'b')
plot(nanmean(mean_TPs_AER_Control_SSP126(:,46:65),2),'k')

