load('Summer_mean_SSP126_2015_2100_Control_revise2.mat');
future_SSP126_RF_LAP = nanmean(RF_LAP_means(:,:,((end-19):end)),3);
future_SSP126_SWE = nanmean(SWE_means(:,:,((end-19):end)),3);
load('Summer_mean_SSP126_2015_2100_Control_hist_BD_revise2.mat');
future_SSP126_RF_LAP_hist = nanmean(RF_LAP_means(:,:,((end-19):end)),3);
future_SSP126_SWE_hist = nanmean(SWE_means(:,:,((end-19):end)),3);

load('Summer_mean_SSP585_2015_2100_Control_revise2.mat');
future_SSP585_RF_LAP = nanmean(RF_LAP_means(:,:,((end-19):end)),3);
future_SSP585_SWE = nanmean(SWE_means(:,:,((end-19):end)),3);
load('Summer_mean_SSP585_2015_2100_Control_hist_BD_revise2.mat');
future_SSP585_RF_LAP_hist = nanmean(RF_LAP_means(:,:,((end-19):end)),3);
future_SSP585_SWE_hist = nanmean(SWE_means(:,:,((end-19):end)),3);


load('Summer_mean_hist_run_1950_2014_Control_revise2.mat');
future_hist_RF_LAP = nanmean(RF_LAP_means(:,:,((end-19):end)),3);
future_hist_SWE = nanmean(SWE_means(:,:,((end-19):end)),3);

%% plot
figure;
colormap jet
subplot(221)
imagesc(flipud(future_SSP126_SWE' - future_SSP126_SWE_hist'), [-10 10])
colormap jet
title('SSP126')
ylabel('SWE')
colorbar
subplot(222)
imagesc(flipud(future_SSP585_SWE' - future_SSP585_SWE_hist'), [-10 10])
title('SSP585')
colorbar

subplot(223)
imagesc(flipud(future_SSP126_RF_LAP' - future_SSP126_RF_LAP_hist'), [-1 1])
ylabel('RF\_LAP')
colorbar

subplot(224)
imagesc(flipud(future_SSP585_RF_LAP' - future_SSP585_RF_LAP_hist'), [-1 1])
colorbar

