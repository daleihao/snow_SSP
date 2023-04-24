%% get hist_BD
clc;
clear all;

dirname = '/global/cfs/cdirs/m3520/share/snow_data/snow_SSP/';


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

mean_SWE_hist = SWE_means;

tmp = nanmean(mean_SWE_hist(:,:,(end-20+1):end),3);
tmp = flipud(tmp');
filters_TP = filters_TP & (tmp>5);

%% month_i
mean_TPs_SWE_Control_SSP126 = nan(12,151);
mean_TPs_SWE_Control_SSP585 = nan(12,151);

mean_TPs_BC_Control_SSP126 = nan(12,151);
mean_TPs_BC_Control_SSP585 = nan(12,151);

mean_TPs_AER_Control_SSP126 = nan(12,151);
mean_TPs_AER_Control_SSP585 = nan(12,151);

mean_TPs_dust_Control_SSP126 = nan(12,151);
mean_TPs_dust_Control_SSP585 = nan(12,151);

mean_TPs_SNORDSL_Control_SSP126 = nan(12,151);
mean_TPs_SNORDSL_Control_SSP585 = nan(12,151);



for month_i = 1:12
    disp(month_i)
    load([dirname 'seasonal_data/SCo_Month_' num2str(month_i) '_mean_hist_run_1950_2014_Control_revise2.mat']);
    mean_BC_hist = RF_BC_means;
    mean_dust_hist = RF_dust_means;
    mean_AER_hist = RF_LAP_means;
    mean_SWE_hist = SC_BC_means;
    mean_SNORDSL_hist = SC_dust_means;
    
    %% SSP126
    load([dirname 'seasonal_data/SCo_Month_' num2str(month_i) '_mean_SSP126_2015_2100_Control_revise2.mat']);
    mean_BC_2100 = RF_BC_means;
    mean_dust_2100 = RF_dust_means;
    mean_AER_2100 = RF_LAP_means;
    mean_SWE_2100 = SC_BC_means;
    mean_SNORDSL_2100 = SC_dust_means;

    %%585
    
    load([dirname 'seasonal_data/SCo_Month_' num2str(month_i) '_mean_SSP585_2015_2100_Control_revise2.mat']);
      mean_BC_2100_585 = RF_BC_means;
    mean_dust_2100_585 = RF_dust_means;
    mean_AER_2100_585 = RF_LAP_means;
    mean_SWE_2100_585 = SC_BC_means;
    mean_SNORDSL_2100_585 = SC_dust_means;
    
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
    
    
    %% get time series SWE
    for i = 1:65
        
        mean_SWE_hist_i = squeeze(mean_SWE_hist(:,:,i));
        mean_SWE_hist_i = flipud(mean_SWE_hist_i');
        
        mean_TPs_SWE_Control_SSP126(month_i,i) = nansum(mean_SWE_hist_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP));
        mean_TPs_SWE_Control_SSP585(month_i,i) = nansum(mean_SWE_hist_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP));
    end
    
    for i = 1:86
        
        mean_SWE_2100_i = squeeze(mean_SWE_2100(:,:,i));
        mean_SWE_2100_585_i = squeeze(mean_SWE_2100_585(:,:,i));
        
        mean_SWE_2100_i = flipud(mean_SWE_2100_i');
        mean_SWE_2100_585_i = flipud(mean_SWE_2100_585_i');
        
        mean_TPs_SWE_Control_SSP126(month_i,65+i) =  nansum(mean_SWE_2100_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP));
        mean_TPs_SWE_Control_SSP585(month_i,65+i) =  nansum(mean_SWE_2100_585_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP));
    end
    
    
    %% get time series BC
    for i = 1:65
        
        mean_BC_hist_i = squeeze(mean_BC_hist(:,:,i));
        mean_BC_hist_i = flipud(mean_BC_hist_i');
        
        mean_TPs_BC_Control_SSP126(month_i,i) = nansum(mean_BC_hist_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP));
        mean_TPs_BC_Control_SSP585(month_i,i) = nansum(mean_BC_hist_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP));
    end
    
    for i = 1:86
        
        mean_BC_2100_i = squeeze(mean_BC_2100(:,:,i));
        mean_BC_2100_585_i = squeeze(mean_BC_2100_585(:,:,i));
        
        mean_BC_2100_i = flipud(mean_BC_2100_i');
        mean_BC_2100_585_i = flipud(mean_BC_2100_585_i');
        
        mean_TPs_BC_Control_SSP126(month_i,65+i) =  nansum(mean_BC_2100_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP));
        mean_TPs_BC_Control_SSP585(month_i,65+i) =  nansum(mean_BC_2100_585_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP));
    end
    
    
    %% get time series dust
    for i = 1:65
        
        mean_dust_hist_i = squeeze(mean_dust_hist(:,:,i));
        mean_dust_hist_i = flipud(mean_dust_hist_i');
        
        mean_TPs_dust_Control_SSP126(month_i,i) = nansum(mean_dust_hist_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP));
        mean_TPs_dust_Control_SSP585(month_i,i) = nansum(mean_dust_hist_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP));
    end
    
    for i = 1:86
        
        mean_dust_2100_i = squeeze(mean_dust_2100(:,:,i));
        mean_dust_2100_585_i = squeeze(mean_dust_2100_585(:,:,i));
        
        mean_dust_2100_i = flipud(mean_dust_2100_i');
        mean_dust_2100_585_i = flipud(mean_dust_2100_585_i');
        
        mean_TPs_dust_Control_SSP126(month_i,65+i) =  nansum(mean_dust_2100_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP));
        mean_TPs_dust_Control_SSP585(month_i,65+i) =  nansum(mean_dust_2100_585_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP));
    end
    
    
    %% get time series AER
    for i = 1:65
        
        mean_AER_hist_i = squeeze(mean_AER_hist(:,:,i));
        mean_AER_hist_i = flipud(mean_AER_hist_i');
        
        mean_TPs_AER_Control_SSP126(month_i,i) = nansum(mean_AER_hist_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP));
        mean_TPs_AER_Control_SSP585(month_i,i) = nansum(mean_AER_hist_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP));
    end
    
    for i = 1:86
        
        mean_AER_2100_i = squeeze(mean_AER_2100(:,:,i));
        mean_AER_2100_585_i = squeeze(mean_AER_2100_585(:,:,i));
        
        mean_AER_2100_i = flipud(mean_AER_2100_i');
        mean_AER_2100_585_i = flipud(mean_AER_2100_585_i');
        
        mean_TPs_AER_Control_SSP126(month_i,65+i) =  nansum(mean_AER_2100_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP));
        mean_TPs_AER_Control_SSP585(month_i,65+i) =  nansum(mean_AER_2100_585_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP));
    end
    
    
    %% get time series SNORDSL
    for i = 1:65
        
        mean_SNORDSL_hist_i = squeeze(mean_SNORDSL_hist(:,:,i));
        mean_SNORDSL_hist_i = flipud(mean_SNORDSL_hist_i');
        
        mean_TPs_SNORDSL_Control_SSP126(month_i,i) = nansum(mean_SNORDSL_hist_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP));
        mean_TPs_SNORDSL_Control_SSP585(month_i,i) = nansum(mean_SNORDSL_hist_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP));
    end
    
    for i = 1:86
        
        mean_SNORDSL_2100_i = squeeze(mean_SNORDSL_2100(:,:,i));
        mean_SNORDSL_2100_585_i = squeeze(mean_SNORDSL_2100_585(:,:,i));
        
        mean_SNORDSL_2100_i = flipud(mean_SNORDSL_2100_i');
        mean_SNORDSL_2100_585_i = flipud(mean_SNORDSL_2100_585_i');
        
        mean_TPs_SNORDSL_Control_SSP126(month_i,65+i) =  nansum(mean_SNORDSL_2100_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP));
        mean_TPs_SNORDSL_Control_SSP585(month_i,65+i) =  nansum(mean_SNORDSL_2100_585_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP));
    end
