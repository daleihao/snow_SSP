%% get hist_BD

dirname = 'C:\Users\haod776\OneDrive - PNNL\Documents\work\E3SM\writting\snow_SSP\CMIP6-data\ELM_simulations\process_code_after_LULCC\data\';


%% plot
colors =  [0.45, 0.80, 0.69;...
    0.98, 0.40, 0.35;...
    0.55, 0.60, 0.79];

res = 0.5;
lon_base = [0+res/2:res:360-res/2];
lat_base =  [90-res/2:-res:20+res/2];
[lons,lats] = meshgrid(double(lon_base),double(lat_base));

filters_TP = lats>27 & lats<42 & lons>65 & lons<105;

fliter_rows = lat_base>27 & lat_base<40;
fliter_cols = lon_base>65 & lon_base<105;


%% plot sensitivity
%% hist
load([dirname 'mean_hist_run_1950_2014_Control_revise2.mat']);

mean_BC_hist = SAR_BC_means;
mean_dust_hist = SAR_dust_means;
mean_AER_hist = SAR_LAP_means;
mean_SWE_hist = SWE_means;

tmp = nanmean(mean_SWE_hist(:,:,(end-20+1):end),3);
tmp = flipud(tmp');
filters_TP = filters_TP & (tmp>5);



%%SSP126
load([dirname 'mean_SSP126_2015_2100_Control_hist_BD_revise2.mat']);
mean_BC_2100 = SAR_BC_means;
mean_dust_2100 = SAR_dust_means;
mean_AER_2100 = SAR_LAP_means;
mean_SWE_2100 = SWE_means;


%%585

load([dirname 'mean_SSP585_2015_2100_Control_hist_BD_revise2.mat']);
mean_BC_2100_585 = SAR_BC_means;
mean_dust_2100_585 = SAR_dust_means;
mean_AER_2100_585 = SAR_LAP_means;
mean_SWE_2100_585 = SWE_means;




%% sc
%% get hist_BD

dirname = 'C:\Users\haod776\OneDrive - PNNL\Documents\work\E3SM\writting\snow_SSP\CMIP6-data\ELM_simulations\process_code_after_LULCC\data\';


%% plot
colors =  [0.45, 0.80, 0.69;...
    0.98, 0.40, 0.35;...
    0.55, 0.60, 0.79];

res = 0.5;
lon_base = [0+res/2:res:360-res/2];
lat_base =  [90-res/2:-res:20+res/2];
[lons,lats] = meshgrid(double(lon_base),double(lat_base));

filters_TP = lats>27 & lats<42 & lons>65 & lons<105;

fliter_rows = lat_base>27 & lat_base<40;
fliter_cols = lon_base>65 & lon_base<105;


%% plot sensitivity
%% hist
load([dirname 'April_mean_hist_run_1950_2014_Control_revise2.mat']);

mean_BC_hist = SC_BC_means;
mean_dust_hist = SC_dust_means;
mean_AER_hist = SAR_LAP_means;
mean_SWE_hist = SNOW_means;

tmp = nanmean(mean_SWE_hist(:,:,(end-20+1):end),3);
tmp = flipud(tmp');
filters_TP = filters_TP & (tmp>5);



load([dirname 'April_mean_SSP126_2015_2100_Control_hist_BD_revise2.mat']);
mean_BC_2100 = SC_BC_means;
mean_dust_2100 = SC_dust_means;
mean_AER_2100 = SAR_LAP_means;
mean_SWE_2100 = SNOW_means;


%%585

load([dirname 'April_mean_SSP585_2015_2100_Control_hist_BD_revise2.mat']);
mean_BC_2100_585 = SC_BC_means;
mean_dust_2100_585 = SC_dust_means;
mean_AER_2100_585 = SAR_LAP_means;
mean_SWE_2100_585 = SNOW_means;






