clear all;
close all;
clc;

ModelNames = {'CESM2','CanESM5', 'GFDL-ESM4','INM-CM5-0','MIROC6','MRI-ESM2-0','NorESM2-LM'};
for model_i =7
    if model_i == 1
        file_name = ['../data/aerosol_deposit_data/SSP126/*BSSP126cmip6*.nc'];
        filenames = dir(file_name);
        file_name = ['../data/aerosol_deposit_data/SSP126/' filenames(1).name];
        
        BC1s = ncread(file_name,'BCDEPWET');
        BC2s = ncread(file_name,'BCPHIDRY');
        BC3s = ncread(file_name,'BCPHODRY');
        
        wet_BCs = BC1s*1e11;
        dry_BCs = (BC2s+BC3s)*1e11;
        
        Dust1s = ncread(file_name,'DSTX01DD');
        Dust2s = ncread(file_name,'DSTX01WD');
        Dust3s = ncread(file_name,'DSTX02DD');
        Dust4s = ncread(file_name,'DSTX02WD');
        Dust5s = ncread(file_name,'DSTX03DD');
        Dust6s = ncread(file_name,'DSTX03WD');
        Dust7s = ncread(file_name,'DSTX04DD');
        Dust8s = ncread(file_name,'DSTX04WD');
        wet_dusts = (Dust2s + Dust4s + Dust6s + Dust8s)*1e8;
        dry_dusts = (Dust1s + Dust3s + Dust5s + Dust7s)*1e8;
        
        wet_BCs = wet_BCs(:,:,13:(end-12));
        dry_BCs = dry_BCs(:,:,13:(end-12));
        wet_dusts = wet_dusts(:,:,13:(end-12));
        dry_dusts = dry_dusts(:,:,13:(end-12));
        
        lat_base= ncread(file_name, 'lat');
        lon_base = ncread(file_name, 'lon');
        
        [lats_base,lons_base] = meshgrid(double(lat_base),double(lon_base));
        
    elseif model_i == 7
        file_name = ['../../data/aerosol_deposit_data/SSP126/NorESM2-LM/wetbc_*.nc'];
        filenames = dir(file_name);
        filenum = size(filenames,1);
        wet_BCs = [];
        for index_i = 1:filenum
            file_name = ['../../data/aerosol_deposit_data/SSP126/NorESM2-LM/' filenames(index_i).name];
            tmp = ncread(file_name,'wetbc')*1e11;
            wet_BCs = cat(3,wet_BCs,tmp);
        end
        
        file_name = ['../data/aerosol_deposit_data/SSP126/NorESM2-LM/drybc_*.nc'];
        filenames = dir(file_name);
        filenum = size(filenames,1);
        dry_BCs = [];
        for index_i = 1:filenum
            file_name = ['../data/aerosol_deposit_data/SSP126/NorESM2-LM/' filenames(index_i).name];
            tmp = ncread(file_name,'drybc')*1e11;
            dry_BCs = cat(3,dry_BCs,tmp);
        end
        
        file_name = ['../data/aerosol_deposit_data/SSP126/NorESM2-LM/wetdust_*.nc'];
        filenames = dir(file_name);
        filenum = size(filenames,1);
        wet_dusts = [];
        for index_i = 1:filenum
            file_name = ['../data/aerosol_deposit_data/SSP126/NorESM2-LM/' filenames(index_i).name];
            tmp = ncread(file_name,'wetdust')*1e8;
            wet_dusts = cat(3,wet_dusts,tmp);
        end
        
        file_name = ['../data/aerosol_deposit_data/SSP126/NorESM2-LM/drydust_*.nc'];
        filenames = dir(file_name);
        filenum = size(filenames,1);
        dry_dusts = [];
        for index_i = 1:filenum
            file_name = ['../data/aerosol_deposit_data/SSP126/NorESM2-LM/' filenames(index_i).name];
            tmp = ncread(file_name,'drydust')*1e8;
            dry_dusts = cat(3,dry_dusts,tmp);
        end
        
        lat_i = ncread(file_name, 'lat');
        lon_i = ncread(file_name, 'lon');
        
        [lats_i,lons_i] = meshgrid(double(lat_i),double(lon_i));
        
        wet_BCs_tmp = nan(288,192,1032);
        dry_BCs_tmp = nan(288,192,1032);
        wet_dusts_tmp = nan(288,192,1032);
        dry_dusts_tmp = nan(288,192,1032);
        
        for time_i = 1:1032
            wet_BCs_tmp(:,:,time_i) = griddata( lats_i,lons_i, wet_BCs(:,:,time_i),lats_base, lons_base,'Linear');
            dry_BCs_tmp(:,:,time_i) = griddata( lats_i,lons_i, dry_BCs(:,:,time_i),lats_base, lons_base,'Linear');
            wet_dusts_tmp(:,:,time_i) = griddata( lats_i,lons_i, wet_dusts(:,:,time_i),lats_base, lons_base,'Linear');
            dry_dusts_tmp(:,:,time_i) = griddata( lats_i,lons_i, dry_dusts(:,:,time_i),lats_base, lons_base,'Linear');
        end
        
        wet_BCs = wet_BCs_tmp;
        dry_BCs = dry_BCs_tmp;
        wet_dusts = wet_dusts_tmp;
        dry_dusts = dry_dusts_tmp;
        
    else
        file_name = ['../data/aerosol_deposit_data/SSP126/wetbc_AERmon_' ModelNames{model_i} '_*.nc'];
        filenames = dir(file_name);
        file_name = ['../data/aerosol_deposit_data/SSP126/' filenames(1).name];
        wet_BCs = ncread(file_name,'wetbc')*1e11;
        file_name = ['../data/aerosol_deposit_data/SSP126/drybc_AERmon_'  ModelNames{model_i}  '*.nc'];
        filenames = dir(file_name);
        file_name = ['../data/aerosol_deposit_data/SSP126/' filenames(1).name];
        dry_BCs = ncread(file_name,'drybc')*1e11;
        
        file_name = ['../data/aerosol_deposit_data/SSP126/wetdust_AERmon_'  ModelNames{model_i}  '*.nc'];
        filenames = dir(file_name);
        file_name = ['../data/aerosol_deposit_data/SSP126/' filenames(1).name];
        wet_dusts = ncread(file_name,'wetdust')*1e8;
        
        file_name = ['../data/aerosol_deposit_data/SSP126/drydust_AERmon_'  ModelNames{model_i}  '*.nc'];
        filenames = dir(file_name);
        file_name = ['../data/aerosol_deposit_data/SSP126/' filenames(1).name];
        dry_dusts = ncread(file_name,'drydust')*1e8;
        
        lat_i = ncread(file_name, 'lat');
        lon_i = ncread(file_name, 'lon');
        
        [lats_i,lons_i] = meshgrid(double(lat_i),double(lon_i));
        
        wet_BCs_tmp = nan(288,192,1032);
        dry_BCs_tmp = nan(288,192,1032);
        wet_dusts_tmp = nan(288,192,1032);
        dry_dusts_tmp = nan(288,192,1032);
        
        for time_i = 1:1032
            wet_BCs_tmp(:,:,time_i) = griddata( lats_i,lons_i, wet_BCs(:,:,time_i),lats_base, lons_base,'Linear');
            dry_BCs_tmp(:,:,time_i) = griddata( lats_i,lons_i, dry_BCs(:,:,time_i),lats_base, lons_base,'Linear');
            wet_dusts_tmp(:,:,time_i) = griddata( lats_i,lons_i, wet_dusts(:,:,time_i),lats_base, lons_base,'Linear');
            dry_dusts_tmp(:,:,time_i) = griddata( lats_i,lons_i, dry_dusts(:,:,time_i),lats_base, lons_base,'Linear');
        end
        
        wet_BCs = wet_BCs_tmp;
        dry_BCs = dry_BCs_tmp;
        wet_dusts = wet_dusts_tmp;
        dry_dusts = dry_dusts_tmp;
    end
    
    save(['aer_' ModelNames{model_i} '.mat'],'wet_BCs', 'dry_BCs', 'wet_dusts', 'dry_dusts');
    
end

