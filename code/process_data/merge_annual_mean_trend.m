

clc
clear all
close all

BCs_time_series_all = nan(7,86+65,2);
dusts_time_series_all = nan(7,86+65,2);

load('hist_annual_trend.mat');
BCs_time_series_all(:,1:65,:) = BCs_time_series;
dusts_time_series_all(:,1:65,:) = dusts_time_series;

load('annual_trend.mat');
BCs_time_series_all(:,66:end,:) = BCs_time_series;
dusts_time_series_all(:,66:end,:) = dusts_time_series;

save('126_annual_trend_all.mat','BCs_time_series_all','dusts_time_series_all');

clc
clear all

BCs_time_series_all = nan(7,86+65,2);
dusts_time_series_all = nan(7,86+65,2);

load('hist_annual_trend.mat');
BCs_time_series_all(:,1:65,:) = BCs_time_series;
dusts_time_series_all(:,1:65,:) = dusts_time_series;

load('585_annual_trend.mat');
BCs_time_series_all(:,66:end,:) = BCs_time_series;
dusts_time_series_all(:,66:end,:) = dusts_time_series;

save('585_annual_trend_all.mat','BCs_time_series_all','dusts_time_series_all');
