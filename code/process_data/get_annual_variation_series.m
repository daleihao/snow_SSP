clear all;
close all;
clc;

ModelNames = {'CESM2','CanESM5', 'GFDL-ESM4','INM-CM5-0','MIROC6','MRI-ESM2-0','NorESM2-LM'};
total_BCs_all = nan(288,192,7,106);
total_dusts_all = nan(288,192,7,106);

for model_i =1:7
    load(['hist_aer_' ModelNames{model_i} '.mat']);
    for year_i = 1995:2014
        index_i = year_i - 1949;
        month_i_all = (index_i-1)*12 + [1 2 3 4 5 12];
        year_index = year_i - 1994;
        total_BCs_all(:,:,model_i,year_index) = nanmean(dry_BCs(:,:,month_i_all),3) + nanmean(wet_BCs(:,:,month_i_all),3);
        total_dusts_all(:,:,model_i,year_index) = nanmean(dry_dusts(:,:,month_i_all),3) + nanmean(wet_dusts(:,:,month_i_all),3);
    end
    
    load(['aer_' ModelNames{model_i} '.mat']);
    for year_i = 2015:2100
        index_i = year_i - 2014;
        month_i_all = (index_i-1)*12 + [1 2 3 4 5 12];
        year_index = year_i - 1994;
        total_BCs_all(:,:,model_i,year_index) = nanmean(dry_BCs(:,:,month_i_all),3) + nanmean(wet_BCs(:,:,month_i_all),3);
        total_dusts_all(:,:,model_i,year_index) = nanmean(dry_dusts(:,:,month_i_all),3) + nanmean(wet_dusts(:,:,month_i_all),3);
    end
end


total_BCs_all = total_BCs_all*10;
total_dusts_all = total_dusts_all*10;

total_BCs_all = squeeze(nanmean(total_BCs_all,3));
total_dusts_all = squeeze(nanmean(total_dusts_all,3));

save('126_total_BC_all.mat','total_BCs_all','total_dusts_all');


clear all;
close all;
clc;

ModelNames = {'CESM2','CanESM5', 'GFDL-ESM4','INM-CM5-0','MIROC6','MRI-ESM2-0','NorESM2-LM'};
total_BCs_all = nan(288,192,7,106);
total_dusts_all = nan(288,192,7,106);

for model_i =1:7
    load(['hist_aer_' ModelNames{model_i} '.mat']);
    for year_i = 1995:2014
        index_i = year_i - 1949;
        month_i_all = (index_i-1)*12 + [1 2 3 4 5 12];
        year_index = year_i - 1994;
        total_BCs_all(:,:,model_i,year_index) = nanmean(dry_BCs(:,:,month_i_all),3) + nanmean(wet_BCs(:,:,month_i_all),3);
        total_dusts_all(:,:,model_i,year_index) = nanmean(dry_dusts(:,:,month_i_all),3) + nanmean(wet_dusts(:,:,month_i_all),3);
    end
    
    
    load(['585_aer_' ModelNames{model_i} '.mat']);
    for year_i = 2015:2100
        index_i = year_i - 2014;
        month_i_all =  (index_i-1)*12 + [1 2 3 4 5 12];
        year_index = year_i - 1994;
        total_BCs_all(:,:,model_i,year_index) = nanmean(dry_BCs(:,:,month_i_all),3) + nanmean(wet_BCs(:,:,month_i_all),3);
        total_dusts_all(:,:,model_i,year_index) = nanmean(dry_dusts(:,:,month_i_all),3) + nanmean(wet_dusts(:,:,month_i_all),3);
    end
end


total_BCs_all = total_BCs_all*10;
total_dusts_all = total_dusts_all*10;


total_BCs_all = squeeze(nanmean(total_BCs_all,3));
total_dusts_all = squeeze(nanmean(total_dusts_all,3));

save('585_total_BC_all.mat','total_BCs_all','total_dusts_all');