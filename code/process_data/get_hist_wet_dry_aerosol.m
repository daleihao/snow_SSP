clear all;
close all;
clc;

ModelNames = {'CESM2','CanESM5', 'GFDL-ESM4','INM-CM5-0','MIROC6','MRI-ESM2-0','NorESM2-LM'};
wet_BCs_all = nan(288,192,7,20);
dry_BCs_all = nan(288,192,7,20);

for model_i =1:7
    load(['hist_aer_' ModelNames{model_i} '.mat']);
    for year_i = 1995:2014
        index_i = year_i - 1949;
        month_i_all = (index_i-1)*12 + [1 2 3 4 5 12];
        year_index = year_i - 1994;
        dry_BCs_all(:,:,model_i,year_index) = nanmean(dry_BCs(:,:,month_i_all),3);
        wet_BCs_all(:,:,model_i,year_index) = nanmean(wet_BCs(:,:,month_i_all),3);
    end
end


dry_BCs_all = dry_BCs_all*10;
wet_BCs_all = wet_BCs_all*10;


dry_BCs_all = squeeze(nanmean(dry_BCs_all,3));
wet_BCs_all = squeeze(nanmean(wet_BCs_all,3));

save('hist_wet_dry_BC_all.mat','dry_BCs_all','wet_BCs_all');