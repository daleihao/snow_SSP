clear all;
close all;
clc;

%% get data
get_plotdata
% mean_BC_RF_hist(mean_SWE_hist<=5) = nan;
%mean_BC_RF_future_126(mean_SWE_future_126<=5) = nan;
%mean_BC_RF_future_585(mean_SWE_future_585<=5) = nan;

%% calculate average value
res = 0.5;
lon_base = [0+res/2:res:360-res/2];
lat_base =  [90-res/2:-res:20+res/2];
[lons,lats] = meshgrid(double(lon_base),double(lat_base));
% radius = 6378137;
% res_lat = 0.5;
% res_lon = 0.5;
% height = radius * res_lat*pi/180;
% width2 = radius*(cos((lats-res_lat/2)*pi/180)+cos((lats+res_lat/2)*pi/180))/2 * res_lon*pi/180;
% Areas = width2.*height/1e6;
% 
% tmp = flipud(mean_BC_RF_hist');
% filters = lats> 59 & lats <=90 & lons > (360-63) & lons < (360-11);
% tmp(filters) = nan;
% Areas(isnan(tmp)) = nan;
% mean_value = nansum(tmp(:).*Areas(:))./nansum(Areas(:));
% disp(mean_value);
mean_values = nan(3,3);
mean_values(1,1) = cal_mean_value_TP(mean_BC_RF_hist);
mean_values(1,2) = cal_mean_value_TP(mean_BC_RF_future_126);
mean_values(1,3) = cal_mean_value_TP(mean_BC_RF_future_585);
mean_values(2,1) = cal_mean_value_TP(mean_dust_RF_hist);
mean_values(2,2) = cal_mean_value_TP(mean_dust_RF_future_126);
mean_values(2,3) = cal_mean_value_TP(mean_dust_RF_future_585);
mean_values(3,1) = cal_mean_value_TP(mean_AER_RF_hist);
mean_values(3,2) = cal_mean_value_TP(mean_AER_RF_future_126);
mean_values(3,3) = cal_mean_value_TP(mean_AER_RF_future_585);
