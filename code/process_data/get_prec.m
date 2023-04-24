clear all;
close all;
clc;

res = 0.5;
lon_base = [0+res/2:res:360-res/2];
lat_base =  [90-res/2:-res:20+res/2];

[lons,lats] = meshgrid(double(lon_base),double(lat_base));
[lats_base,lons_base] = meshgrid(double(lat_base),double(lon_base));


periods = {'historical','ssp126','ssp585'};
ModelNames = {'CESM2-WACCM','CanESM5', 'GFDL-ESM4','INM-CM5-0','MIROC6','MRI-ESM2-0','NorESM2-LM'};

months = [31 28 31 30 31 30 31 31 30 31 30 31];
for period_i = 1:3
    for model_i =[1:7]
        %         if model_i == 1
        %             file_name = ['../../data/prec/pr_Amon_' ModelNames{model_i} '_' periods{period_i} '_*.nc'];
        %             filenames = dir(file_name);
        %             file_name = ['../../data/prec/' filenames(1).name];
        %
        %             prs = ncread(file_name,'pr');
        %
        
        if model_i == 1
            file_name = ['../../data/prec/CESM2-WACCM/*_' periods{period_i} '_*.nc'];
            filenames = dir(file_name);
            filenum = size(filenames,1);
            prs = [];
            for index_i = 1:filenum
                file_name = ['../../data/prec/CESM2-WACCM/' filenames(index_i).name];
                tmp = ncread(file_name,'pr');
                prs = cat(3,prs,tmp);
            end
            

            
           lat_i = ncread(file_name, 'lat');
            lon_i = ncread(file_name, 'lon');
            
            [lats_i,lons_i] = meshgrid(double(lat_i),double(lon_i));
            
            num_tmp = size(prs,3);
            prs_tmp = nan(720,140,num_tmp);
            
            for time_i = 1:num_tmp
                prs_tmp(:,:,time_i) = griddata( lats_i,lons_i, prs(:,:,time_i),lats_base, lons_base,'Linear');
            end
            
            prs = prs_tmp;
            
        elseif model_i == 7
            file_name = ['../../data/prec/NorESM2-LM/pr_*' periods{period_i} '*.nc'];
            filenames = dir(file_name);
            filenum = size(filenames,1);
            prs = [];
            for index_i = 1:filenum
                file_name = ['../../data/prec/NorESM2-LM/' filenames(index_i).name];
                tmp = ncread(file_name,'pr');
                prs = cat(3,prs,tmp);
            end
            
            lat_i = ncread(file_name, 'lat');
            lon_i = ncread(file_name, 'lon');
            
            [lats_i,lons_i] = meshgrid(double(lat_i),double(lon_i));
            
            num_tmp = size(prs,3);
            prs_tmp = nan(720,140,num_tmp);
            
            for time_i = 1:num_tmp
                prs_tmp(:,:,time_i) = griddata( lats_i,lons_i, prs(:,:,time_i),lats_base, lons_base,'Linear');
            end
            
            prs = prs_tmp;
            
        else
            file_name = ['../../data/prec/pr_Amon_' ModelNames{model_i}  '_' periods{period_i} '_*.nc'];
            filenames = dir(file_name);
            file_name = ['../../data/prec/' filenames(1).name];
            prs = ncread(file_name,'pr');
            
            
            lat_i = ncread(file_name, 'lat');
            lon_i = ncread(file_name, 'lon');
            
            [lats_i,lons_i] = meshgrid(double(lat_i),double(lon_i));
            
            num_tmp = size(prs,3);
            prs_tmp = nan(720,140,num_tmp);
            
            for time_i = 1:num_tmp
                prs_tmp(:,:,time_i) = griddata( lats_i,lons_i, prs(:,:,time_i),lats_base, lons_base,'Linear');
            end
            
            prs = prs_tmp;
        end
        
        if period_i == 1
            prs = prs(:,:,(end-12*65+1):(end));
        end
        save([periods{period_i} '_' ModelNames{model_i} '.mat'],'prs');
    end
end