end

%% month_i
mean_TPs_SWE_Control_Hist_SSP126 = nan(12,151);
mean_TPs_SWE_Control_Hist_SSP585 = nan(12,151);

mean_TPs_BC_Control_Hist_SSP126 = nan(12,151);
mean_TPs_BC_Control_Hist_SSP585 = nan(12,151);

mean_TPs_AER_Control_Hist_SSP126 = nan(12,151);
mean_TPs_AER_Control_Hist_SSP585 = nan(12,151);

mean_TPs_dust_Control_Hist_SSP126 = nan(12,151);
mean_TPs_dust_Control_Hist_SSP585 = nan(12,151);

mean_TPs_SNORDSL_Control_Hist_SSP126 = nan(12,151);
mean_TPs_SNORDSL_Control_Hist_SSP585 = nan(12,151);

for month_i = 1:12
    disp(month_i)
    load([dirname 'seasonal_data/SCo_Month_' num2str(month_i) '_mean_hist_run_1950_2014_Control_revise2.mat']);
    mean_BC_hist = RF_BC_means;
    mean_dust_hist = RF_dust_means;
    mean_AER_hist = RF_LAP_means;
    mean_SWE_hist = SC_BC_means;
    mean_SNORDSL_hist = SC_dust_means;
    
    %% SSP126
    load([dirname 'seasonal_data/SCo_Month_' num2str(month_i) '_mean_SSP126_2015_2100_Control_hist_BD_revise2.mat']);
    mean_BC_2100 = RF_BC_means;
    mean_dust_2100 = RF_dust_means;
    mean_AER_2100 = RF_LAP_means;
    mean_SWE_2100 = SC_BC_means;
    mean_SNORDSL_2100 = SC_dust_means;

    %%585
    
    load([dirname 'seasonal_data/SCo_Month_' num2str(month_i) '_mean_SSP585_2015_2100_Control_hist_BD_revise2.mat']);
    mean_BC_2100_585 = RF_BC_means;
    mean_dust_2100_585 = RF_dust_means;
    mean_AER_2100_585 = RF_LAP_means;
    mean_SWE_2100_585 = SC_BC_means;
    mean_SNORDSL_2100_585 = SC_dust_means;
    
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
    
    
    %% get time series SWE
    for i = 1:65
        
        mean_SWE_hist_i = squeeze(mean_SWE_hist(:,:,i));
        mean_SWE_hist_i = flipud(mean_SWE_hist_i');
        
        mean_TPs_SWE_Control_Hist_SSP126(month_i,i) = nansum(mean_SWE_hist_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP));
        mean_TPs_SWE_Control_Hist_SSP585(month_i,i) = nansum(mean_SWE_hist_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP));
    end
    
    for i = 1:86
        
        mean_SWE_2100_i = squeeze(mean_SWE_2100(:,:,i));
        mean_SWE_2100_585_i = squeeze(mean_SWE_2100_585(:,:,i));
        
        mean_SWE_2100_i = flipud(mean_SWE_2100_i');
        mean_SWE_2100_585_i = flipud(mean_SWE_2100_585_i');
        
        mean_TPs_SWE_Control_Hist_SSP126(month_i,65+i) =  nansum(mean_SWE_2100_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP));
        mean_TPs_SWE_Control_Hist_SSP585(month_i,65+i) =  nansum(mean_SWE_2100_585_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP));
    end
    
    
    %% get time series BC
    for i = 1:65
        
        mean_BC_hist_i = squeeze(mean_BC_hist(:,:,i));
        mean_BC_hist_i = flipud(mean_BC_hist_i');
        
        mean_TPs_BC_Control_Hist_SSP126(month_i,i) = nansum(mean_BC_hist_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP));
        mean_TPs_BC_Control_Hist_SSP585(month_i,i) = nansum(mean_BC_hist_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP));
    end
    
    for i = 1:86
        
        mean_BC_2100_i = squeeze(mean_BC_2100(:,:,i));
        mean_BC_2100_585_i = squeeze(mean_BC_2100_585(:,:,i));
        
        mean_BC_2100_i = flipud(mean_BC_2100_i');
        mean_BC_2100_585_i = flipud(mean_BC_2100_585_i');
        
        mean_TPs_BC_Control_Hist_SSP126(month_i,65+i) =  nansum(mean_BC_2100_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP));
        mean_TPs_BC_Control_Hist_SSP585(month_i,65+i) =  nansum(mean_BC_2100_585_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP));
    end
    
    
    %% get time series dust
    for i = 1:65
        
        mean_dust_hist_i = squeeze(mean_dust_hist(:,:,i));
        mean_dust_hist_i = flipud(mean_dust_hist_i');
        
        mean_TPs_dust_Control_Hist_SSP126(month_i,i) = nansum(mean_dust_hist_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP));
        mean_TPs_dust_Control_Hist_SSP585(month_i,i) = nansum(mean_dust_hist_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP));
    end
    
    for i = 1:86
        
        mean_dust_2100_i = squeeze(mean_dust_2100(:,:,i));
        mean_dust_2100_585_i = squeeze(mean_dust_2100_585(:,:,i));
        
        mean_dust_2100_i = flipud(mean_dust_2100_i');
        mean_dust_2100_585_i = flipud(mean_dust_2100_585_i');
        
        mean_TPs_dust_Control_Hist_SSP126(month_i,65+i) =  nansum(mean_dust_2100_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP));
        mean_TPs_dust_Control_Hist_SSP585(month_i,65+i) =  nansum(mean_dust_2100_585_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP));
    end
    
    
    %% get time series AER
    for i = 1:65
        
        mean_AER_hist_i = squeeze(mean_AER_hist(:,:,i));
        mean_AER_hist_i = flipud(mean_AER_hist_i');
        
        mean_TPs_AER_Control_Hist_SSP126(month_i,i) = nansum(mean_AER_hist_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP));
        mean_TPs_AER_Control_Hist_SSP585(month_i,i) = nansum(mean_AER_hist_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP));
    end
    
    for i = 1:86
        
        mean_AER_2100_i = squeeze(mean_AER_2100(:,:,i));
        mean_AER_2100_585_i = squeeze(mean_AER_2100_585(:,:,i));
        
        mean_AER_2100_i = flipud(mean_AER_2100_i');
        mean_AER_2100_585_i = flipud(mean_AER_2100_585_i');
        
        mean_TPs_AER_Control_Hist_SSP126(month_i,65+i) =  nansum(mean_AER_2100_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP));
        mean_TPs_AER_Control_Hist_SSP585(month_i,65+i) =  nansum(mean_AER_2100_585_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP));
    end
    
    
    %% get time series SNORDSL
    for i = 1:65
        
        mean_SNORDSL_hist_i = squeeze(mean_SNORDSL_hist(:,:,i));
        mean_SNORDSL_hist_i = flipud(mean_SNORDSL_hist_i');
        
        mean_TPs_SNORDSL_Control_Hist_SSP126(month_i,i) = nansum(mean_SNORDSL_hist_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP));
        mean_TPs_SNORDSL_Control_Hist_SSP585(month_i,i) = nansum(mean_SNORDSL_hist_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP));
    end
    
    for i = 1:86
        
        mean_SNORDSL_2100_i = squeeze(mean_SNORDSL_2100(:,:,i));
        mean_SNORDSL_2100_585_i = squeeze(mean_SNORDSL_2100_585(:,:,i));
        
        mean_SNORDSL_2100_i = flipud(mean_SNORDSL_2100_i');
        mean_SNORDSL_2100_585_i = flipud(mean_SNORDSL_2100_585_i');
        
        mean_TPs_SNORDSL_Control_Hist_SSP126(month_i,65+i) =  nansum(mean_SNORDSL_2100_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP));
        mean_TPs_SNORDSL_Control_Hist_SSP585(month_i,65+i) =  nansum(mean_SNORDSL_2100_585_i(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP));
    end
end

save('seasonally_data_3_SCO.mat',...
    'mean_TPs_SWE_Control_SSP126','mean_TPs_SWE_Control_SSP585',...
    'mean_TPs_BC_Control_SSP126','mean_TPs_BC_Control_SSP585',...
    'mean_TPs_dust_Control_SSP126','mean_TPs_dust_Control_SSP585',...
    'mean_TPs_AER_Control_SSP126','mean_TPs_AER_Control_SSP585',...
    'mean_TPs_SNORDSL_Control_SSP126','mean_TPs_SNORDSL_Control_SSP585',...
    'mean_TPs_SWE_Control_Hist_SSP126','mean_TPs_SWE_Control_Hist_SSP585',...
    'mean_TPs_BC_Control_Hist_SSP126','mean_TPs_BC_Control_Hist_SSP585',...
    'mean_TPs_dust_Control_Hist_SSP126','mean_TPs_dust_Control_Hist_SSP585',...
    'mean_TPs_AER_Control_Hist_SSP126','mean_TPs_AER_Control_Hist_SSP585',...
    'mean_TPs_SNORDSL_Control_Hist_SSP126','mean_TPs_SNORDSL_Control_Hist_SSP585'...
    );



