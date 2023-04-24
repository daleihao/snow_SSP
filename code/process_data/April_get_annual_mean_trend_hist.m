clear all;
close all;
clc;
load('latlons.mat');

swe_threshold = 3;

ModelNames = {'CESM2','CanESM5', 'GFDL-ESM4','INM-CM5-0','MIROC6','MRI-ESM2-0','NorESM2-LM'};
BCs_time_series = nan(7,65,2);
dusts_time_series = nan(7,65,2);

load('585_total_SWE_all.mat');
mean_swes_1995 = nanmean(total_SWEs_all(:,:,1:20),3);
mean_swes_1995 = flipud(mean_swes_1995');


for model_i =1:7
    load(['hist_aer_' ModelNames{model_i} '.mat']);
    
    
    [lons,lats] = meshgrid(double(lon_base),double(flipud(lat_base)));
    radius = 6378137;
    res_lat = 180/192;
    res_lon = 360/288;
    height = radius * res_lat*pi/180;
    width2 = radius*(cos((lats-res_lat/2)*pi/180)+cos((lats+res_lat/2)*pi/180))/2 * res_lon*pi/180;
    Areas = width2.*height/1e6;
    
    for year_i = 1950:2014
        
        index_i = year_i - 1949;
        month_i_all = (index_i-1)*12 + [1 2 3 4 5 12];
        
        filters = mean_swes_1995>=swe_threshold & ~isnan(mean_swes_1995) & lats>25;
        
        
        tmp = nanmean(dry_BCs(:,:,month_i_all),3);
        tmp = flipud(tmp');
        BCs_time_series(model_i,index_i,1) = nansum(tmp(filters).*Areas(filters))./nansum(Areas(filters))*10;
        
        tmp = nanmean(wet_BCs(:,:,month_i_all),3);
        tmp = flipud(tmp');
        BCs_time_series(model_i,index_i,2) = nansum(tmp(filters).*Areas(filters))./nansum(Areas(filters))*10;
        
        tmp = nanmean(dry_dusts(:,:,month_i_all),3);
        tmp = flipud(tmp');
        dusts_time_series(model_i,index_i,1) = nansum(tmp(filters).*Areas(filters))./nansum(Areas(filters))*10;
        
        tmp = nanmean(wet_dusts(:,:,month_i_all),3);
        tmp = flipud(tmp');
        dusts_time_series(model_i,index_i,2) = nansum(tmp(filters).*Areas(filters))./nansum(Areas(filters))*10;
        
    end
end

save('hist_annual_trend.mat','BCs_time_series','dusts_time_series');