export RES=ELM_USRDAT
export COMPSET=SSP126_DATM%GSWP3v1_ELM%SP_SICE_SOCN_MOSART_SGLC_SWAV
export COMPILER=gnu
export MACH=pm-cpu
export CASE_NAME=SSP126_2015_2100_extBC_revise2

export domainPath=/global/cfs/cdirs/m3520/share/cesm_inputdata/domain/
export domainFile=domain_NH_05_c220703.nc
export surfdataFile=surfdata_NH_05_c220703.nc
export landuseFile=landuse.timeseries_NH_05_SSP126_c220703.nc

cd /global/u2/d/daleihao/E3SM_NH/cime/scripts/ 
./create_newcase -compset ${COMPSET} -res ${RES} -case ${CASE_NAME} -compiler ${COMPILER} -mach ${MACH} -project m3426   
cd ${CASE_NAME}

./xmlchange LND_DOMAIN_FILE=${domainFile} 
./xmlchange ATM_DOMAIN_FILE=${domainFile} 
./xmlchange LND_DOMAIN_PATH=${domainPath}
./xmlchange ATM_DOMAIN_PATH=${domainPath}

./xmlchange NTASKS=2048,STOP_N=86,STOP_OPTION=nyears,JOB_WALLCLOCK_TIME="08:00:00",RUN_STARTDATE="2015-01-01",REST_N=43,REST_OPTION=nyears
./xmlchange DATM_MODE="CPLHIST",DATM_CLMNCEP_YR_START='2015',DATM_CLMNCEP_YR_END='2100'
./xmlchange ELM_CO2_TYPE='diagnostic',CCSM_BGC='CO2A'

./xmlchange DATM_CPLHIST_DIR='/global/cfs/cdirs/m3520/share/cesm_inputdata/ssp1/monthly_data/'
./xmlchange DATM_CPLHIST_DOMAIN_FILE=${domainPath}${domainFile}
./xmlchange DATM_CPLHIST_YR_START='2015'
./xmlchange DATM_CPLHIST_YR_END='2100'
./xmlchange DATM_CPLHIST_YR_ALIGN='2015'
./xmlchange DATM_CPLHIST_CASE='b.e21.BSSP126cmip6.f09_g17.CMIP6-SSP1-2.6.102'

cat >> user_nl_elm << EOF
finidat = '/pscratch/sd/d/daleihao/e3sm_scratch/pm-cpu/hist_run_1950_2014_extBC_revise2/run/hist_run_1950_2014_extBC_revise2.elm.r.2015-01-01-00000.nc'
	
fsurdat = '${domainPath}${surfdataFile}'
do_transient_pfts = .true.
flanduse_timeseries = '${domainPath}${landuseFile}'

hist_empty_htapes = .true.
hist_mfilt = 1032,86
hist_nhtfrq = 0,-8760
hist_fincl1 = 'FSA','FSDS','SNOFSDS','FSR','FIRE','FSH','EFLX_LH_TOT','FSNO','SNOWDP','H2OSNO','SNORDSL','QSNOMELT','QRUNOFF','QOVER','SNOAERFRC2L','SNOAERFRCL','SNOBCFRC2L','SNOBCFRCL','SNODSTFRC2L','SNODSTFRCL','SNOOCFRC2L','SNOOCFRCL','SNOBCMCL','SNOBCMSL','SNODSTMCL','SNODSTMSL','SNOOCMCL','SNOOCMSL','TSOI_10CM','H2OSOI','BCDEP','DSTDEP','OCDEP','SNOW','RAIN'
hist_fincl2 = 'FSA','FSDS','SNOFSDS','FSR','FIRE','FSH','EFLX_LH_TOT','FSNO','SNOWDP','H2OSNO','SNORDSL','QSNOMELT','QRUNOFF','QOVER','SNOAERFRC2L','SNOAERFRCL','SNOBCFRC2L','SNOBCFRCL','SNODSTFRC2L','SNODSTFRCL','SNOOCFRC2L','SNOOCFRCL','SNOBCMCL','SNOBCMSL','SNODSTMCL','SNODSTMSL','SNOOCMCL','SNOOCMSL','TSOI_10CM','H2OSOI','BCDEP','DSTDEP','OCDEP','SNOW','RAIN'


use_snicar_ad               = .true.
use_snicar_frc              = .true.

snow_shape_defined          = 1
is_dust_internal_mixing		= .false.
snicar_atm_type				= 1
fsnowoptics = '${domainPath}snicar_optics_5bnd_mam_c211006.nc'

use_top_solar_rad           = .true.
EOF



./case.setup 
./case.build 
echo Build_SUCCESS!

# ---------------------------------------------------------------------------- #
# **************************************************************************** #
# ---------------------------------------------------------------------------- #

cp ./CaseDocs/datm.streams.txt.co2tseries.SSP1-2.6 ./user_datm.streams.txt.co2tseries.SSP1-2.6
chmod +rw ./user_datm.streams.txt.co2tseries.SSP1-2.6
perl -w -i -p -e "s@/global/cfs/cdirs/e3sm/inputdata/atm/datm7/CO2@/global/cfs/cdirs/m3520/share/cesm_inputdata/co2@" ./user_datm.streams.txt.co2tseries.SSP1-2.6
sed -i '/ZBOT/d' ./user_datm.streams.txt.co2tseries.SSP1-2.6

cp ./CaseDocs/datm.streams.txt.presaero.SSP1-2.6 ./user_datm.streams.txt.presaero.SSP1-2.6
chmod +rw ./user_datm.streams.txt.presaero.SSP1-2.6
perl -w -i -p -e "s@/global/cfs/cdirs/e3sm/inputdata/atm/cam/chem/trop_mozart_aero/aero@/global/cfs/cdirs/m3520/share/cesm_inputdata/aero_deposit_data@" ./user_datm.streams.txt.presaero.SSP1-2.6
perl -w -i -p -e "s@aerosoldep_SSP1-2.6_monthly_1849-2101_UNSET.nc@aerodep_clm_SSP126_b.e21.BSSP126cmip6.f09_g17.CMIP6-SSP1-2.6.001_2014-2101_monthly_0.9x1.25_c190523.nc@" ./user_datm.streams.txt.presaero.SSP1-2.6
sed -i '/ZBOT/d' ./user_datm.streams.txt.presaero.SSP1-2.6
# ---------------------------------------------------------------------------- #
# **************************************************************************** #
# ---------------------------------------------------------------------------- #
./case.submit

