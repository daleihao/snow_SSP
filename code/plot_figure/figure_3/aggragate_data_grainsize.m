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
    load(['new' casename '.mat']);
    
    year_num = size(FSNOs, 3)/12;
    
    RF_LAP_means = nan(720,140,year_num);
    RF_BC_means = nan(720,140,year_num);
    RF_dust_means = nan(720,140,year_num);
    
    SAR_LAP_means = nan(720,140,year_num);
    SAR_BC_means = nan(720,140,year_num);
    SAR_dust_means = nan(720,140,year_num);
    
    RF2_LAP_means = nan(720,140,year_num);
    RF2_BC_means = nan(720,140,year_num);
    RF2_dust_means = nan(720,140,year_num);
    
    SC_BC_means = nan(720,140,year_num);
    SC_dust_means = nan(720,140,year_num);
    
    SNORDSL_means = nan(720,140,year_num);
    
    if case_i<=4
        for year_i = 2015:2100
            index_i = year_i - 2014;
            month_i_all = (index_i-1)*12 + [12 1:5];
            year_index = index_i;
            
            RF_LAP_means(:,:,year_index) = mean(SNOAERFRC2Ls(:,:,month_i_all),3,'omitnan');
            RF_BC_means(:,:,year_index) = mean(SNOBCFRC2Ls(:,:,month_i_all),3,'omitnan');
            RF_dust_means(:,:,year_index) = mean(SNODSTFRC2Ls(:,:,month_i_all),3,'omitnan');
            
            RF2_LAP_means(:,:,year_index) = mean(SNOAERFRCLs(:,:,month_i_all),3,'omitnan');
            RF2_BC_means(:,:,year_index) = mean(SNOBCFRCLs(:,:,month_i_all),3,'omitnan');
            RF2_dust_means(:,:,year_index) = mean(SNODSTFRCLs(:,:,month_i_all),3,'omitnan');
            
            SAR_LAP_means(:,:,year_index) = mean(SNOAERFRC2Ls(:,:,month_i_all)./SNOFSDSs(:,:,month_i_all),3,'omitnan');
            SAR_BC_means(:,:,year_index) = mean(SNOBCFRC2Ls(:,:,month_i_all)./SNOFSDSs(:,:,month_i_all),3,'omitnan');
            SAR_dust_means(:,:,year_index) = mean(SNODSTFRC2Ls(:,:,month_i_all)./SNOFSDSs(:,:,month_i_all),3,'omitnan');
            
            SC_BC_means(:,:,year_index) = mean(SNOBCMSLs(:,:,month_i_all),3,'omitnan');
            SC_dust_means(:,:,year_index) = mean(SNODSTMSLs(:,:,month_i_all),3,'omitnan');
            
            SNORDSL_means(:,:,year_index) = mean(SNORDSLs(:,:,month_i_all),3,'omitnan');
            
        end
    else
        for year_i = 1950:2014
            index_i = year_i - 1949;
            month_i_all = (index_i-1)*12 + [12 1:5];
            year_index = index_i;
            
            RF_LAP_means(:,:,year_index) = mean(SNOAERFRC2Ls(:,:,month_i_all),3,'omitnan');
            RF_BC_means(:,:,year_index) = mean(SNOBCFRC2Ls(:,:,month_i_all),3,'omitnan');
            RF_dust_means(:,:,year_index) = mean(SNODSTFRC2Ls(:,:,month_i_all),3,'omitnan');
            
            SAR_LAP_means(:,:,year_index) = mean(SNOAERFRC2Ls(:,:,month_i_all)./SNOFSDSs(:,:,month_i_all),3,'omitnan');
            SAR_BC_means(:,:,year_index) = mean(SNOBCFRC2Ls(:,:,month_i_all)./SNOFSDSs(:,:,month_i_all),3,'omitnan');
            SAR_dust_means(:,:,year_index) = mean(SNODSTFRC2Ls(:,:,month_i_all)./SNOFSDSs(:,:,month_i_all),3,'omitnan');
            
            RF2_LAP_means(:,:,year_index) = mean(SNOAERFRCLs(:,:,month_i_all),3,'omitnan');
            RF2_BC_means(:,:,year_index) = mean(SNOBCFRCLs(:,:,month_i_all),3,'omitnan');
            RF2_dust_means(:,:,year_index) = mean(SNODSTFRCLs(:,:,month_i_all),3,'omitnan');
            
            SC_BC_means(:,:,year_index) = mean(SNOBCMSLs(:,:,month_i_all),3,'omitnan');
            SC_dust_means(:,:,year_index) = mean(SNODSTMSLs(:,:,month_i_all),3,'omitnan');
            SNORDSL_means(:,:,year_index) = mean(SNORDSLs(:,:,month_i_all),3,'omitnan');
        end
    end
    
    
    save([ 'DM_GS_mean_' casename '.mat'],'RF_LAP_means','RF_BC_means','RF_dust_means',...
        'RF2_LAP_means','RF2_BC_means','RF2_dust_means',...
        'SAR_LAP_means','SAR_BC_means','SAR_dust_means',...
        'SC_BC_means','SC_dust_means',...
        'SNORDSL_means'...
        );
    
end



