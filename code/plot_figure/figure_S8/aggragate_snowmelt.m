clc;
clear all;
close all;

%% future change
casenames = {'SSP126_2015_2100_Control_revise2','SSP126_2015_2100_Control_hist_BD_revise2',...
			 'SSP585_2015_2100_Control_revise2','SSP585_2015_2100_Control_hist_BD_revise2',...
             'SSP126_2015_2100_Control_hist_BC_revise2','SSP126_2015_2100_Control_hist_Dust_revise2',...
			 'SSP585_2015_2100_Control_hist_BC_revise2','SSP585_2015_2100_Control_hist_Dust_revise2',...			 
             'hist_run_1950_2014_Control_revise2'...
             };


for  case_i = 1:size(casenames,2)
    
    casename = casenames{case_i};
    disp(casename)
    load(['snowmelt_'casename '.mat']);
    
    year_num = size(FSNOs, 3)/12;
    
     %QRUNOFFs = ncread(filename,'QRUNOFF');
    %QSNOMELTs = ncread(filename,'QSNOMELT');
    %QOVERs = ncread(filename,'QOVER');
    
    QRUNOFF_means = nan(720,140,year_num);
    QSNOMELT_means = nan(720,140,year_num);
    QOVER_means = nan(720,140,year_num);
    
  
    if case_i<=8
        for year_i = 2015:2100
            index_i = year_i - 2014;
            month_i_all = (index_i-1)*12 + [4];
            year_index = index_i;
            
            QRUNOFF_means(:,:,year_index) = mean(QRUNOFFs(:,:,month_i_all),3,'omitnan');
            QSNOMELT_means(:,:,year_index) = mean(QSNOMELTs(:,:,month_i_all),3,'omitnan');
            QOVER_means(:,:,year_index) = mean(QOVERs(:,:,month_i_all),3,'omitnan');
        end
    else
        for year_i = 1950:2014
            index_i = year_i - 1949;
            month_i_all = (index_i-1)*12 + [4];
            year_index = index_i;
            
            QRUNOFF_means(:,:,year_index) = mean(QRUNOFFs(:,:,month_i_all),3,'omitnan');
            QSNOMELT_means(:,:,year_index) = mean(QSNOMELTs(:,:,month_i_all),3,'omitnan');
            QOVER_means(:,:,year_index) = mean(QOVERs(:,:,month_i_all),3,'omitnan');
            
        end
    end
    
    
    save([ 'Snowmelt_Spring_mean_' casename '.mat'],'QRUNOFF_means','QSNOMELT_means','QOVER_means'...
        );
    
end



