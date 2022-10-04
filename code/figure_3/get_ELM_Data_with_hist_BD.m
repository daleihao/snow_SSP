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

mean_BC_hist = RF_BC_means;
mean_dust_hist = RF_dust_means;
mean_AER_hist = RF_LAP_means;
mean_SWE_hist = SWE_means;

tmp = nanmean(mean_SWE_hist(:,:,(end-20+1):end),3);
tmp = flipud(tmp');
filters_TP = filters_TP & (tmp>5);

load([dirname 'mean_hist_run_1950_2014_PP_revise2.mat']);
mean_BC_hist_PP = RF_BC_means;
mean_dust_hist_PP = RF_dust_means;
mean_AER_hist_PP = RF_LAP_means;
mean_SWE_hist_PP = SWE_means;

load([dirname 'mean_hist_run_1950_2014_Koch_revise2.mat']);
mean_BC_hist_Koch = RF_BC_means;
mean_dust_hist_Koch = RF_dust_means;
mean_AER_hist_Koch = RF_LAP_means;
mean_SWE_hist_Koch = SWE_means;


load([dirname 'mean_hist_run_1950_2014_extBC_revise2.mat']);
mean_BC_hist_extBC = RF_BC_means;
mean_dust_hist_extBC = RF_dust_means;
mean_AER_hist_extBC = RF_LAP_means;
mean_SWE_hist_extBC = SWE_means;

load([dirname 'mean_hist_run_1950_2014_intDust_revise2.mat']);
mean_BC_hist_intDust = RF_BC_means;
mean_dust_hist_intDust = RF_dust_means;
mean_AER_hist_intDust = RF_LAP_means;
mean_SWE_hist_intDust = SWE_means;

load([dirname 'mean_hist_run_1950_2014_noLULCC_revise2.mat']);
mean_BC_hist_noLULC = RF_BC_means;
mean_dust_hist_noLULC = RF_dust_means;
mean_AER_hist_noLULC = RF_LAP_means;
mean_SWE_hist_noLULC = SWE_means;


load([dirname 'mean_hist_run_1950_2014_MSE_2_revise2.mat']);
mean_BC_hist_MSE_2 = RF_BC_means;
mean_dust_hist_MSE_2 = RF_dust_means;
mean_AER_hist_MSE_2 = RF_LAP_means;
mean_SWE_hist_MSE_2 = SWE_means;

load([dirname 'mean_hist_run_1950_2014_MSE_0_02_revise2.mat']);
mean_BC_hist_MSE_0_02 = RF_BC_means;
mean_dust_hist_MSE_0_02 = RF_dust_means;
mean_AER_hist_MSE_0_02 = RF_LAP_means;
mean_SWE_hist_MSE_0_02 = SWE_means;


%% SSP126
load([dirname 'mean_SSP126_2015_2100_Control_hist_BD_revise2.mat']);
mean_BC_2100 = RF_BC_means;
mean_dust_2100 = RF_dust_means;
mean_AER_2100 = RF_LAP_means;
mean_SWE_2100 = SWE_means;


load([dirname 'mean_SSP126_2015_2100_PP_hist_BD_revise2.mat']);
mean_BC_2100_PP = RF_BC_means;
mean_dust_2100_PP = RF_dust_means;
mean_AER_2100_PP = RF_LAP_means;
mean_SWE_2100_PP = SWE_means;

load([dirname 'mean_SSP126_2015_2100_Koch_hist_BD_revise2.mat']);
mean_BC_2100_Koch = RF_BC_means;
mean_dust_2100_Koch = RF_dust_means;
mean_AER_2100_Koch = RF_LAP_means;
mean_SWE_2100_Koch = SWE_means;


load([dirname 'mean_SSP126_2015_2100_extBC_hist_BD_revise2.mat']);
mean_BC_2100_extBC = RF_BC_means;
mean_dust_2100_extBC = RF_dust_means;
mean_AER_2100_extBC = RF_LAP_means;
mean_SWE_2100_extBC = SWE_means;

load([dirname 'mean_SSP126_2015_2100_intDust_hist_BD_revise2.mat']);
mean_BC_2100_intDust = RF_BC_means;
mean_dust_2100_intDust = RF_dust_means;
mean_AER_2100_intDust = RF_LAP_means;
mean_SWE_2100_intDust = SWE_means;

load([dirname 'mean_SSP126_2015_2100_noLULCC_hist_BD_revise2.mat']);
mean_BC_2100_noLULC = RF_BC_means;
mean_dust_2100_noLULC = RF_dust_means;
mean_AER_2100_noLULC = RF_LAP_means;
mean_SWE_2100_noLULC = SWE_means;

load([dirname 'mean_SSP126_2015_2100_MSE_2_hist_BD_revise2.mat']);
mean_BC_2100_MSE_2 = RF_BC_means;
mean_dust_2100_MSE_2 = RF_dust_means;
mean_AER_2100_MSE_2 = RF_LAP_means;
mean_SWE_2100_MSE_2 = SWE_means;

load([dirname 'mean_SSP126_2015_2100_MSE_0_02_hist_BD_revise2.mat']);
mean_BC_2100_MSE_0_02 = RF_BC_means;
mean_dust_2100_MSE_0_02 = RF_dust_means;
mean_AER_2100_MSE_0_02 = RF_LAP_means;
mean_SWE_2100_MSE_0_02 = SWE_means;

%%585

load([dirname 'mean_SSP585_2015_2100_Control_hist_BD_revise2.mat']);
mean_BC_2100_585 = RF_BC_means;
mean_dust_2100_585 = RF_dust_means;
mean_AER_2100_585 = RF_LAP_means;
mean_SWE_2100_585 = SWE_means;


load([dirname 'mean_SSP585_2015_2100_PP_hist_BD_revise2.mat']);
mean_BC_2100_585_PP = RF_BC_means;
mean_dust_2100_585_PP = RF_dust_means;
mean_AER_2100_585_PP = RF_LAP_means;
mean_SWE_2100_585_PP = SWE_means;

load([dirname 'mean_SSP585_2015_2100_Koch_hist_BD_revise2.mat']);
mean_BC_2100_585_Koch = RF_BC_means;
mean_dust_2100_585_Koch = RF_dust_means;
mean_AER_2100_585_Koch = RF_LAP_means;
mean_SWE_2100_585_Koch = SWE_means;


load([dirname 'mean_SSP585_2015_2100_extBC_hist_BD_revise2.mat']);
mean_BC_2100_585_extBC = RF_BC_means;
mean_dust_2100_585_extBC = RF_dust_means;
mean_AER_2100_585_extBC = RF_LAP_means;
mean_SWE_2100_585_extBC = SWE_means;

load([dirname 'mean_SSP585_2015_2100_intDust_hist_BD_revise2.mat']);
mean_BC_2100_585_intDust = RF_BC_means;
mean_dust_2100_585_intDust = RF_dust_means;
mean_AER_2100_585_intDust = RF_LAP_means;
mean_SWE_2100_585_intDust = SWE_means;

load([dirname 'mean_SSP585_2015_2100_noLULCC_hist_BD_revise2.mat']);
mean_BC_2100_585_noLULC = RF_BC_means;
mean_dust_2100_585_noLULC = RF_dust_means;
mean_AER_2100_585_noLULC = RF_LAP_means;
mean_SWE_2100_585_noLULC = SWE_means;

load([dirname 'mean_SSP585_2015_2100_MSE_2_hist_BD_revise2.mat']);
mean_BC_2100_585_MSE_2 = RF_BC_means;
mean_dust_2100_585_MSE_2 = RF_dust_means;
mean_AER_2100_585_MSE_2 = RF_LAP_means;
mean_SWE_2100_585_MSE_2 = SWE_means;

load([dirname 'mean_SSP585_2015_2100_MSE_0_02_hist_BD_revise2.mat']);
mean_BC_2100_585_MSE_0_02 = RF_BC_means;
mean_dust_2100_585_MSE_0_02 = RF_dust_means;
mean_AER_2100_585_MSE_0_02 = RF_LAP_means;
mean_SWE_2100_585_MSE_0_02 = SWE_means;


%% calculate area
lon_base = [0+res/2:res:360-res/2];
lat_base =  [90-res/2:-res:20+res/2];
[lons,lats] = meshgrid(double(lon_base),double(lat_base));
radius = 6378137;
res_lat = 0.5;
res_lon = 0.5;
height = radius * res_lat*pi/180;
width2 = radius*(cos((lats-res_lat/2)*pi/180)+cos((lats+res_lat/2)*pi/180))/2 * res_lon*pi/180;
Areas = width2.*height/1e6;



% %% get time series SWE
% mean_TPs_SWE_PP_SSP126 = [];
% mean_TPs_SWE_Control_SSP126 = [];
% mean_TPs_SWE_Koch_SSP126 = [];
% mean_TPs_SWE_extBC_SSP126 = [];
% mean_TPs_SWE_intDust_SSP126 = [];
% mean_TPs_SWE_noLULC_SSP126 = [];
% mean_TPs_SWE_MSE_2_SSP126 = [];
% mean_TPs_SWE_MSE_0_02_SSP126 = [];
% 
% mean_TPs_SWE_PP_SSP585 = [];
% mean_TPs_SWE_Control_SSP585 = [];
% mean_TPs_SWE_Koch_SSP585 = [];
% mean_TPs_SWE_extBC_SSP585 = [];
% mean_TPs_SWE_intDust_SSP585 = [];
% mean_TPs_SWE_noLULC_SSP585 = [];
% mean_TPs_SWE_MSE_2_SSP585 = [];
% mean_TPs_SWE_MSE_0_02_SSP585 = [];
% 
% for i = 1:65
%     
%     mean_SWE_hist_i = squeeze(mean_SWE_hist(:,:,i));
%     mean_SWE_hist_PP_i = squeeze(mean_SWE_hist_PP(:,:,i));
%     mean_SWE_hist_Koch_i = squeeze(mean_SWE_hist_Koch(:,:,i));
%     mean_SWE_hist_extBC_i = squeeze(mean_SWE_hist_extBC(:,:,i));
%     mean_SWE_hist_intDust_i = squeeze(mean_SWE_hist_intDust(:,:,i));
%     mean_SWE_hist_noLULC_i = squeeze(mean_SWE_hist_noLULC(:,:,i));
%     mean_SWE_hist_MSE_2_i = squeeze(mean_SWE_hist_MSE_2(:,:,i));
%     mean_SWE_hist_MSE_0_02_i = squeeze(mean_SWE_hist_MSE_0_02(:,:,i));
%     
%     mean_SWE_hist_i = flipud(mean_SWE_hist_i');
%     mean_SWE_hist_PP_i = flipud(mean_SWE_hist_PP_i');
%     mean_SWE_hist_Koch_i = flipud(mean_SWE_hist_Koch_i');
%     mean_SWE_hist_extBC_i = flipud(mean_SWE_hist_extBC_i');
%     mean_SWE_hist_intDust_i = flipud(mean_SWE_hist_intDust_i');
%     mean_SWE_hist_noLULC_i = flipud(mean_SWE_hist_noLULC_i');
%     mean_SWE_hist_MSE_2_i = flipud(mean_SWE_hist_MSE_2_i');
%     mean_SWE_hist_MSE_0_02_i = flipud(mean_SWE_hist_MSE_0_02_i');
%     
%     mean_TPs_SWE_Control_SSP126 = [mean_TPs_SWE_Control_SSP126  nansum(mean_SWE_hist_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
%     mean_TPs_SWE_PP_SSP126 = [mean_TPs_SWE_PP_SSP126  nansum(mean_SWE_hist_PP_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
%     mean_TPs_SWE_Koch_SSP126 = [mean_TPs_SWE_Koch_SSP126  nansum(mean_SWE_hist_Koch_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
%     mean_TPs_SWE_extBC_SSP126 = [mean_TPs_SWE_extBC_SSP126  nansum(mean_SWE_hist_extBC_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
%     mean_TPs_SWE_intDust_SSP126 = [mean_TPs_SWE_intDust_SSP126  nansum(mean_SWE_hist_intDust_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
%     mean_TPs_SWE_noLULC_SSP126 = [mean_TPs_SWE_noLULC_SSP126  nansum(mean_SWE_hist_noLULC_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
%     mean_TPs_SWE_MSE_2_SSP126 = [mean_TPs_SWE_MSE_2_SSP126  nansum(mean_SWE_hist_MSE_2_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
%     mean_TPs_SWE_MSE_0_02_SSP126 = [mean_TPs_SWE_MSE_0_02_SSP126  nansum(mean_SWE_hist_MSE_0_02_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
%     
%     mean_TPs_SWE_Control_SSP585 = [mean_TPs_SWE_Control_SSP585  nansum(mean_SWE_hist_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
%     mean_TPs_SWE_PP_SSP585 = [mean_TPs_SWE_PP_SSP585  nansum(mean_SWE_hist_PP_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
%     mean_TPs_SWE_Koch_SSP585 = [mean_TPs_SWE_Koch_SSP585  nansum(mean_SWE_hist_Koch_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
%     mean_TPs_SWE_extBC_SSP585 = [mean_TPs_SWE_extBC_SSP585  nansum(mean_SWE_hist_extBC_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
%     mean_TPs_SWE_intDust_SSP585 = [mean_TPs_SWE_intDust_SSP585  nansum(mean_SWE_hist_intDust_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
%     mean_TPs_SWE_noLULC_SSP585 = [mean_TPs_SWE_noLULC_SSP585  nansum(mean_SWE_hist_noLULC_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
%     mean_TPs_SWE_MSE_2_SSP585 = [mean_TPs_SWE_MSE_2_SSP585  nansum(mean_SWE_hist_MSE_2_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
%     mean_TPs_SWE_MSE_0_02_SSP585 = [mean_TPs_SWE_MSE_0_02_SSP585  nansum(mean_SWE_hist_MSE_0_02_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
%     
% end
% 
% for i = 1:86
%     
%     mean_SWE_2100_i = squeeze(mean_SWE_2100(:,:,i));
%     mean_SWE_2100_PP_i = squeeze(mean_SWE_2100_PP(:,:,i));
%     mean_SWE_2100_Koch_i = squeeze(mean_SWE_2100_Koch(:,:,i));
%     mean_SWE_2100_extBC_i = squeeze(mean_SWE_2100_extBC(:,:,i));
%     mean_SWE_2100_intDust_i = squeeze(mean_SWE_2100_intDust(:,:,i));
%     mean_SWE_2100_noLULC_i = squeeze(mean_SWE_2100_noLULC(:,:,i));
%     mean_SWE_2100_MSE_2_i = squeeze(mean_SWE_2100_MSE_2(:,:,i));
%     mean_SWE_2100_MSE_0_02_i = squeeze(mean_SWE_2100_MSE_0_02(:,:,i));
%     
%     mean_SWE_2100_585_i = squeeze(mean_SWE_2100_585(:,:,i));
%     mean_SWE_2100_585_PP_i = squeeze(mean_SWE_2100_585_PP(:,:,i));
%     mean_SWE_2100_585_Koch_i = squeeze(mean_SWE_2100_585_Koch(:,:,i));
%     mean_SWE_2100_585_extBC_i = squeeze(mean_SWE_2100_585_extBC(:,:,i));
%     mean_SWE_2100_585_intDust_i = squeeze(mean_SWE_2100_585_intDust(:,:,i));
%     mean_SWE_2100_585_noLULC_i = squeeze(mean_SWE_2100_585_noLULC(:,:,i));
%     mean_SWE_2100_585_MSE_2_i = squeeze(mean_SWE_2100_585_MSE_2(:,:,i));
%     mean_SWE_2100_585_MSE_0_02_i = squeeze(mean_SWE_2100_585_MSE_0_02(:,:,i));
%     
%     mean_SWE_2100_i = flipud(mean_SWE_2100_i');
%     mean_SWE_2100_PP_i = flipud(mean_SWE_2100_PP_i');
%     mean_SWE_2100_Koch_i = flipud(mean_SWE_2100_Koch_i');
%     mean_SWE_2100_extBC_i = flipud(mean_SWE_2100_extBC_i');
%     mean_SWE_2100_intDust_i = flipud(mean_SWE_2100_intDust_i');
%     mean_SWE_2100_noLULC_i = flipud(mean_SWE_2100_noLULC_i');
%     mean_SWE_2100_MSE_2_i = flipud(mean_SWE_2100_MSE_2_i');
%     mean_SWE_2100_MSE_0_02_i = flipud(mean_SWE_2100_MSE_0_02_i');
%     
%     mean_SWE_2100_585_i = flipud(mean_SWE_2100_585_i');
%     mean_SWE_2100_585_PP_i = flipud(mean_SWE_2100_585_PP_i');
%     mean_SWE_2100_585_Koch_i = flipud(mean_SWE_2100_585_Koch_i');
%     mean_SWE_2100_585_extBC_i = flipud(mean_SWE_2100_585_extBC_i');
%     mean_SWE_2100_585_intDust_i = flipud(mean_SWE_2100_585_intDust_i');
%     mean_SWE_2100_585_noLULC_i = flipud(mean_SWE_2100_585_noLULC_i');
%     mean_SWE_2100_585_MSE_2_i = flipud(mean_SWE_2100_585_MSE_2_i');
%     mean_SWE_2100_585_MSE_0_02_i = flipud(mean_SWE_2100_585_MSE_0_02_i');
%     
%     
%     mean_TPs_SWE_Control_SSP126 = [mean_TPs_SWE_Control_SSP126  nansum(mean_SWE_2100_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
%     mean_TPs_SWE_PP_SSP126 = [mean_TPs_SWE_PP_SSP126  nansum(mean_SWE_2100_PP_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
%     mean_TPs_SWE_Koch_SSP126 = [mean_TPs_SWE_Koch_SSP126  nansum(mean_SWE_2100_Koch_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
%     mean_TPs_SWE_extBC_SSP126 = [mean_TPs_SWE_extBC_SSP126  nansum(mean_SWE_2100_extBC_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
%     mean_TPs_SWE_intDust_SSP126 = [mean_TPs_SWE_intDust_SSP126  nansum(mean_SWE_2100_intDust_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
%     mean_TPs_SWE_noLULC_SSP126 = [mean_TPs_SWE_noLULC_SSP126  nansum(mean_SWE_2100_noLULC_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
%     mean_TPs_SWE_MSE_2_SSP126 = [mean_TPs_SWE_MSE_2_SSP126  nansum(mean_SWE_2100_MSE_2_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
%     mean_TPs_SWE_MSE_0_02_SSP126 = [mean_TPs_SWE_MSE_0_02_SSP126  nansum(mean_SWE_2100_MSE_0_02_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
%     
%     mean_TPs_SWE_Control_SSP585 = [mean_TPs_SWE_Control_SSP585  nansum(mean_SWE_2100_585_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
%     mean_TPs_SWE_PP_SSP585 = [mean_TPs_SWE_PP_SSP585  nansum(mean_SWE_2100_585_PP_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
%     mean_TPs_SWE_Koch_SSP585 = [mean_TPs_SWE_Koch_SSP585  nansum(mean_SWE_2100_585_Koch_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
%     mean_TPs_SWE_extBC_SSP585 = [mean_TPs_SWE_extBC_SSP585  nansum(mean_SWE_2100_585_extBC_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
%     mean_TPs_SWE_intDust_SSP585 = [mean_TPs_SWE_intDust_SSP585  nansum(mean_SWE_2100_585_intDust_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
%     mean_TPs_SWE_noLULC_SSP585 = [mean_TPs_SWE_noLULC_SSP585  nansum(mean_SWE_2100_585_noLULC_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
%     mean_TPs_SWE_MSE_2_SSP585 = [mean_TPs_SWE_MSE_2_SSP585  nansum(mean_SWE_2100_585_MSE_2_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
%     mean_TPs_SWE_MSE_0_02_SSP585 = [mean_TPs_SWE_MSE_0_02_SSP585  nansum(mean_SWE_2100_585_MSE_0_02_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
% end




%% get time series BC
mean_TPs_BC_PP_SSP126 = [];
mean_TPs_BC_Control_SSP126 = [];
mean_TPs_BC_Koch_SSP126 = [];
mean_TPs_BC_extBC_SSP126 = [];
mean_TPs_BC_intDust_SSP126 = [];
mean_TPs_BC_noLULC_SSP126 = [];
mean_TPs_BC_MSE_2_SSP126 = [];
mean_TPs_BC_MSE_0_02_SSP126 = [];

mean_TPs_BC_PP_SSP585 = [];
mean_TPs_BC_Control_SSP585 = [];
mean_TPs_BC_Koch_SSP585 = [];
mean_TPs_BC_extBC_SSP585 = [];
mean_TPs_BC_intDust_SSP585 = [];
mean_TPs_BC_noLULC_SSP585 = [];
mean_TPs_BC_MSE_2_SSP585 = [];
mean_TPs_BC_MSE_0_02_SSP585 = [];

for i = 1:65
    
    mean_BC_hist_i = squeeze(mean_BC_hist(:,:,i));
    mean_BC_hist_PP_i = squeeze(mean_BC_hist_PP(:,:,i));
    mean_BC_hist_Koch_i = squeeze(mean_BC_hist_Koch(:,:,i));
    mean_BC_hist_extBC_i = squeeze(mean_BC_hist_extBC(:,:,i));
    mean_BC_hist_intDust_i = squeeze(mean_BC_hist_intDust(:,:,i));
    mean_BC_hist_noLULC_i = squeeze(mean_BC_hist_noLULC(:,:,i));
    mean_BC_hist_MSE_2_i = squeeze(mean_BC_hist_MSE_2(:,:,i));
    mean_BC_hist_MSE_0_02_i = squeeze(mean_BC_hist_MSE_0_02(:,:,i));
    
    mean_BC_hist_i = flipud(mean_BC_hist_i');
    mean_BC_hist_PP_i = flipud(mean_BC_hist_PP_i');
    mean_BC_hist_Koch_i = flipud(mean_BC_hist_Koch_i');
    mean_BC_hist_extBC_i = flipud(mean_BC_hist_extBC_i');
    mean_BC_hist_intDust_i = flipud(mean_BC_hist_intDust_i');
    mean_BC_hist_noLULC_i = flipud(mean_BC_hist_noLULC_i');
    mean_BC_hist_MSE_2_i = flipud(mean_BC_hist_MSE_2_i');
    mean_BC_hist_MSE_0_02_i = flipud(mean_BC_hist_MSE_0_02_i');
    
    mean_TPs_BC_Control_SSP126 = [mean_TPs_BC_Control_SSP126  nansum(mean_BC_hist_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
    mean_TPs_BC_PP_SSP126 = [mean_TPs_BC_PP_SSP126  nansum(mean_BC_hist_PP_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
    mean_TPs_BC_Koch_SSP126 = [mean_TPs_BC_Koch_SSP126  nansum(mean_BC_hist_Koch_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
    mean_TPs_BC_extBC_SSP126 = [mean_TPs_BC_extBC_SSP126  nansum(mean_BC_hist_extBC_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
    mean_TPs_BC_intDust_SSP126 = [mean_TPs_BC_intDust_SSP126  nansum(mean_BC_hist_intDust_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
    mean_TPs_BC_noLULC_SSP126 = [mean_TPs_BC_noLULC_SSP126  nansum(mean_BC_hist_noLULC_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
    mean_TPs_BC_MSE_2_SSP126 = [mean_TPs_BC_MSE_2_SSP126  nansum(mean_BC_hist_MSE_2_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
    mean_TPs_BC_MSE_0_02_SSP126 = [mean_TPs_BC_MSE_0_02_SSP126  nansum(mean_BC_hist_MSE_0_02_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
    
    mean_TPs_BC_Control_SSP585 = [mean_TPs_BC_Control_SSP585  nansum(mean_BC_hist_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
    mean_TPs_BC_PP_SSP585 = [mean_TPs_BC_PP_SSP585  nansum(mean_BC_hist_PP_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
    mean_TPs_BC_Koch_SSP585 = [mean_TPs_BC_Koch_SSP585  nansum(mean_BC_hist_Koch_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
    mean_TPs_BC_extBC_SSP585 = [mean_TPs_BC_extBC_SSP585  nansum(mean_BC_hist_extBC_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
    mean_TPs_BC_intDust_SSP585 = [mean_TPs_BC_intDust_SSP585  nansum(mean_BC_hist_intDust_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
    mean_TPs_BC_noLULC_SSP585 = [mean_TPs_BC_noLULC_SSP585  nansum(mean_BC_hist_noLULC_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
    mean_TPs_BC_MSE_2_SSP585 = [mean_TPs_BC_MSE_2_SSP585  nansum(mean_BC_hist_MSE_2_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
    mean_TPs_BC_MSE_0_02_SSP585 = [mean_TPs_BC_MSE_0_02_SSP585  nansum(mean_BC_hist_MSE_0_02_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
    
end

for i = 1:86
    
    mean_BC_2100_i = squeeze(mean_BC_2100(:,:,i));
    mean_BC_2100_PP_i = squeeze(mean_BC_2100_PP(:,:,i));
    mean_BC_2100_Koch_i = squeeze(mean_BC_2100_Koch(:,:,i));
    mean_BC_2100_extBC_i = squeeze(mean_BC_2100_extBC(:,:,i));
    mean_BC_2100_intDust_i = squeeze(mean_BC_2100_intDust(:,:,i));
    mean_BC_2100_noLULC_i = squeeze(mean_BC_2100_noLULC(:,:,i));
    mean_BC_2100_MSE_2_i = squeeze(mean_BC_2100_MSE_2(:,:,i));
    mean_BC_2100_MSE_0_02_i = squeeze(mean_BC_2100_MSE_0_02(:,:,i));
    
    mean_BC_2100_585_i = squeeze(mean_BC_2100_585(:,:,i));
    mean_BC_2100_585_PP_i = squeeze(mean_BC_2100_585_PP(:,:,i));
    mean_BC_2100_585_Koch_i = squeeze(mean_BC_2100_585_Koch(:,:,i));
    mean_BC_2100_585_extBC_i = squeeze(mean_BC_2100_585_extBC(:,:,i));
    mean_BC_2100_585_intDust_i = squeeze(mean_BC_2100_585_intDust(:,:,i));
    mean_BC_2100_585_noLULC_i = squeeze(mean_BC_2100_585_noLULC(:,:,i));
    mean_BC_2100_585_MSE_2_i = squeeze(mean_BC_2100_585_MSE_2(:,:,i));
    mean_BC_2100_585_MSE_0_02_i = squeeze(mean_BC_2100_585_MSE_0_02(:,:,i));
    
    mean_BC_2100_i = flipud(mean_BC_2100_i');
    mean_BC_2100_PP_i = flipud(mean_BC_2100_PP_i');
    mean_BC_2100_Koch_i = flipud(mean_BC_2100_Koch_i');
    mean_BC_2100_extBC_i = flipud(mean_BC_2100_extBC_i');
    mean_BC_2100_intDust_i = flipud(mean_BC_2100_intDust_i');
    mean_BC_2100_noLULC_i = flipud(mean_BC_2100_noLULC_i');
    mean_BC_2100_MSE_2_i = flipud(mean_BC_2100_MSE_2_i');
    mean_BC_2100_MSE_0_02_i = flipud(mean_BC_2100_MSE_0_02_i');
    
    mean_BC_2100_585_i = flipud(mean_BC_2100_585_i');
    mean_BC_2100_585_PP_i = flipud(mean_BC_2100_585_PP_i');
    mean_BC_2100_585_Koch_i = flipud(mean_BC_2100_585_Koch_i');
    mean_BC_2100_585_extBC_i = flipud(mean_BC_2100_585_extBC_i');
    mean_BC_2100_585_intDust_i = flipud(mean_BC_2100_585_intDust_i');
    mean_BC_2100_585_noLULC_i = flipud(mean_BC_2100_585_noLULC_i');
    mean_BC_2100_585_MSE_2_i = flipud(mean_BC_2100_585_MSE_2_i');
    mean_BC_2100_585_MSE_0_02_i = flipud(mean_BC_2100_585_MSE_0_02_i');
    
    
    mean_TPs_BC_Control_SSP126 = [mean_TPs_BC_Control_SSP126  nansum(mean_BC_2100_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
    mean_TPs_BC_PP_SSP126 = [mean_TPs_BC_PP_SSP126  nansum(mean_BC_2100_PP_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
    mean_TPs_BC_Koch_SSP126 = [mean_TPs_BC_Koch_SSP126  nansum(mean_BC_2100_Koch_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
    mean_TPs_BC_extBC_SSP126 = [mean_TPs_BC_extBC_SSP126  nansum(mean_BC_2100_extBC_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
    mean_TPs_BC_intDust_SSP126 = [mean_TPs_BC_intDust_SSP126  nansum(mean_BC_2100_intDust_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
    mean_TPs_BC_noLULC_SSP126 = [mean_TPs_BC_noLULC_SSP126  nansum(mean_BC_2100_noLULC_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
    mean_TPs_BC_MSE_2_SSP126 = [mean_TPs_BC_MSE_2_SSP126  nansum(mean_BC_2100_MSE_2_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
    mean_TPs_BC_MSE_0_02_SSP126 = [mean_TPs_BC_MSE_0_02_SSP126  nansum(mean_BC_2100_MSE_0_02_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
    
    mean_TPs_BC_Control_SSP585 = [mean_TPs_BC_Control_SSP585  nansum(mean_BC_2100_585_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
    mean_TPs_BC_PP_SSP585 = [mean_TPs_BC_PP_SSP585  nansum(mean_BC_2100_585_PP_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
    mean_TPs_BC_Koch_SSP585 = [mean_TPs_BC_Koch_SSP585  nansum(mean_BC_2100_585_Koch_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
    mean_TPs_BC_extBC_SSP585 = [mean_TPs_BC_extBC_SSP585  nansum(mean_BC_2100_585_extBC_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
    mean_TPs_BC_intDust_SSP585 = [mean_TPs_BC_intDust_SSP585  nansum(mean_BC_2100_585_intDust_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
    mean_TPs_BC_noLULC_SSP585 = [mean_TPs_BC_noLULC_SSP585  nansum(mean_BC_2100_585_noLULC_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
    mean_TPs_BC_MSE_2_SSP585 = [mean_TPs_BC_MSE_2_SSP585  nansum(mean_BC_2100_585_MSE_2_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
    mean_TPs_BC_MSE_0_02_SSP585 = [mean_TPs_BC_MSE_0_02_SSP585  nansum(mean_BC_2100_585_MSE_0_02_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
    
end






%% get time series dust
mean_TPs_dust_PP_SSP126 = [];
mean_TPs_dust_Control_SSP126 = [];
mean_TPs_dust_Koch_SSP126 = [];
mean_TPs_dust_extBC_SSP126 = [];
mean_TPs_dust_intDust_SSP126 = [];
mean_TPs_dust_noLULC_SSP126 = [];
mean_TPs_dust_MSE_2_SSP126 = [];
mean_TPs_dust_MSE_0_02_SSP126 = [];

mean_TPs_dust_PP_SSP585 = [];
mean_TPs_dust_Control_SSP585 = [];
mean_TPs_dust_Koch_SSP585 = [];
mean_TPs_dust_extBC_SSP585 = [];
mean_TPs_dust_intDust_SSP585 = [];
mean_TPs_dust_noLULC_SSP585 = [];
mean_TPs_dust_MSE_2_SSP585 = [];
mean_TPs_dust_MSE_0_02_SSP585 = [];

for i = 1:65
    
    mean_dust_hist_i = squeeze(mean_dust_hist(:,:,i));
    mean_dust_hist_PP_i = squeeze(mean_dust_hist_PP(:,:,i));
    mean_dust_hist_Koch_i = squeeze(mean_dust_hist_Koch(:,:,i));
    mean_dust_hist_extBC_i = squeeze(mean_dust_hist_extBC(:,:,i));
    mean_dust_hist_intDust_i = squeeze(mean_dust_hist_intDust(:,:,i));
    mean_dust_hist_noLULC_i = squeeze(mean_dust_hist_noLULC(:,:,i));
    mean_dust_hist_MSE_2_i = squeeze(mean_dust_hist_MSE_2(:,:,i));
    mean_dust_hist_MSE_0_02_i = squeeze(mean_dust_hist_MSE_0_02(:,:,i));
    
    mean_dust_hist_i = flipud(mean_dust_hist_i');
    mean_dust_hist_PP_i = flipud(mean_dust_hist_PP_i');
    mean_dust_hist_Koch_i = flipud(mean_dust_hist_Koch_i');
    mean_dust_hist_extBC_i = flipud(mean_dust_hist_extBC_i');
    mean_dust_hist_intDust_i = flipud(mean_dust_hist_intDust_i');
    mean_dust_hist_noLULC_i = flipud(mean_dust_hist_noLULC_i');
    mean_dust_hist_MSE_2_i = flipud(mean_dust_hist_MSE_2_i');
    mean_dust_hist_MSE_0_02_i = flipud(mean_dust_hist_MSE_0_02_i');
    
    mean_TPs_dust_Control_SSP126 = [mean_TPs_dust_Control_SSP126  nansum(mean_dust_hist_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
    mean_TPs_dust_PP_SSP126 = [mean_TPs_dust_PP_SSP126  nansum(mean_dust_hist_PP_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
    mean_TPs_dust_Koch_SSP126 = [mean_TPs_dust_Koch_SSP126  nansum(mean_dust_hist_Koch_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
    mean_TPs_dust_extBC_SSP126 = [mean_TPs_dust_extBC_SSP126  nansum(mean_dust_hist_extBC_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
    mean_TPs_dust_intDust_SSP126 = [mean_TPs_dust_intDust_SSP126  nansum(mean_dust_hist_intDust_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
    mean_TPs_dust_noLULC_SSP126 = [mean_TPs_dust_noLULC_SSP126  nansum(mean_dust_hist_noLULC_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
    mean_TPs_dust_MSE_2_SSP126 = [mean_TPs_dust_MSE_2_SSP126  nansum(mean_dust_hist_MSE_2_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
    mean_TPs_dust_MSE_0_02_SSP126 = [mean_TPs_dust_MSE_0_02_SSP126  nansum(mean_dust_hist_MSE_0_02_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
    
    mean_TPs_dust_Control_SSP585 = [mean_TPs_dust_Control_SSP585  nansum(mean_dust_hist_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
    mean_TPs_dust_PP_SSP585 = [mean_TPs_dust_PP_SSP585  nansum(mean_dust_hist_PP_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
    mean_TPs_dust_Koch_SSP585 = [mean_TPs_dust_Koch_SSP585  nansum(mean_dust_hist_Koch_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
    mean_TPs_dust_extBC_SSP585 = [mean_TPs_dust_extBC_SSP585  nansum(mean_dust_hist_extBC_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
    mean_TPs_dust_intDust_SSP585 = [mean_TPs_dust_intDust_SSP585  nansum(mean_dust_hist_intDust_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
    mean_TPs_dust_noLULC_SSP585 = [mean_TPs_dust_noLULC_SSP585  nansum(mean_dust_hist_noLULC_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
    mean_TPs_dust_MSE_2_SSP585 = [mean_TPs_dust_MSE_2_SSP585  nansum(mean_dust_hist_MSE_2_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
    mean_TPs_dust_MSE_0_02_SSP585 = [mean_TPs_dust_MSE_0_02_SSP585  nansum(mean_dust_hist_MSE_0_02_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
    
end

for i = 1:86
    
    mean_dust_2100_i = squeeze(mean_dust_2100(:,:,i));
    mean_dust_2100_PP_i = squeeze(mean_dust_2100_PP(:,:,i));
    mean_dust_2100_Koch_i = squeeze(mean_dust_2100_Koch(:,:,i));
    mean_dust_2100_extBC_i = squeeze(mean_dust_2100_extBC(:,:,i));
    mean_dust_2100_intDust_i = squeeze(mean_dust_2100_intDust(:,:,i));
    mean_dust_2100_noLULC_i = squeeze(mean_dust_2100_noLULC(:,:,i));
    mean_dust_2100_MSE_2_i = squeeze(mean_dust_2100_MSE_2(:,:,i));
    mean_dust_2100_MSE_0_02_i = squeeze(mean_dust_2100_MSE_0_02(:,:,i));
    
    mean_dust_2100_585_i = squeeze(mean_dust_2100_585(:,:,i));
    mean_dust_2100_585_PP_i = squeeze(mean_dust_2100_585_PP(:,:,i));
    mean_dust_2100_585_Koch_i = squeeze(mean_dust_2100_585_Koch(:,:,i));
    mean_dust_2100_585_extBC_i = squeeze(mean_dust_2100_585_extBC(:,:,i));
    mean_dust_2100_585_intDust_i = squeeze(mean_dust_2100_585_intDust(:,:,i));
    mean_dust_2100_585_noLULC_i = squeeze(mean_dust_2100_585_noLULC(:,:,i));
    mean_dust_2100_585_MSE_2_i = squeeze(mean_dust_2100_585_MSE_2(:,:,i));
    mean_dust_2100_585_MSE_0_02_i = squeeze(mean_dust_2100_585_MSE_0_02(:,:,i));
    
    mean_dust_2100_i = flipud(mean_dust_2100_i');
    mean_dust_2100_PP_i = flipud(mean_dust_2100_PP_i');
    mean_dust_2100_Koch_i = flipud(mean_dust_2100_Koch_i');
    mean_dust_2100_extBC_i = flipud(mean_dust_2100_extBC_i');
    mean_dust_2100_intDust_i = flipud(mean_dust_2100_intDust_i');
    mean_dust_2100_noLULC_i = flipud(mean_dust_2100_noLULC_i');
    mean_dust_2100_MSE_2_i = flipud(mean_dust_2100_MSE_2_i');
    mean_dust_2100_MSE_0_02_i = flipud(mean_dust_2100_MSE_0_02_i');
    
    mean_dust_2100_585_i = flipud(mean_dust_2100_585_i');
    mean_dust_2100_585_PP_i = flipud(mean_dust_2100_585_PP_i');
    mean_dust_2100_585_Koch_i = flipud(mean_dust_2100_585_Koch_i');
    mean_dust_2100_585_extBC_i = flipud(mean_dust_2100_585_extBC_i');
    mean_dust_2100_585_intDust_i = flipud(mean_dust_2100_585_intDust_i');
    mean_dust_2100_585_noLULC_i = flipud(mean_dust_2100_585_noLULC_i');
    mean_dust_2100_585_MSE_2_i = flipud(mean_dust_2100_585_MSE_2_i');
    mean_dust_2100_585_MSE_0_02_i = flipud(mean_dust_2100_585_MSE_0_02_i');
    
    
    mean_TPs_dust_Control_SSP126 = [mean_TPs_dust_Control_SSP126  nansum(mean_dust_2100_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
    mean_TPs_dust_PP_SSP126 = [mean_TPs_dust_PP_SSP126  nansum(mean_dust_2100_PP_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
    mean_TPs_dust_Koch_SSP126 = [mean_TPs_dust_Koch_SSP126  nansum(mean_dust_2100_Koch_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
    mean_TPs_dust_extBC_SSP126 = [mean_TPs_dust_extBC_SSP126  nansum(mean_dust_2100_extBC_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
    mean_TPs_dust_intDust_SSP126 = [mean_TPs_dust_intDust_SSP126  nansum(mean_dust_2100_intDust_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
    mean_TPs_dust_noLULC_SSP126 = [mean_TPs_dust_noLULC_SSP126  nansum(mean_dust_2100_noLULC_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
    mean_TPs_dust_MSE_2_SSP126 = [mean_TPs_dust_MSE_2_SSP126  nansum(mean_dust_2100_MSE_2_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
    mean_TPs_dust_MSE_0_02_SSP126 = [mean_TPs_dust_MSE_0_02_SSP126  nansum(mean_dust_2100_MSE_0_02_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
    
    mean_TPs_dust_Control_SSP585 = [mean_TPs_dust_Control_SSP585  nansum(mean_dust_2100_585_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
    mean_TPs_dust_PP_SSP585 = [mean_TPs_dust_PP_SSP585  nansum(mean_dust_2100_585_PP_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
    mean_TPs_dust_Koch_SSP585 = [mean_TPs_dust_Koch_SSP585  nansum(mean_dust_2100_585_Koch_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
    mean_TPs_dust_extBC_SSP585 = [mean_TPs_dust_extBC_SSP585  nansum(mean_dust_2100_585_extBC_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
    mean_TPs_dust_intDust_SSP585 = [mean_TPs_dust_intDust_SSP585  nansum(mean_dust_2100_585_intDust_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
    mean_TPs_dust_noLULC_SSP585 = [mean_TPs_dust_noLULC_SSP585  nansum(mean_dust_2100_585_noLULC_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
    mean_TPs_dust_MSE_2_SSP585 = [mean_TPs_dust_MSE_2_SSP585  nansum(mean_dust_2100_585_MSE_2_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
    mean_TPs_dust_MSE_0_02_SSP585 = [mean_TPs_dust_MSE_0_02_SSP585  nansum(mean_dust_2100_585_MSE_0_02_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
    
end






%% get time series AER
mean_TPs_AER_PP_SSP126 = [];
mean_TPs_AER_Control_SSP126 = [];
mean_TPs_AER_Koch_SSP126 = [];
mean_TPs_AER_extBC_SSP126 = [];
mean_TPs_AER_intDust_SSP126 = [];
mean_TPs_AER_noLULC_SSP126 = [];
mean_TPs_AER_MSE_2_SSP126 = [];
mean_TPs_AER_MSE_0_02_SSP126 = [];

mean_TPs_AER_PP_SSP585 = [];
mean_TPs_AER_Control_SSP585 = [];
mean_TPs_AER_Koch_SSP585 = [];
mean_TPs_AER_extBC_SSP585 = [];
mean_TPs_AER_intDust_SSP585 = [];
mean_TPs_AER_noLULC_SSP585 = [];
mean_TPs_AER_MSE_2_SSP585 = [];
mean_TPs_AER_MSE_0_02_SSP585 = [];

for i = 1:65
    
    mean_AER_hist_i = squeeze(mean_AER_hist(:,:,i));
    mean_AER_hist_PP_i = squeeze(mean_AER_hist_PP(:,:,i));
    mean_AER_hist_Koch_i = squeeze(mean_AER_hist_Koch(:,:,i));
    mean_AER_hist_extBC_i = squeeze(mean_AER_hist_extBC(:,:,i));
    mean_AER_hist_intDust_i = squeeze(mean_AER_hist_intDust(:,:,i));
    mean_AER_hist_noLULC_i = squeeze(mean_AER_hist_noLULC(:,:,i));
    mean_AER_hist_MSE_2_i = squeeze(mean_AER_hist_MSE_2(:,:,i));
    mean_AER_hist_MSE_0_02_i = squeeze(mean_AER_hist_MSE_0_02(:,:,i));
    
    mean_AER_hist_i = flipud(mean_AER_hist_i');
    mean_AER_hist_PP_i = flipud(mean_AER_hist_PP_i');
    mean_AER_hist_Koch_i = flipud(mean_AER_hist_Koch_i');
    mean_AER_hist_extBC_i = flipud(mean_AER_hist_extBC_i');
    mean_AER_hist_intDust_i = flipud(mean_AER_hist_intDust_i');
    mean_AER_hist_noLULC_i = flipud(mean_AER_hist_noLULC_i');
    mean_AER_hist_MSE_2_i = flipud(mean_AER_hist_MSE_2_i');
    mean_AER_hist_MSE_0_02_i = flipud(mean_AER_hist_MSE_0_02_i');
    
    mean_TPs_AER_Control_SSP126 = [mean_TPs_AER_Control_SSP126  nansum(mean_AER_hist_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
    mean_TPs_AER_PP_SSP126 = [mean_TPs_AER_PP_SSP126  nansum(mean_AER_hist_PP_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
    mean_TPs_AER_Koch_SSP126 = [mean_TPs_AER_Koch_SSP126  nansum(mean_AER_hist_Koch_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
    mean_TPs_AER_extBC_SSP126 = [mean_TPs_AER_extBC_SSP126  nansum(mean_AER_hist_extBC_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
    mean_TPs_AER_intDust_SSP126 = [mean_TPs_AER_intDust_SSP126  nansum(mean_AER_hist_intDust_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
    mean_TPs_AER_noLULC_SSP126 = [mean_TPs_AER_noLULC_SSP126  nansum(mean_AER_hist_noLULC_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
    mean_TPs_AER_MSE_2_SSP126 = [mean_TPs_AER_MSE_2_SSP126  nansum(mean_AER_hist_MSE_2_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
    mean_TPs_AER_MSE_0_02_SSP126 = [mean_TPs_AER_MSE_0_02_SSP126  nansum(mean_AER_hist_MSE_0_02_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
    
    mean_TPs_AER_Control_SSP585 = [mean_TPs_AER_Control_SSP585  nansum(mean_AER_hist_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
    mean_TPs_AER_PP_SSP585 = [mean_TPs_AER_PP_SSP585  nansum(mean_AER_hist_PP_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
    mean_TPs_AER_Koch_SSP585 = [mean_TPs_AER_Koch_SSP585  nansum(mean_AER_hist_Koch_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
    mean_TPs_AER_extBC_SSP585 = [mean_TPs_AER_extBC_SSP585  nansum(mean_AER_hist_extBC_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
    mean_TPs_AER_intDust_SSP585 = [mean_TPs_AER_intDust_SSP585  nansum(mean_AER_hist_intDust_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
    mean_TPs_AER_noLULC_SSP585 = [mean_TPs_AER_noLULC_SSP585  nansum(mean_AER_hist_noLULC_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
    mean_TPs_AER_MSE_2_SSP585 = [mean_TPs_AER_MSE_2_SSP585  nansum(mean_AER_hist_MSE_2_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
    mean_TPs_AER_MSE_0_02_SSP585 = [mean_TPs_AER_MSE_0_02_SSP585  nansum(mean_AER_hist_MSE_0_02_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
    
end

for i = 1:86
    
    mean_AER_2100_i = squeeze(mean_AER_2100(:,:,i));
    mean_AER_2100_PP_i = squeeze(mean_AER_2100_PP(:,:,i));
    mean_AER_2100_Koch_i = squeeze(mean_AER_2100_Koch(:,:,i));
    mean_AER_2100_extBC_i = squeeze(mean_AER_2100_extBC(:,:,i));
    mean_AER_2100_intDust_i = squeeze(mean_AER_2100_intDust(:,:,i));
    mean_AER_2100_noLULC_i = squeeze(mean_AER_2100_noLULC(:,:,i));
    mean_AER_2100_MSE_2_i = squeeze(mean_AER_2100_MSE_2(:,:,i));
    mean_AER_2100_MSE_0_02_i = squeeze(mean_AER_2100_MSE_0_02(:,:,i));
    
    mean_AER_2100_585_i = squeeze(mean_AER_2100_585(:,:,i));
    mean_AER_2100_585_PP_i = squeeze(mean_AER_2100_585_PP(:,:,i));
    mean_AER_2100_585_Koch_i = squeeze(mean_AER_2100_585_Koch(:,:,i));
    mean_AER_2100_585_extBC_i = squeeze(mean_AER_2100_585_extBC(:,:,i));
    mean_AER_2100_585_intDust_i = squeeze(mean_AER_2100_585_intDust(:,:,i));
    mean_AER_2100_585_noLULC_i = squeeze(mean_AER_2100_585_noLULC(:,:,i));
    mean_AER_2100_585_MSE_2_i = squeeze(mean_AER_2100_585_MSE_2(:,:,i));
    mean_AER_2100_585_MSE_0_02_i = squeeze(mean_AER_2100_585_MSE_0_02(:,:,i));
    
    mean_AER_2100_i = flipud(mean_AER_2100_i');
    mean_AER_2100_PP_i = flipud(mean_AER_2100_PP_i');
    mean_AER_2100_Koch_i = flipud(mean_AER_2100_Koch_i');
    mean_AER_2100_extBC_i = flipud(mean_AER_2100_extBC_i');
    mean_AER_2100_intDust_i = flipud(mean_AER_2100_intDust_i');
    mean_AER_2100_noLULC_i = flipud(mean_AER_2100_noLULC_i');
    mean_AER_2100_MSE_2_i = flipud(mean_AER_2100_MSE_2_i');
    mean_AER_2100_MSE_0_02_i = flipud(mean_AER_2100_MSE_0_02_i');
    
    mean_AER_2100_585_i = flipud(mean_AER_2100_585_i');
    mean_AER_2100_585_PP_i = flipud(mean_AER_2100_585_PP_i');
    mean_AER_2100_585_Koch_i = flipud(mean_AER_2100_585_Koch_i');
    mean_AER_2100_585_extBC_i = flipud(mean_AER_2100_585_extBC_i');
    mean_AER_2100_585_intDust_i = flipud(mean_AER_2100_585_intDust_i');
    mean_AER_2100_585_noLULC_i = flipud(mean_AER_2100_585_noLULC_i');
    mean_AER_2100_585_MSE_2_i = flipud(mean_AER_2100_585_MSE_2_i');
    mean_AER_2100_585_MSE_0_02_i = flipud(mean_AER_2100_585_MSE_0_02_i');
    
    
    mean_TPs_AER_Control_SSP126 = [mean_TPs_AER_Control_SSP126  nansum(mean_AER_2100_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
    mean_TPs_AER_PP_SSP126 = [mean_TPs_AER_PP_SSP126  nansum(mean_AER_2100_PP_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
    mean_TPs_AER_Koch_SSP126 = [mean_TPs_AER_Koch_SSP126  nansum(mean_AER_2100_Koch_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
    mean_TPs_AER_extBC_SSP126 = [mean_TPs_AER_extBC_SSP126  nansum(mean_AER_2100_extBC_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
    mean_TPs_AER_intDust_SSP126 = [mean_TPs_AER_intDust_SSP126  nansum(mean_AER_2100_intDust_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
    mean_TPs_AER_noLULC_SSP126 = [mean_TPs_AER_noLULC_SSP126  nansum(mean_AER_2100_noLULC_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
    mean_TPs_AER_MSE_2_SSP126 = [mean_TPs_AER_MSE_2_SSP126  nansum(mean_AER_2100_MSE_2_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
    mean_TPs_AER_MSE_0_02_SSP126 = [mean_TPs_AER_MSE_0_02_SSP126  nansum(mean_AER_2100_MSE_0_02_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
    
    mean_TPs_AER_Control_SSP585 = [mean_TPs_AER_Control_SSP585  nansum(mean_AER_2100_585_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
    mean_TPs_AER_PP_SSP585 = [mean_TPs_AER_PP_SSP585  nansum(mean_AER_2100_585_PP_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
    mean_TPs_AER_Koch_SSP585 = [mean_TPs_AER_Koch_SSP585  nansum(mean_AER_2100_585_Koch_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
    mean_TPs_AER_extBC_SSP585 = [mean_TPs_AER_extBC_SSP585  nansum(mean_AER_2100_585_extBC_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
    mean_TPs_AER_intDust_SSP585 = [mean_TPs_AER_intDust_SSP585  nansum(mean_AER_2100_585_intDust_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
    mean_TPs_AER_noLULC_SSP585 = [mean_TPs_AER_noLULC_SSP585  nansum(mean_AER_2100_585_noLULC_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
    mean_TPs_AER_MSE_2_SSP585 = [mean_TPs_AER_MSE_2_SSP585  nansum(mean_AER_2100_585_MSE_2_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
    mean_TPs_AER_MSE_0_02_SSP585 = [mean_TPs_AER_MSE_0_02_SSP585  nansum(mean_AER_2100_585_MSE_0_02_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];
    
end




% %% rename
% mean_TPs_SWE_PP_SSP126_BD = mean_TPs_SWE_PP_SSP126;
% mean_TPs_SWE_Control_SSP126_BD = mean_TPs_SWE_Control_SSP126;
% mean_TPs_SWE_Koch_SSP126_BD = mean_TPs_SWE_Koch_SSP126;
% mean_TPs_SWE_extBC_SSP126_BD = mean_TPs_SWE_extBC_SSP126;
% mean_TPs_SWE_intDust_SSP126_BD = mean_TPs_SWE_intDust_SSP126;
% mean_TPs_SWE_noLULC_SSP126_BD = mean_TPs_SWE_noLULC_SSP126;
% mean_TPs_SWE_MSE_2_SSP126_BD = mean_TPs_SWE_MSE_2_SSP126;
% mean_TPs_SWE_MSE_0_02_SSP126_BD = mean_TPs_SWE_MSE_0_02_SSP126;
% 
% mean_TPs_SWE_PP_SSP585_BD = mean_TPs_SWE_PP_SSP585;
% mean_TPs_SWE_Control_SSP585_BD = mean_TPs_SWE_Control_SSP585;
% mean_TPs_SWE_Koch_SSP585_BD = mean_TPs_SWE_Koch_SSP585;
% mean_TPs_SWE_extBC_SSP585_BD = mean_TPs_SWE_extBC_SSP585;
% mean_TPs_SWE_intDust_SSP585_BD = mean_TPs_SWE_intDust_SSP585;
% mean_TPs_SWE_noLULC_SSP585_BD = mean_TPs_SWE_noLULC_SSP585;
% mean_TPs_SWE_MSE_2_SSP585_BD = mean_TPs_SWE_MSE_2_SSP585;
% mean_TPs_SWE_MSE_0_02_SSP585_BD = mean_TPs_SWE_MSE_0_02_SSP585;


%% rename all
mean_TPs_BC_PP_SSP126_BD = mean_TPs_BC_PP_SSP126;
mean_TPs_BC_Control_SSP126_BD = mean_TPs_BC_Control_SSP126;
mean_TPs_BC_Koch_SSP126_BD = mean_TPs_BC_Koch_SSP126;
mean_TPs_BC_extBC_SSP126_BD = mean_TPs_BC_extBC_SSP126;
mean_TPs_BC_intDust_SSP126_BD = mean_TPs_BC_intDust_SSP126;
mean_TPs_BC_noLULC_SSP126_BD = mean_TPs_BC_noLULC_SSP126;
mean_TPs_BC_MSE_2_SSP126_BD = mean_TPs_BC_MSE_2_SSP126;
mean_TPs_BC_MSE_0_02_SSP126_BD = mean_TPs_BC_MSE_0_02_SSP126;

mean_TPs_BC_PP_SSP585_BD = mean_TPs_BC_PP_SSP585;
mean_TPs_BC_Control_SSP585_BD = mean_TPs_BC_Control_SSP585;
mean_TPs_BC_Koch_SSP585_BD = mean_TPs_BC_Koch_SSP585;
mean_TPs_BC_extBC_SSP585_BD = mean_TPs_BC_extBC_SSP585;
mean_TPs_BC_intDust_SSP585_BD = mean_TPs_BC_intDust_SSP585;
mean_TPs_BC_noLULC_SSP585_BD = mean_TPs_BC_noLULC_SSP585;
mean_TPs_BC_MSE_2_SSP585_BD = mean_TPs_BC_MSE_2_SSP585;
mean_TPs_BC_MSE_0_02_SSP585_BD = mean_TPs_BC_MSE_0_02_SSP585;


%% rename
mean_TPs_dust_PP_SSP126_BD = mean_TPs_dust_PP_SSP126;
mean_TPs_dust_Control_SSP126_BD = mean_TPs_dust_Control_SSP126;
mean_TPs_dust_Koch_SSP126_BD = mean_TPs_dust_Koch_SSP126;
mean_TPs_dust_extBC_SSP126_BD = mean_TPs_dust_extBC_SSP126;
mean_TPs_dust_intDust_SSP126_BD = mean_TPs_dust_intDust_SSP126;
mean_TPs_dust_noLULC_SSP126_BD = mean_TPs_dust_noLULC_SSP126;
mean_TPs_dust_MSE_2_SSP126_BD = mean_TPs_dust_MSE_2_SSP126;
mean_TPs_dust_MSE_0_02_SSP126_BD = mean_TPs_dust_MSE_0_02_SSP126;

mean_TPs_dust_PP_SSP585_BD = mean_TPs_dust_PP_SSP585;
mean_TPs_dust_Control_SSP585_BD = mean_TPs_dust_Control_SSP585;
mean_TPs_dust_Koch_SSP585_BD = mean_TPs_dust_Koch_SSP585;
mean_TPs_dust_extBC_SSP585_BD = mean_TPs_dust_extBC_SSP585;
mean_TPs_dust_intDust_SSP585_BD = mean_TPs_dust_intDust_SSP585;
mean_TPs_dust_noLULC_SSP585_BD = mean_TPs_dust_noLULC_SSP585;
mean_TPs_dust_MSE_2_SSP585_BD = mean_TPs_dust_MSE_2_SSP585;
mean_TPs_dust_MSE_0_02_SSP585_BD = mean_TPs_dust_MSE_0_02_SSP585;


mean_TPs_AER_PP_SSP126_BD = mean_TPs_AER_PP_SSP126;
mean_TPs_AER_Control_SSP126_BD = mean_TPs_AER_Control_SSP126;
mean_TPs_AER_Koch_SSP126_BD = mean_TPs_AER_Koch_SSP126;
mean_TPs_AER_extBC_SSP126_BD = mean_TPs_AER_extBC_SSP126;
mean_TPs_AER_intDust_SSP126_BD = mean_TPs_AER_intDust_SSP126;
mean_TPs_AER_noLULC_SSP126_BD = mean_TPs_AER_noLULC_SSP126;
mean_TPs_AER_MSE_2_SSP126_BD = mean_TPs_AER_MSE_2_SSP126;
mean_TPs_AER_MSE_0_02_SSP126_BD = mean_TPs_AER_MSE_0_02_SSP126;

mean_TPs_AER_PP_SSP585_BD = mean_TPs_AER_PP_SSP585;
mean_TPs_AER_Control_SSP585_BD = mean_TPs_AER_Control_SSP585;
mean_TPs_AER_Koch_SSP585_BD = mean_TPs_AER_Koch_SSP585;
mean_TPs_AER_extBC_SSP585_BD = mean_TPs_AER_extBC_SSP585;
mean_TPs_AER_intDust_SSP585_BD = mean_TPs_AER_intDust_SSP585;
mean_TPs_AER_noLULC_SSP585_BD = mean_TPs_AER_noLULC_SSP585;
mean_TPs_AER_MSE_2_SSP585_BD = mean_TPs_AER_MSE_2_SSP585;
mean_TPs_AER_MSE_0_02_SSP585_BD = mean_TPs_AER_MSE_0_02_SSP585;

