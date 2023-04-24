load('Snowmelt_Annual_mean_SSP126_2015_2100_Control_revise2.mat');
future_SSP126_Runoff = nanmean(QRUNOFF_means(:,:,((end-19):end)),3)*86400*365;
future_SSP126_Snowmelt = nanmean(QSNOMELT_means(:,:,((end-19):end)),3)*86400*365;
load('Snowmelt_Annual_mean_SSP126_2015_2100_Control_hist_BD_revise2.mat');
future_SSP126_Runoff_hist = nanmean(QRUNOFF_means(:,:,((end-19):end)),3)*86400*365;
future_SSP126_Snowmelt_hist = nanmean(QSNOMELT_means(:,:,((end-19):end)),3)*86400*365;

load('Snowmelt_Annual_mean_SSP585_2015_2100_Control_revise2.mat');
future_SSP585_Runoff = nanmean(QRUNOFF_means(:,:,((end-19):end)),3)*86400*365;
future_SSP585_Snowmelt = nanmean(QSNOMELT_means(:,:,((end-19):end)),3)*86400*365;
load('Snowmelt_Annual_mean_SSP585_2015_2100_Control_hist_BD_revise2.mat');
future_SSP585_Runoff_hist = nanmean(QRUNOFF_means(:,:,((end-19):end)),3)*86400*365;
future_SSP585_Snowmelt_hist = nanmean(QSNOMELT_means(:,:,((end-19):end)),3)*86400*365;


load('Snowmelt_Annual_mean_hist_run_1950_2014_Control_revise2.mat');
future_hist_Runoff = nanmean(QRUNOFF_means(:,:,((end-19):end)),3)*86400*365;
future_hist_Snowmelt = nanmean(QSNOMELT_means(:,:,((end-19):end)),3)*86400*365;

%% plot
figure;
colormap jet
subplot(221)
imagesc(flipud(future_SSP126_Snowmelt' - future_SSP126_Snowmelt_hist'), [-30 30])
colormap jet
title('SSP126')
ylabel('Snowmelt')
colorbar
subplot(222)
imagesc(flipud(future_SSP585_Snowmelt' - future_SSP585_Snowmelt_hist'), [-30 30])
title('SSP585')
colorbar

subplot(223)
imagesc(flipud(future_SSP126_Runoff' - future_SSP126_Runoff_hist'), [-30 30])
ylabel('Runoff')
colorbar

subplot(224)
imagesc(flipud(future_SSP585_Runoff' - future_SSP585_Runoff_hist'), [-30 30])
colorbar

