clc
clear all;
close all;

swe_threshold = 3;
load('latlons.mat');
[lats,lons] = meshgrid(double(lat_base),double(lon_base));

load('126_total_SWE_all.mat');
mean_swes_1995 = nanmean(total_SWEs_all(:,:,1:20),3);

load('126_total_BC_all.mat');

Slope_BCs = nan(size(total_BCs_all,[1,2]));
p_val_BCs = nan(size(total_BCs_all,[1,2]));

Years = [1995:2100];
for row_i = 1:size(total_SWEs_all, 1)
    for col_i = 1:size(total_SWEs_all, 2)
        BCs_tmp = squeeze(total_BCs_all(row_i,col_i,:));
        if(sum(isnan(BCs_tmp))<1 & sum(BCs_tmp)>0 & mean_swes_1995(row_i,col_i)>=swe_threshold & lats(row_i,col_i)>25)
            [taub tau h sig Z S sigma sen n senplot CIlower CIupper D Dall C3 nsigma] = ktaub([Years' BCs_tmp], 0.05, 0);
            Slope_BCs(row_i,col_i) = sen;
            p_val_BCs(row_i,col_i) = sig;
        end
    end
end

Slope_dusts = nan(size(total_dusts_all,[1,2]));
p_val_dusts = nan(size(total_dusts_all,[1,2]));

Years = [1995:2100];
for row_i = 1:size(total_dusts_all, 1)
    for col_i = 1:size(total_dusts_all, 2)
        dusts_tmp = squeeze(total_dusts_all(row_i,col_i,:));
        if(sum(isnan(BCs_tmp))<1 & sum(BCs_tmp)>0 & mean_swes_1995(row_i,col_i)>=swe_threshold & lats(row_i,col_i)>25)
            [taub tau h sig Z S sigma sen n senplot CIlower CIupper D Dall C3 nsigma] = ktaub([Years' dusts_tmp], 0.05, 0);
            Slope_dusts(row_i,col_i) = sen;
            p_val_dusts(row_i,col_i) = sig;
        end
    end
end

save('126_p_values.mat','Slope_BCs','p_val_BCs','Slope_dusts','p_val_dusts');


%% 585
clc
clear all;
close all;

swe_threshold = 3;
load('latlons.mat');
[lats,lons] = meshgrid(double(lat_base),double(lon_base));

load('585_total_SWE_all.mat');
mean_swes_1995 = nanmean(total_SWEs_all(:,:,1:20),3);

load('585_total_BC_all.mat');

Slope_BCs = nan(size(total_BCs_all,[1,2]));
p_val_BCs = nan(size(total_BCs_all,[1,2]));

Years = [1995:2100];
for row_i = 1:size(total_SWEs_all, 1)
    for col_i = 1:size(total_SWEs_all, 2)
        BCs_tmp = squeeze(total_BCs_all(row_i,col_i,:));
        if(sum(isnan(BCs_tmp))<1 & sum(BCs_tmp)>0 & mean_swes_1995(row_i,col_i)>=swe_threshold & lats(row_i,col_i)>25)
            [taub tau h sig Z S sigma sen n senplot CIlower CIupper D Dall C3 nsigma] = ktaub([Years' BCs_tmp], 0.05, 0);
            Slope_BCs(row_i,col_i) = sen;
            p_val_BCs(row_i,col_i) = sig;
        end
    end
end

Slope_dusts = nan(size(total_dusts_all,[1,2]));
p_val_dusts = nan(size(total_dusts_all,[1,2]));

Years = [1995:2100];
for row_i = 1:size(total_dusts_all, 1)
    for col_i = 1:size(total_dusts_all, 2)
        dusts_tmp = squeeze(total_dusts_all(row_i,col_i,:));
        if(sum(isnan(BCs_tmp))<1 & sum(BCs_tmp)>0 & mean_swes_1995(row_i,col_i)>=swe_threshold & lats(row_i,col_i)>25)
            [taub tau h sig Z S sigma sen n senplot CIlower CIupper D Dall C3 nsigma] = ktaub([Years' dusts_tmp], 0.05, 0);
            Slope_dusts(row_i,col_i) = sen;
            p_val_dusts(row_i,col_i) = sig;
        end
    end
end

save('585_p_values.mat','Slope_BCs','p_val_BCs','Slope_dusts','p_val_dusts');
