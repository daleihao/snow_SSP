file_name = '../data/snc_LImon_CNRM-ESM2-1_ssp585_r5i1p1f2_gr_201501-210012.nc';
%file_name = '../data/snc_LImon_IPSL-CM6A-LR_ssp585_r2i1p1f1_gr_201501-210012.nc';
%file_name = '../data/snc_LImon_CESM2-WACCM_ssp585_r2i1p1f1_gn_201501-210012.nc';



FSNOs = ncread(file_name,'snc');
lat = ncread(file_name,'lat');
lon = ncread(file_name,'lon');

[lons,lats] = meshgrid(double(lon),double(flipud(lat)));

FSNOs_yearly = nan([size(FSNOs,[1,2]),86]);
for year_i = 2015:2100
    index_i = year_i - 2014;
    month_i_all = (index_i-1)*12 + (1:12);
FSNOs_yearly(:,:,index_i) = nanmean(FSNOs(:,:,month_i_all),3);
end

Slope_FSNOs = nan(size(FSNOs_yearly,[1,2]));
p_val_FSNOs = nan(size(FSNOs_yearly,[1,2]));

Years = [2015:2100];
for row_i = 1:size(FSNOs_yearly, 1)
    for col_i = 1:size(FSNOs_yearly, 2)
        Fsnos_tmp = squeeze(FSNOs_yearly(row_i,col_i,:));
        if(sum(isnan(Fsnos_tmp))<1 & sum(Fsnos_tmp)>0)
        [taub tau h sig Z S sigma sen n senplot CIlower CIupper D Dall C3 nsigma] = ktaub([Years' Fsnos_tmp], 0.05, 0);
        Slope_FSNOs(row_i,col_i) = sen;
        p_val_FSNOs(row_i,col_i) = sig;
        end
    end
end

Slope_FSNOs(p_val_FSNOs>=0.05) = nan;
Slope_FSNOs = flipud(Slope_FSNOs');
tmp = floor(size(Slope_FSNOs,2)/2);
Slope_FSNOs = [Slope_FSNOs(:,(tmp+1):end) Slope_FSNOs(:,1:tmp)];
lons = [lons(:,(tmp+1):end) lons(:,1:tmp)];
lons(lons>=180) = lons(lons>=180) - 360;
FSNOS_2015 = squeeze(FSNOs_yearly(:,:,1));
FSNOS_2015 = flipud(FSNOS_2015');
FSNOS_2100 = squeeze(FSNOs_yearly(:,:,end));
FSNOS_2100 = flipud(FSNOS_2100');
FSNOS_2050 = squeeze(FSNOs_yearly(:,:,35));
FSNOS_2050 = flipud(FSNOS_2050');

FSNOS_2100 = [FSNOS_2100(:,(tmp+1):end) FSNOS_2100(:,1:tmp)];
FSNOS_2015 = [FSNOS_2015(:,(tmp+1):end) FSNOS_2015(:,1:tmp)];
FSNOS_2050 = [FSNOS_2050(:,(tmp+1):end) FSNOS_2050(:,1:tmp)];


%% SWE
file_name = '../data/snw_LImon_CNRM-ESM2-1_ssp585_r5i1p1f2_gr_201501-210012.nc';

SWEs = ncread(file_name,'snw');
lat = ncread(file_name,'lat');
lon = ncread(file_name,'lon');

[lons,lats] = meshgrid(double(lon),double(flipud(lat)));

SWEs_yearly = nan([size(SWEs,[1,2]),86]);
for year_i = 2015:2100
    index_i = year_i - 2014;
    month_i_all = (index_i-1)*12 + (1:12);
SWEs_yearly(:,:,index_i) = nanmean(SWEs(:,:,month_i_all),3);
end

Slope_SWEs = nan(size(SWEs_yearly,[1,2]));
p_val_SWEs = nan(size(SWEs_yearly,[1,2]));

Years = [2015:2100];
for row_i = 1:size(SWEs_yearly, 1)
    for col_i = 1:size(SWEs_yearly, 2)
        SWEs_tmp = squeeze(SWEs_yearly(row_i,col_i,:));
        if(sum(isnan(SWEs_tmp))<1 & sum(SWEs_tmp)>0)
        [taub tau h sig Z S sigma sen n senplot CIlower CIupper D Dall C3 nsigma] = ktaub([Years' SWEs_tmp], 0.05, 0);
        Slope_SWEs(row_i,col_i) = sen;
        p_val_SWEs(row_i,col_i) = sig;
        end
    end
end

Slope_SWEs(p_val_SWEs>=0.05) = nan;
Slope_SWEs = flipud(Slope_SWEs');
tmp = floor(size(Slope_SWEs,2)/2);
Slope_SWEs = [Slope_SWEs(:,(tmp+1):end) Slope_SWEs(:,1:tmp)];
lons = [lons(:,(tmp+1):end) lons(:,1:tmp)];
lons(lons>=180) = lons(lons>=180) - 360;
SWES_2015 = squeeze(SWEs_yearly(:,:,1));
SWES_2015 = flipud(SWES_2015');
SWES_2100 = squeeze(SWEs_yearly(:,:,end));
SWES_2100 = flipud(SWES_2100');
SWES_2050 = squeeze(SWEs_yearly(:,:,35));
SWES_2050 = flipud(SWES_2050');

SWES_2100 = [SWES_2100(:,(tmp+1):end) SWES_2100(:,1:tmp)];
SWES_2015 = [SWES_2015(:,(tmp+1):end) SWES_2015(:,1:tmp)];
SWES_2050 = [SWES_2050(:,(tmp+1):end) SWES_2050(:,1:tmp)];


%% plot
colors_1 = flipud(brewermap(101, 'Spectral'));
figure;
subplot(231)
colormap(colors_1)
plot_global_map(lats, lons, FSNOS_2015, 0,100,"2015 FSNO");
colorbar
subplot(232)
colormap(colors_1)
plot_global_map(lats, lons, FSNOS_2050, 0,100,"2100 FSNO");
colorbar
subplot(233)
colormap(colors_1)
plot_global_map(lats, lons, FSNOS_2050 - FSNOS_2015, 0,100,"DIFF");
colorbar

subplot(234)
colormap(colors_1)
plot_global_map(lats, lons, SWES_2015, 0,100,"2015 SWE");
colorbar
subplot(235)
colormap(colors_1)
plot_global_map(lats, lons, SWES_2050, 0,100,"2100 SWE");
colorbar


