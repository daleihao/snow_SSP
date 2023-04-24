%% get_ELM_Data
dirname = 'C:\Users\haod776\OneDrive - PNNL\Documents\work\E3SM\writting\snow_SSP\CMIP6-data\ELM_simulations\process_code_after_LULCC\data\';

%% plot sensitivity
%% hist
load([dirname 'April_mean_hist_run_1950_2014_Control_revise2.mat']);
mean_BC_hist = RF_BC_means;
mean_dust_hist = RF_dust_means;
mean_AER_hist = RF_LAP_means;
mean_SWE_hist = SWE_means;


%% SSP126
load([dirname 'April_mean_SSP126_2015_2100_Control_revise2.mat']);
mean_BC_2100_126 = RF_BC_means;
mean_dust_2100_126 = RF_dust_means;
mean_AER_2100_126 = RF_LAP_means;
mean_SWE_2100_126 = SWE_means;

%% SSP585
load([dirname 'April_mean_SSP585_2015_2100_Control_revise2.mat']);
mean_BC_2100_585 = RF_BC_means;
mean_dust_2100_585 = RF_dust_means;
mean_AER_2100_585 = RF_LAP_means;
mean_SWE_2100_585 = SWE_means;


%% SSP126
load([dirname 'April_mean_SSP126_2015_2100_Control_hist_BD_revise2.mat']);
mean_BC_2100_126_BD = RF_BC_means;
mean_dust_2100_126_BD = RF_dust_means;
mean_AER_2100_126_BD = RF_LAP_means;
mean_SWE_2100_126_BD = SWE_means;

%% SSP585
load([dirname 'April_mean_SSP585_2015_2100_Control_hist_BD_revise2.mat']);
mean_BC_2100_585_BD = RF_BC_means;
mean_dust_2100_585_BD = RF_dust_means;
mean_AER_2100_585_BD = RF_LAP_means;
mean_SWE_2100_585_BD = SWE_means;
%% calculate mean
mean_BC_RF_hist = nanmean(mean_BC_hist(:,:,46:end),3);
mean_BC_RF_future_126 = nanmean(mean_BC_2100_126(:,:,(end-20+1):end),3);
mean_BC_RF_future_585 = nanmean(mean_BC_2100_585(:,:,(end-20+1):end),3);
mean_BC_RF_future_126_BD = nanmean(mean_BC_2100_126_BD(:,:,(end-20+1):end),3);
mean_BC_RF_future_585_BD = nanmean(mean_BC_2100_585_BD(:,:,(end-20+1):end),3);

mean_dust_RF_hist = nanmean(mean_dust_hist(:,:,46:end),3);
mean_dust_RF_future_126 = nanmean(mean_dust_2100_126(:,:,(end-20+1):end),3);
mean_dust_RF_future_585 = nanmean(mean_dust_2100_585(:,:,(end-20+1):end),3);
mean_dust_RF_future_126_BD = nanmean(mean_dust_2100_126_BD(:,:,(end-20+1):end),3);
mean_dust_RF_future_585_BD = nanmean(mean_dust_2100_585_BD(:,:,(end-20+1):end),3);

mean_AER_RF_hist = nanmean(mean_AER_hist(:,:,46:end),3);
mean_AER_RF_future_126 = nanmean(mean_AER_2100_126(:,:,(end-20+1):end),3);
mean_AER_RF_future_585 = nanmean(mean_AER_2100_585(:,:,(end-20+1):end),3);
mean_AER_RF_future_126_BD = nanmean(mean_AER_2100_126_BD(:,:,(end-20+1):end),3);
mean_AER_RF_future_585_BD = nanmean(mean_AER_2100_585_BD(:,:,(end-20+1):end),3);

mean_SWE_hist = nanmean(mean_SWE_hist(:,:,46:end),3);
mean_SWE_future_126 = nanmean(mean_SWE_2100_126(:,:,(end-20+1):end),3);
mean_SWE_future_585 = nanmean(mean_SWE_2100_585(:,:,(end-20+1):end),3);
mean_SWE_future_126_BD = nanmean(mean_SWE_2100_126_BD(:,:,(end-20+1):end),3);
mean_SWE_future_585_BD = nanmean(mean_SWE_2100_585_BD(:,:,(end-20+1):end),3);