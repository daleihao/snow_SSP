clc;
clear all;
close all;
%% set

load('ELM_SWE.mat');
ELM_swe_hist = nanmean(mean_SWE_hist(:,:,(end-19):end),3);
ELM_swe_hist = flipud(ELM_swe_hist');

res = 0.5;
lon = [0+res/2:res:360-res/2];
lat =  [90-res/2:-res:20+res/2];

[lons,lats] = meshgrid(double(lon),double(lat));
%load('latlons.mat');
%[lons_i,lats_i] = meshgrid(double(lon_base),double(lat_base));


radius = 6378137;
res_lat = 0.5;
res_lon = 0.5;
height = radius * res_lat*pi/180;
width2 = radius*(cos((lats-res_lat/2)*pi/180)+cos((lats+res_lat/2)*pi/180))/2 * res_lon*pi/180;
Areas = width2.*height/1e6;


filters_TP = lats>27 & lats<42 & lons>65 & lons<105;
filters_TP = filters_TP & ELM_swe_hist>5;

load('../../../pre/126_total_pr_all_April.mat');
time_series_pr_SSP126 = nan(7,106);
for model_i = 1:7
    for year_i = 1:106
        tmp = squeeze(total_prs_all(:,:,model_i, year_i))*86400;
        tmp = (tmp');
        tmp(~filters_TP) = nan;
        time_series_pr_SSP126(model_i, year_i) = nansum(tmp(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP));

    end
end

load('../../../pre/585_total_pr_all_April.mat');
time_series_pr_SSP585 = nan(7,106);
for model_i = 1:7
    for year_i = 1:106
        tmp = squeeze(total_prs_all(:,:,model_i, year_i))*86400;
        tmp = (tmp');
        tmp(~filters_TP) = nan;
        time_series_pr_SSP585(model_i, year_i) = nansum(tmp(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP));
    end
end



load('../../../tsa/126_total_tas_all_April.mat');
time_series_tas_SSP126 = nan(7,106);
for model_i = 1:7
    for year_i = 1:106
        tmp = squeeze(total_tass_all(:,:,model_i, year_i));
        tmp = (tmp');
        tmp(~filters_TP) = nan;
        time_series_tas_SSP126(model_i, year_i) = nansum(tmp(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP));
    end
end

load('../../../tsa/585_total_tas_all_April.mat');
time_series_tas_SSP585 = nan(7,106);
for model_i = 1:7
    for year_i = 1:106
        tmp = squeeze(total_tass_all(:,:,model_i, year_i));
        tmp = (tmp');
        tmp(~filters_TP) = nan;
        time_series_tas_SSP585(model_i, year_i) = nansum(tmp(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP));
    end
end

%% ELM
load('C:\Users\haod776\OneDrive - PNNL\Documents\work\E3SM\writting\snow_SSP\CMIP6-data\code\elm_pr_tas\CESM_hist.mat');
Pr1 = Prs;
Tsas1 = Tsas;
load('C:\Users\haod776\OneDrive - PNNL\Documents\work\E3SM\writting\snow_SSP\CMIP6-data\code\elm_pr_tas\CESM_SSP126.mat');
Pr2 = Prs;
Tsas2 = Tsas;
load('C:\Users\haod776\OneDrive - PNNL\Documents\work\E3SM\writting\snow_SSP\CMIP6-data\code\elm_pr_tas\CESM_SSP585.mat');
Pr3 = Prs;
Tsas3 = Tsas;
ELM_PR_SSP126 = cat(3,Pr1,Pr2);
ELM_PR_SSP585 = cat(3,Pr1,Pr3);

ELM_TA_SSP126 = cat(3,Tsas1,Tsas2);
ELM_TA_SSP585 = cat(3,Tsas1,Tsas3);

ELM_time_series_PR_SSP126 = nan(1,106);
for model_i = 1
    for year_i = 1:106
        index_i = (year_i+44)*3 + [1 2 3];
        tmp = squeeze(nanmean(ELM_PR_SSP126(:,:, index_i),3))*86400;
        tmp = (tmp');

        tmp(~filters_TP) = nan;
        ELM_time_series_PR_SSP126(model_i, year_i) = nansum(tmp(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP));
    end
end

ELM_time_series_PR_SSP585 = nan(1,106);
for model_i = 1
    for year_i = 1:106
        index_i = (year_i+44)*3 + [1 2 3];
        tmp = squeeze(nanmean(ELM_PR_SSP585(:,:, index_i),3))*86400;
        tmp = (tmp');

        %tmp( tmp>2000) = 0;
        %tmp(tmp<0) = 0;
        tmp(~filters_TP) = nan;
        ELM_time_series_PR_SSP585(model_i, year_i) = nansum(tmp(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP));
    end
end


ELM_time_series_TA_SSP126 = nan(1,106);
for model_i = 1
    for year_i = 1:106
        index_i = (year_i+44)*3 + [1 2 3];
        tmp = squeeze(nanmean(ELM_TA_SSP126(:,:, index_i),3));
        tmp = (tmp');

        tmp(~filters_TP) = nan;
        %tmp( tmp>2000) = 0;
        %tmp(tmp<0) = 0;
        
        ELM_time_series_TA_SSP126(model_i, year_i) = nansum(tmp(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP));
    end
end

ELM_time_series_TA_SSP585 = nan(1,106);
for model_i = 1
    for year_i = 1:106
        index_i = (year_i+44)*3 + [1 2 3];
        tmp = squeeze(nanmean(ELM_TA_SSP585(:,:, index_i),3));
        tmp = (tmp');

        %tmp( tmp>2000) = 0;
        %tmp(tmp<0) = 0;
        tmp(~filters_TP) = nan;
        ELM_time_series_TA_SSP585(model_i, year_i) = nansum(tmp(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP));
    end
end
%% grid

load('../../../swe/126_total_SWE_all_April_v2.mat');
time_series_swe_SSP126 = nan(7,106);
for model_i = 1:7
    for year_i = 1:106
        tmp = squeeze(total_SWEs_all(:,:,model_i, year_i));
        tmp = (tmp');
        %  tmp = griddata( lats_i,lons_i, tmp,lats, lons,'Nearest');
       % tmp( tmp>2000) = 0;
       % tmp(tmp<0) = 0;
        tmp(~filters_TP) = nan;
        time_series_swe_SSP126(model_i, year_i) = nansum(tmp(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP));
    end
end

load('../../../swe/585_total_SWE_all_April_v2.mat');
time_series_swe_SSP585 = nan(7,106);
for model_i = 1:7
    for year_i = 1:106
        tmp = squeeze(total_SWEs_all(:,:,model_i, year_i));
        %tmp = griddata( lats_i,lons_i, tmp,lats, lons,'Linear');
      %  tmp( tmp>2000) = 0;
      %  tmp(tmp<0) = 0;
        tmp = (tmp');
        tmp(~filters_TP) = nan;
        time_series_swe_SSP585(model_i, year_i) = nansum(tmp(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP));
    end
end

%% ELM
load('ELM_SWE.mat');
load('ELM_SWE2.mat');

ELM_swe_SSP126 = cat(3,mean_SWE_hist,mean_SWE_2100_126);
ELM_swe_SSP585 = cat(3,mean_SWE_hist,mean_SWE_2100_585);

ELM_swe_SSP126_BD = cat(3,mean_SWE_hist,mean_SWE_2100_BD);
ELM_swe_SSP585_BD = cat(3,mean_SWE_hist,mean_SWE_2100_585_BD);

ELM_time_series_swe_SSP126 = nan(1,106);
ELM_time_series_swe_SSP126_BD = nan(1,106);

for model_i = 1
    for year_i = 1:106
        tmp = squeeze(ELM_swe_SSP126(:,:, year_i+45));
        tmp = flipud(tmp');

        tmp(~filters_TP) = nan;
        %tmp( tmp>2000) = 0;
        %tmp(tmp<0) = 0;
        
        ELM_time_series_swe_SSP126(model_i, year_i) = nansum(tmp(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP));
        
        tmp = squeeze(ELM_swe_SSP126_BD(:,:, year_i+45));
        tmp = flipud(tmp');

        tmp(~filters_TP) = nan;
        %tmp( tmp>2000) = 0;
        %tmp(tmp<0) = 0;
        
        ELM_time_series_swe_SSP126_BD(model_i, year_i) = nansum(tmp(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP));
    end
end

ELM_time_series_swe_SSP585 = nan(1,106);
ELM_time_series_swe_SSP585_BD = nan(1,106);

for model_i = 1
    for year_i = 1:106
        tmp = squeeze(ELM_swe_SSP585(:,:, year_i+45));
        tmp = flipud(tmp');

        %tmp( tmp>2000) = 0;
        %tmp(tmp<0) = 0;
        tmp(~filters_TP) = nan;
        ELM_time_series_swe_SSP585(model_i, year_i) = nansum(tmp(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP));

         tmp = squeeze(ELM_swe_SSP585_BD(:,:, year_i+45));
        tmp = flipud(tmp');

        %tmp( tmp>2000) = 0;
        %tmp(tmp<0) = 0;
        tmp(~filters_TP) = nan;
        ELM_time_series_swe_SSP585_BD(model_i, year_i) = nansum(tmp(filters_TP).*Areas(filters_TP))/nansum(Areas(filters_TP));

    end
end

% %% ERA5
% load('ERA5_SWE.mat');
% res = 1;
% lon_base = [0+res/2:res:360-res/2];
% lat_base =  [90-res/2:-res:-90+res/2];
% [lons,lats] = meshgrid(double(lon_base),double(lat_base));
% 
% filters_TP = lats>27 & lats<42 & lons>65 & lons<105;
% 
% ERA5_time_series_swe = nan(1,20);
% for year_i = 1:20
%     tmp = squeeze(SWEs(:,:, year_i));
%     SWEs1 = tmp;
%     SWEs1(:,1:180) = tmp(:,181:end);
%     SWEs1(:,181:end) = tmp(:,1:180);
%      tmp( tmp>2000) = nan;
%         tmp(tmp<0) = nan;
%     SWEs1(~filters_TP) = nan;
%     ERA5_time_series_swe(1, year_i) = nanmean(SWEs1(:));
% end