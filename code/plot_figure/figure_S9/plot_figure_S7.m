get_ELM_data
load('585_total_SWE_all_April.mat');

load('latlons.mat');
[lons,lats] = meshgrid(double(lon_base),double(flipud(lat_base)));
filters_TP = lats>27 & lats<42 & lons>65 & lons<105;

time_series_SWE = nan(7,106);
for model_i = 1:7
    for year_i = 1:106
        tmp = squeeze(total_SWEs_all(:,:,model_i, year_i));
        tmp = flipud(tmp');
        tmp(~filters_TP) = nan;
        time_series_SWE(model_i, year_i) = nanmean(tmp(:));
    end
end
%% plot

figure;
hold on
plot(time_series_SWE')

plot(time_series_SWE(1,:)','ko-')
plot(mean_TPs_SWE_SSP585(1,(end-105):end)','rx-')