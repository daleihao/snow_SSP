%% get_ELM_Data

dirname = 'C:\Users\haod776\OneDrive - PNNL\Documents\work\E3SM\writting\snow_SSP\CMIP6-data\ELM_simulations\process_code_after_LULCC\data\';


res = 0.5;
lon_base = [0+res/2:res:360-res/2];
lat_base =  [90-res/2:-res:20+res/2];
[lons,lats] = meshgrid(double(lon_base),double(lat_base));

filters_TP = lats>27 & lats<42 & lons>65 & lons<105;


%% plot sensitivity
%% hist
load([dirname 'April_mean_hist_run_1950_2014_Control_revise2.mat']);
mean_BC_hist = RF_BC_means;
mean_dust_hist = RF_dust_means;
mean_AER_hist = RF_LAP_means;
mean_SWE_hist = SWE_means;

tmp = nansum(mean_SWE_hist(:,:,(end-20+1):end),3);
tmp = flipud(tmp');
filters_TP = filters_TP & (tmp>5);

%% SSP126
load([dirname 'April_mean_SSP126_2015_2100_Control_revise2.mat']);
mean_BC_2100 = RF_BC_means;
mean_dust_2100 = RF_dust_means;
mean_AER_2100 = RF_LAP_means;
mean_SWE_2100 = SWE_means;

%%585
load([dirname 'April_mean_SSP585_2015_2100_Control_revise2.mat']);
mean_BC_2100_585 = RF_BC_means;
mean_dust_2100_585 = RF_dust_means;
mean_AER_2100_585 = RF_LAP_means;
mean_SWE_2100_585 = SWE_means;

%% hist_BD
load([dirname 'April_mean_SSP126_2015_2100_Control_hist_BD_revise2.mat']);
mean_BC_2100_BD = RF_BC_means;
mean_dust_2100_BD = RF_dust_means;
mean_AER_2100_BD = RF_LAP_means;
mean_SWE_2100_BD = SWE_means;

%%585
load([dirname 'April_mean_SSP585_2015_2100_Control_hist_BD_revise2.mat']);
mean_BC_2100_585_BD = RF_BC_means;
mean_dust_2100_585_BD = RF_dust_means;
mean_AER_2100_585_BD = RF_LAP_means;
mean_SWE_2100_585_BD = SWE_means;


%% hist BC
load([dirname 'April_mean_SSP126_2015_2100_Control_hist_BC_revise2.mat']);
mean_BC_2100_BC = RF_BC_means;
mean_dust_2100_BC = RF_dust_means;
mean_AER_2100_BC = RF_LAP_means;
mean_SWE_2100_BC = SWE_means;

%%585
load([dirname 'April_mean_SSP585_2015_2100_Control_hist_BC_revise2.mat']);
mean_BC_2100_585_BC = RF_BC_means;
mean_dust_2100_585_BC = RF_dust_means;
mean_AER_2100_585_BC = RF_LAP_means;
mean_SWE_2100_585_BC = SWE_means;

%% hist Dust
load([dirname 'April_mean_SSP126_2015_2100_Control_hist_Dust_revise2.mat']);
mean_BC_2100_Dust = RF_BC_means;
mean_dust_2100_Dust = RF_dust_means;
mean_AER_2100_Dust = RF_LAP_means;
mean_SWE_2100_Dust = SWE_means;

%%585
load([dirname 'April_mean_SSP585_2015_2100_Control_hist_Dust_revise2.mat']);
mean_BC_2100_585_Dust = RF_BC_means;
mean_dust_2100_585_Dust = RF_dust_means;
mean_AER_2100_585_Dust = RF_LAP_means;
mean_SWE_2100_585_Dust = SWE_means;
%% get time series SWE

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

mean_TPs_SWE_SSP126 = [];
mean_TPs_SWE_BD_SSP126 = [];
mean_TPs_SWE_BC_SSP126 = [];
mean_TPs_SWE_Dust_SSP126 = [];

mean_TPs_SWE_SSP585 = [];
mean_TPs_SWE_BD_SSP585 = [];
mean_TPs_SWE_BC_SSP585 = [];
mean_TPs_SWE_Dust_SSP585 = [];



for i = 1:65
    
mean_SWE_hist_i = squeeze(mean_SWE_hist(:,:,i));

    
mean_SWE_hist_i = flipud(mean_SWE_hist_i');


mean_TPs_SWE_BD_SSP126 = [mean_TPs_SWE_BD_SSP126  nansum(mean_SWE_hist_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];;
mean_TPs_SWE_SSP126 = [mean_TPs_SWE_SSP126  nansum(mean_SWE_hist_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];;
mean_TPs_SWE_BC_SSP126 = [mean_TPs_SWE_BC_SSP126  nansum(mean_SWE_hist_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];;
mean_TPs_SWE_Dust_SSP126 = [mean_TPs_SWE_Dust_SSP126  nansum(mean_SWE_hist_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];;

mean_TPs_SWE_BD_SSP585 = [mean_TPs_SWE_BD_SSP585  nansum(mean_SWE_hist_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];;
mean_TPs_SWE_SSP585 = [mean_TPs_SWE_SSP585  nansum(mean_SWE_hist_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];;
mean_TPs_SWE_BC_SSP585 = [mean_TPs_SWE_BC_SSP585  nansum(mean_SWE_hist_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];;
mean_TPs_SWE_Dust_SSP585 = [mean_TPs_SWE_Dust_SSP585  nansum(mean_SWE_hist_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];;

end

for i = 1:86
mean_SWE_2100_i = squeeze(mean_SWE_2100(:,:,i));
mean_SWE_2100_BD_i = squeeze(mean_SWE_2100_BD(:,:,i));    
mean_SWE_2100_BC_i = squeeze(mean_SWE_2100_BC(:,:,i));    
mean_SWE_2100_Dust_i = squeeze(mean_SWE_2100_Dust(:,:,i));    
   

mean_SWE_2100_585_i = squeeze(mean_SWE_2100_585(:,:,i));
mean_SWE_2100_585_BD_i = squeeze(mean_SWE_2100_585_BD(:,:,i));    
mean_SWE_2100_585_BC_i = squeeze(mean_SWE_2100_585_BC(:,:,i));    
mean_SWE_2100_585_Dust_i = squeeze(mean_SWE_2100_585_Dust(:,:,i));    
  

mean_SWE_2100_i = flipud(mean_SWE_2100_i');
mean_SWE_2100_BD_i = flipud(mean_SWE_2100_BD_i');
mean_SWE_2100_BC_i = flipud(mean_SWE_2100_BC_i');
mean_SWE_2100_Dust_i = flipud(mean_SWE_2100_Dust_i');


mean_SWE_2100_585_i = flipud(mean_SWE_2100_585_i');
mean_SWE_2100_585_BD_i = flipud(mean_SWE_2100_585_BD_i');
mean_SWE_2100_585_BC_i = flipud(mean_SWE_2100_585_BC_i');
mean_SWE_2100_585_Dust_i = flipud(mean_SWE_2100_585_Dust_i');



mean_TPs_SWE_BD_SSP126 = [mean_TPs_SWE_BD_SSP126  nansum(mean_SWE_2100_BD_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];;
mean_TPs_SWE_SSP126 = [mean_TPs_SWE_SSP126  nansum(mean_SWE_2100_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];;
mean_TPs_SWE_BC_SSP126 = [mean_TPs_SWE_BC_SSP126  nansum(mean_SWE_2100_BC_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];;
mean_TPs_SWE_Dust_SSP126 = [mean_TPs_SWE_Dust_SSP126  nansum(mean_SWE_2100_Dust_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];;

mean_TPs_SWE_BD_SSP585 = [mean_TPs_SWE_BD_SSP585  nansum(mean_SWE_2100_585_BD_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];;
mean_TPs_SWE_SSP585 = [mean_TPs_SWE_SSP585  nansum(mean_SWE_2100_585_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];;
mean_TPs_SWE_BC_SSP585 = [mean_TPs_SWE_BC_SSP585  nansum(mean_SWE_2100_585_BC_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];;
mean_TPs_SWE_Dust_SSP585 = [mean_TPs_SWE_Dust_SSP585  nansum(mean_SWE_2100_585_Dust_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP))];;

end



