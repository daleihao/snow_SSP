clear all;
close all;
clc;

ModelNames = {'CESM2','CanESM5', 'GFDL-ESM4','INM-CM5-0','MIROC6','MRI-ESM2-0','NorESM2-LM'};
for model_i =1
    if model_i == 1
        file_name = ['../data/swe/*CESM2_ssp126*.nc'];
        filenames = dir(file_name);
        filenum = size(filenames,1);
        swes = [];
        for index_i = 1:filenum
            file_name = ['../data/swe/' filenames(index_i).name];
            tmp = ncread(file_name,'snw');
            swes = cat(3,swes,tmp);
        end   
        lat_base = ncread(file_name, 'lat');
        lon_base = ncread(file_name, 'lon');

    end
    
    save(['swe_' ModelNames{model_i} '.mat'],'swes','lat_base','lon_base');
    
end

%% 585
clear all;
close all;
clc;

ModelNames = {'CESM2','CanESM5', 'GFDL-ESM4','INM-CM5-0','MIROC6','MRI-ESM2-0','NorESM2-LM'};
for model_i =1
    if model_i == 1
        file_name = ['../data/swe/*CESM2_ssp585*.nc'];
        filenames = dir(file_name);
        filenum = size(filenames,1);
        swes = [];
        for index_i = 1:filenum
            file_name = ['../data/swe/' filenames(index_i).name];
            tmp = ncread(file_name,'snw');
            swes = cat(3,swes,tmp);
        end   
        lat_base = ncread(file_name, 'lat');
        lon_base = ncread(file_name, 'lon');

    end
    
    save(['585_swe_' ModelNames{model_i} '.mat'],'swes','lat_base','lon_base');
    
end


