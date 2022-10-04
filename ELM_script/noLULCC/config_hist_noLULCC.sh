export RES=ELM_USRDAT
export COMPSET=20TR_DATM%GSWP3v1_ELM%SPBC_SICE_SOCN_MOSART_SGLC_SWAV
export COMPILER=gnu
export MACH=pm-cpu
export CASE_NAME=hist_run_1950_2014_noLULCC_revise2

export domainPath=/global/cfs/cdirs/m3520/share/cesm_inputdata/domain/
export domainFile=domain_NH_05_c220703.nc
export surfdataFile=surfdata_NH_05_c220703.nc
export landuseFile=landuse.timeseries_NH_05_HIST_c220703.nc

cd /global/u2/d/daleihao/E3SM_NH/cime/scripts/ 
./create_newcase --compset ${COMPSET} --res ${RES} --case ${CASE_NAME} --compiler ${COMPILER} --mach ${MACH} --project m3426   
cd ${CASE_NAME}

./xmlchange LND_DOMAIN_FILE=${domainFile} 
./xmlchange ATM_DOMAIN_FILE=${domainFile} 
./xmlchange LND_DOMAIN_PATH=${domainPath}
./xmlchange ATM_DOMAIN_PATH=${domainPath}


./xmlchange NTASKS=2048,STOP_N=65,STOP_OPTION=nyears,JOB_WALLCLOCK_TIME="06:00:00",RUN_STARTDATE="1950-01-01",REST_N=65,REST_OPTION=nyears
./xmlchange DATM_MODE="CPLHIST",DATM_CLMNCEP_YR_START='1950',DATM_CLMNCEP_YR_END='2014'
./xmlchange ELM_CO2_TYPE='diagnostic',CCSM_BGC='CO2A'

./xmlchange DATM_CPLHIST_DIR='/global/cfs/cdirs/m3520/share/cesm_inputdata/hist/monthly_data/'
./xmlchange DATM_CPLHIST_DOMAIN_FILE=${domainPath}${domainFile}
./xmlchange DATM_CPLHIST_YR_START='1950'
./xmlchange DATM_CPLHIST_YR_END='2014'
./xmlchange DATM_CPLHIST_YR_ALIGN='1950'
./xmlchange DATM_CPLHIST_CASE='b.e21.BHIST.f09_g17.CMIP6-historical.011'


cat >> user_nl_elm << EOF
fsurdat = '${domainPath}${surfdataFile}'
do_transient_pfts = .false.
flanduse_timeseries = '${domainPath}${landuseFile}'

hist_empty_htapes = .true.
hist_mfilt = 780,65
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

cat >> user_nl_datm << EOF
streams = "datm.streams.txt.CPLHISTForcing.Solar 1950 1950 2014",
      "datm.streams.txt.CPLHISTForcing.nonSolarFlux 1950 1950 2014",
      "datm.streams.txt.CPLHISTForcing.State3hr 1950 1950 2014",
      "datm.streams.txt.CPLHISTForcing.State1hr 1950 1950 2014",
      "datm.streams.txt.presaero.trans_1850-2000 1849 1849 2015",
      "datm.streams.txt.topo.observed 1 1 1",
      "datm.streams.txt.co2tseries.20tr 1750 1750 2014"
EOF

./case.setup 
./case.build 
echo Build_SUCCESS!

# ---------------------------------------------------------------------------- #
# **************************************************************************** #
# ---------------------------------------------------------------------------- #
cp ./CaseDocs/datm.streams.txt.co2tseries.20tr ./user_datm.streams.txt.co2tseries.20tr
chmod +rw ./user_datm.streams.txt.co2tseries.20tr
perl -w -i -p -e "s@/global/cfs/cdirs/e3sm/inputdata/atm/datm7/CO2@/global/cfs/cdirs/m3520/share/cesm_inputdata/co2@" ./user_datm.streams.txt.co2tseries.20tr
perl -w -i -p -e "s@fco2_datm_1765-2007_c100614.nc@fco2_datm_global_simyr_1750-2014_CMIP6_c180929.nc@" ./user_datm.streams.txt.co2tseries.20tr
sed -i '/ZBOT/d' ./user_datm.streams.txt.co2tseries.20tr

cp ./CaseDocs/datm.streams.txt.presaero.trans_1850-2000 ./user_datm.streams.txt.presaero.trans_1850-2000
chmod +rw ./user_datm.streams.txt.presaero.trans_1850-2000
perl -w -i -p -e "s@/global/cfs/cdirs/e3sm/inputdata/atm/cam/chem/trop_mozart_aero/aero@/global/cfs/cdirs/m3520/share/cesm_inputdata/aero_deposit_data@" ./user_datm.streams.txt.presaero.trans_1850-2000
perl -w -i -p -e "s@aerosoldep_monthly_1849-2006_1.9x2.5_c090803.nc@aerosoldep_monthly_1849-2015_0.9x1.25_CMIP6_c180924.nc@" ./user_datm.streams.txt.presaero.trans_1850-2000
sed -i '/ZBOT/d' ./user_datm.streams.txt.presaero.trans_1850-2000
# ---------------------------------------------------------------------------- #
# **************************************************************************** #
# ---------------------------------------------------------------------------- #

./case.submit

