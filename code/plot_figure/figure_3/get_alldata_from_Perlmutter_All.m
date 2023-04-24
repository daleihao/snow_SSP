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
    
    dirname = '/pscratch/sd/d/daleihao/e3sm_scratch/pm-cpu/';
    outdir = ['/global/cfs/cdirs/m3520/share/snow_data/snow_SSP/'];
    
    if(exist([outdir casename '.mat']))
    continue;
    end 


    if case_i<=4
    filename = [dirname casename '/run/' casename '.elm.h0.2015-02-01-00000.nc'];
    else
    filename = [dirname casename '/run/' casename '.elm.h0.1950-02-01-00000.nc'];
    end
    
    SNOAERFRC2Ls = ncread(filename,'SNOAERFRC2L');
    SNOBCFRC2Ls = ncread(filename,'SNOBCFRC2L');
    SNODSTFRC2Ls = ncread(filename,'SNODSTFRC2L');
    
    SNOAERFRCLs = ncread(filename,'SNOAERFRCL');
    SNOBCFRCLs = ncread(filename,'SNOBCFRCL');
    SNODSTFRCLs = ncread(filename,'SNODSTFRCL');
    
    SNORDSLs = ncread(filename,'SNORDSL');
    
    SNOBCMSLs = ncread(filename,'SNOBCMSL');
    SNODSTMSLs = ncread(filename,'SNODSTMSL');
    
    SNOFSDSs = ncread(filename,'SNOFSDS');
    
    save([outdir 'new_' casename '.mat'],'SNOAERFRC2Ls','SNOBCFRC2Ls','SNODSTFRC2Ls',...
        'SNOAERFRCLs','SNOBCFRCLs','SNODSTFRCLs',...
        'SNORDSLs','SNOBCMSLs','SNODSTMSLs','SNOFSDSs'...
        );
end