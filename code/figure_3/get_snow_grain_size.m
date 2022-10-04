clc;
clear all;
close all;

%% future change
casenames = {'SSP126_2015_2100_Control_revise2','SSP126_2015_2100_Control_hist_BD_revise2',...
			 'SSP585_2015_2100_Control_revise2','SSP585_2015_2100_Control_hist_BD_revise2',...          
             'hist_run_1950_2014_Control_revise2'...
             };


for  case_i = 1:size(casenames,2)
    
    casename = casenames{case_i};
    disp(casename)
    load([casename '.mat']);
    
    year_num = size(FSNOs, 3)/12;
   
    RF_LAP_means = nan(720,140,year_num);
    SAR_LAP_means = nan(720,140,year_num);
    
    SWE_means =  nan(720,140,year_num);
    FSNO_means = nan(720,140,year_num);
    
    
    if case_i<=4
        for year_i = 2015:2100
            index_i = year_i - 2014;
            month_i_all = (index_i-1)*12 + [1 2 3 4 5 12];
            year_index = index_i;
            
            RF_LAP_means(:,:,year_index) = mean(SNOAERFRC2Ls(:,:,month_i_all),3,'omitnan');
            RF_BC_means(:,:,year_index) = mean(SNOBCFRC2Ls(:,:,month_i_all),3,'omitnan');
            RF_dust_means(:,:,year_index) = mean(SNODSTFRC2Ls(:,:,month_i_all),3,'omitnan');
            
            SAR_LAP_means(:,:,year_index) = mean(SNOAERFRC2Ls(:,:,month_i_all)./SNOFSDSs(:,:,month_i_all),3,'omitnan');
            SAR_BC_means(:,:,year_index) = mean(SNOBCFRC2Ls(:,:,month_i_all)./SNOFSDSs(:,:,month_i_all),3,'omitnan');
            SAR_dust_means(:,:,year_index) = mean(SNODSTFRC2Ls(:,:,month_i_all)./SNOFSDSs(:,:,month_i_all),3,'omitnan');
            
            SC_BC_means(:,:,year_index) = mean(SNOBCMSLs(:,:,month_i_all),3,'omitnan');
            SC_dust_means(:,:,year_index) = mean(SNODSTMSLs(:,:,month_i_all),3,'omitnan');
            SWE_means(:,:,year_index) = mean(SWEs(:,:,month_i_all),3,'omitnan');
            FSNO_means(:,:,year_index) = mean(FSNOs(:,:,month_i_all),3,'omitnan');
            SNOW_means(:,:,year_index) = mean(SNOWs(:,:,month_i_all),3,'omitnan');
            RAIN_means(:,:,year_index) = mean(RAINs(:,:,month_i_all),3,'omitnan');
        end
    else
        for year_i = 1950:2014
            index_i = year_i - 1949;
            month_i_all = (index_i-1)*12 + [1 2 3 4 5 12];
            year_index = index_i;
            
            RF_LAP_means(:,:,year_index) = mean(SNOAERFRC2Ls(:,:,month_i_all),3,'omitnan');
            RF_BC_means(:,:,year_index) = mean(SNOBCFRC2Ls(:,:,month_i_all),3,'omitnan');
            RF_dust_means(:,:,year_index) = mean(SNODSTFRC2Ls(:,:,month_i_all),3,'omitnan');
            
            SAR_LAP_means(:,:,year_index) = mean(SNOAERFRC2Ls(:,:,month_i_all)./SNOFSDSs(:,:,month_i_all),3,'omitnan');
            SAR_BC_means(:,:,year_index) = mean(SNOBCFRC2Ls(:,:,month_i_all)./SNOFSDSs(:,:,month_i_all),3,'omitnan');
            SAR_dust_means(:,:,year_index) = mean(SNODSTFRC2Ls(:,:,month_i_all)./SNOFSDSs(:,:,month_i_all),3,'omitnan');
            
            SC_BC_means(:,:,year_index) = mean(SNOBCMSLs(:,:,month_i_all),3,'omitnan');
            SC_dust_means(:,:,year_index) = mean(SNODSTMSLs(:,:,month_i_all),3,'omitnan');
            SWE_means(:,:,year_index) = mean(SWEs(:,:,month_i_all),3,'omitnan');
            FSNO_means(:,:,year_index) = mean(FSNOs(:,:,month_i_all),3,'omitnan');
            SNOW_means(:,:,year_index) = mean(SNOWs(:,:,month_i_all),3,'omitnan');
            RAIN_means(:,:,year_index) = mean(RAINs(:,:,month_i_all),3,'omitnan');
        end
    end
    
    
    save([ 'grainsize_mean_' casename '.mat'],'RF_LAP_means','RF_BC_means','RF_dust_means',...
        'SAR_LAP_means','SAR_BC_means','SAR_dust_means',...
        'SC_BC_means','SC_dust_means',...
        'SWE_means','FSNO_means','SNOW_means','RAIN_means'...
        );
    
end



