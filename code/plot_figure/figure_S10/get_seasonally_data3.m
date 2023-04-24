clc;
clear all;
close all;

%% future change
casenames = {'SSP126_2015_2100_Control_revise2','SSP126_2015_2100_Control_hist_BD_revise2',...
    'SSP585_2015_2100_Control_revise2','SSP585_2015_2100_Control_hist_BD_revise2',...
    'hist_run_1950_2014_Control_revise2'...
    };

for month_i = 1:12
    for  case_i = 1:size(casenames,2)
        
        casename = casenames{case_i};
        disp(casename)
        load(['new2_' casename '.mat']);
        
        year_num = size(SNOAERFRCLs, 3)/12;
        
        RF_LAP_means = nan(720,140,year_num);
        RF_BC_means = nan(720,140,year_num);
        RF_dust_means = nan(720,140,year_num);
        
        SC_BC_means = nan(720,140,year_num);
        SC_dust_means = nan(720,140,year_num);
        
        
        if case_i<=4
            for year_i = 2015:2100
                index_i = year_i - 2014;
                month_i_all = (index_i-1)*12 + [month_i];
                year_index = index_i;
                
                RF_LAP_means(:,:,year_index) = mean(SNOAERFRCLs(:,:,month_i_all),3,'omitnan');
                RF_BC_means(:,:,year_index) = mean(SNOBCFRCLs(:,:,month_i_all),3,'omitnan');
                RF_dust_means(:,:,year_index) = mean(SNODSTFRCLs(:,:,month_i_all),3,'omitnan');
                
                               
                
                SC_BC_means(:,:,year_index) = mean(SNOBCMCLs(:,:,month_i_all),3,'omitnan');
                SC_dust_means(:,:,year_index) = mean(SNODSTMCLs(:,:,month_i_all),3,'omitnan');
                
            end
        else
            for year_i = 1950:2014
                index_i = year_i - 1949;
                month_i_all = (index_i-1)*12 + [month_i];
                year_index = index_i;
                
                RF_LAP_means(:,:,year_index) = mean(SNOAERFRCLs(:,:,month_i_all),3,'omitnan');
                RF_BC_means(:,:,year_index) = mean(SNOBCFRCLs(:,:,month_i_all),3,'omitnan');
                RF_dust_means(:,:,year_index) = mean(SNODSTFRCLs(:,:,month_i_all),3,'omitnan');
                
              
                SC_BC_means(:,:,year_index) = mean(SNOBCMCLs(:,:,month_i_all),3,'omitnan');
                SC_dust_means(:,:,year_index) = mean(SNODSTMCLs(:,:,month_i_all),3,'omitnan');
                
                
            end
        end
        
        
        save([ 'seasonal_data/SC_Month_' num2str(month_i) '_mean_' casename '.mat'],...
            'RF_LAP_means','RF_BC_means','RF_dust_means',...
            'SC_BC_means','SC_dust_means'...
            );
        
    end
end


