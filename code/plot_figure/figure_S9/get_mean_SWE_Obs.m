clc;
clear all;
close all;

load('GlobSWE/easelat.mat');
load('GlobSWE/easelon.mat');

SWE_all = nan(721,721,20);

for year_i = 1995:2014
    load(['GlobSWE/' num2str(year_i) '04_northern_hemisphere_monthly_swe_0.25grid.mat']);
    swe_bias_corrected(swe_bias_corrected<0) = nan;
    SWE_all(:,:,year_i - 1994) = swe_bias_corrected;
end

mean_SWE_Obs = nanmean(SWE_all,3);

mean_SWE_Obs(isnan(mean_SWE_Obs)) = -999;


res = 0.5;
lon_base = [-180+res/2:res:180-res/2];
lat_base =  [90-res/2:-res:20+res/2];
[lons,lats] = meshgrid(double(lon_base),double(lat_base));


filters = ~isnan(lon) & ~isnan(lat);
mean_SWE_Obs = griddata(lon(filters),lat(filters),mean_SWE_Obs(filters),lons,lats,'nearest');
mean_SWE_Obs(mean_SWE_Obs<0) = nan;


