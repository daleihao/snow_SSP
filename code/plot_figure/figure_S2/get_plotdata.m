%% get_ELM_Data
dirname = 'C:\Users\haod776\OneDrive - PNNL\Documents\work\E3SM\writting\snow_SSP\CMIP6-data\ELM_simulations\process_code_after_LULCC\data\';

%% plot sensitivity
%% hist
load([dirname 'mean_hist_run_1950_2014_Control_revise2.mat']);

mean_BC_hist = SC_BC_means;
mean_dust_hist = SC_dust_means;
mean_SWE_hist = SWE_means;


%% SSP126
load([dirname 'mean_SSP126_2015_2100_Control_revise2.mat']);
mean_BC_2100_126 = SC_BC_means;
mean_dust_2100_126 = SC_dust_means;
mean_SWE_2100_126 = SWE_means;

%% SSP585
load([dirname 'mean_SSP585_2015_2100_Control_revise2.mat']);
mean_BC_2100_585 = SC_BC_means;
mean_dust_2100_585 = SC_dust_means;
mean_SWE_2100_585 = SWE_means;

%% calculate mean
mean_BC_SC_hist = nanmean(mean_BC_hist(:,:,46:end),3);
mean_BC_SC_future_126 = nanmean(mean_BC_2100_126(:,:,(end-20+1):end),3);
mean_BC_SC_future_585 = nanmean(mean_BC_2100_585(:,:,(end-20+1):end),3);

mean_dust_SC_hist = nanmean(mean_dust_hist(:,:,46:end),3);
mean_dust_SC_future_126 = nanmean(mean_dust_2100_126(:,:,(end-20+1):end),3);
mean_dust_SC_future_585 = nanmean(mean_dust_2100_585(:,:,(end-20+1):end),3);


%% get swe
load([dirname 'mean_hist_run_1950_2014_Control_revise2.mat']);
mean_SWE_hist = nanmean(SWE_means(:,:,46:end),3);

load([dirname 'mean_SSP126_2015_2100_Control_revise2.mat']);
mean_SWE_future_126 = nanmean(SWE_means(:,:,(end-20+1):end),3);

load([dirname 'mean_SSP585_2015_2100_Control_revise2.mat']);
mean_SWE_future_585 = nanmean(SWE_means(:,:,(end-20+1):end),3);

%% filter
mean_BC_SC_hist(mean_SWE_hist<=5) = nan;
mean_BC_SC_future_126(mean_SWE_future_126<=5) = nan;
mean_BC_SC_future_585(mean_SWE_future_585<=5) = nan;

mean_dust_SC_hist(mean_SWE_hist<=5) = nan;
mean_dust_SC_future_126(mean_SWE_future_126<=5) = nan;
mean_dust_SC_future_585(mean_SWE_future_585<=5) = nan;

mean_BC_SC_hist = mean_BC_SC_hist*1e9; % kg/m2 -> ug/m2
mean_BC_SC_future_126 = mean_BC_SC_future_126*1e9; % kg/m2 -> ug/m2
mean_BC_SC_future_585 = mean_BC_SC_future_585*1e9; % kg/m2 -> ug/m2

mean_dust_SC_hist = mean_dust_SC_hist*1e6; % kg/m2 -> ug/m2
mean_dust_SC_future_126 = mean_dust_SC_future_126*1e6; % kg/m2 -> ug/m2
mean_dust_SC_future_585 = mean_dust_SC_future_585*1e6; % kg/m2 -> ug/m2