file_name = '../data/aerodep_clm_SSP126_b.e21.BSSP126cmip6.f09_g17.CMIP6-SSP1-2.6.001_2014-2101_monthly_0.9x1.25_c190523.nc';



BC1s = ncread(file_name,'BCDEPWET');
BC2s = ncread(file_name,'BCPHIDRY');
BC3s = ncread(file_name,'BCPHODRY');
BCs = (BC1s+BC2s+BC3s)*1e11;
lat = ncread(file_name,'lat');
lon = ncread(file_name,'lon');

[lons,lats] = meshgrid(double(lon),double(flipud(lat)));

BCs_yearly = nan([size(BCs,[1,2]),86]);
for year_i = 2014:2101
    index_i = year_i - 2013;
    month_i_all = (index_i-1)*12 + [1 2 3 4 5 12];
BCs_yearly(:,:,index_i) = nanmean(BCs(:,:,month_i_all),3);
end

Slope_BCs = nan(size(BCs_yearly,[1,2]));
p_val_BCs = nan(size(BCs_yearly,[1,2]));

Years = [2014:2101];
for row_i = 1:size(BCs_yearly, 1)
    for col_i = 1:size(BCs_yearly, 2)
        BCs_tmp = squeeze(BCs_yearly(row_i,col_i,:));
        if(sum(isnan(BCs_tmp))<1 & sum(BCs_tmp)>0)
        [taub tau h sig Z S sigma sen n senplot CIlower CIupper D Dall C3 nsigma] = ktaub([Years' BCs_tmp], 0.05, 0);
        Slope_BCs(row_i,col_i) = sen;
        p_val_BCs(row_i,col_i) = sig;
        end
    end
end

Slope_BCs(p_val_BCs>=0.05) = nan;
Slope_BCs = flipud(Slope_BCs');
tmp = floor(size(Slope_BCs,2)/2);
Slope_BCs = [Slope_BCs(:,(tmp+1):end) Slope_BCs(:,1:tmp)];
lons = [lons(:,(tmp+1):end) lons(:,1:tmp)];
lons(lons>=180) = lons(lons>=180) - 360;
BCS_2015 = squeeze(BCs_yearly(:,:,1));
BCS_2015 = flipud(BCS_2015');
BCS_2100 = squeeze(BCs_yearly(:,:,end));
BCS_2100 = flipud(BCS_2100');
BCS_2100 = [BCS_2100(:,(tmp+1):end) BCS_2100(:,1:tmp)];
BCS_2015 = [BCS_2015(:,(tmp+1):end) BCS_2015(:,1:tmp)];


%% Dust

Dust1s = ncread(file_name,'DSTX01DD');
Dust2s = ncread(file_name,'DSTX01WD');
Dust3s = ncread(file_name,'DSTX02DD');
Dust4s = ncread(file_name,'DSTX02WD');
Dust5s = ncread(file_name,'DSTX03DD');
Dust6s = ncread(file_name,'DSTX03WD');
Dust7s = ncread(file_name,'DSTX04DD');
Dust8s = ncread(file_name,'DSTX04WD');
Dusts = (Dust1s + Dust2s + Dust3s + Dust4s + ...
    Dust5s + Dust6s + Dust7s + Dust8s)*1e8;
    
lat = ncread(file_name,'lat');
lon = ncread(file_name,'lon');

[lons,lats] = meshgrid(double(lon),double(flipud(lat)));

Dusts_yearly = nan([size(Dusts,[1,2]),86]);
for year_i = 2014:2101
    index_i = year_i - 2013;
    month_i_all = (index_i-1)*12 + [1 2 3 4 5 12];
Dusts_yearly(:,:,index_i) = nanmean(Dusts(:,:,month_i_all),3);
end

Slope_Dusts = nan(size(Dusts_yearly,[1,2]));
p_val_Dusts = nan(size(Dusts_yearly,[1,2]));

Years = [2014:2101];
for row_i = 1:size(Dusts_yearly, 1)
    for col_i = 1:size(Dusts_yearly, 2)
        Dusts_tmp = squeeze(Dusts_yearly(row_i,col_i,:));
        if(sum(isnan(Dusts_tmp))<1 & sum(Dusts_tmp)>0)
        [taub tau h sig Z S sigma sen n senplot CIlower CIupper D Dall C3 nsigma] = ktaub([Years' Dusts_tmp], 0.05, 0);
        Slope_Dusts(row_i,col_i) = sen;
        p_val_Dusts(row_i,col_i) = sig;
        end
    end
end

Slope_Dusts(p_val_Dusts>=0.05) = nan;
Slope_Dusts = flipud(Slope_Dusts');
tmp = floor(size(Slope_Dusts,2)/2);
Slope_Dusts = [Slope_Dusts(:,(tmp+1):end) Slope_Dusts(:,1:tmp)];
lons = [lons(:,(tmp+1):end) lons(:,1:tmp)];
lons(lons>=180) = lons(lons>=180) - 360;
DustS_2015 = squeeze(Dusts_yearly(:,:,1));
DustS_2015 = flipud(DustS_2015');
DustS_2100 = squeeze(Dusts_yearly(:,:,end));
DustS_2100 = flipud(DustS_2100');
DustS_2100 = [DustS_2100(:,(tmp+1):end) DustS_2100(:,1:tmp)];
DustS_2015 = [DustS_2015(:,(tmp+1):end) DustS_2015(:,1:tmp)];


%% plot
colors_1 = flipud(brewermap(101, 'Spectral'));
figure;
subplot(231)
colormap(colors_1)
plot_global_map(lats, lons, BCS_2015, 0,1,"2015 BC");
colorbar
subplot(232)
colormap(colors_1)
plot_global_map(lats, lons, BCS_2100, 0,1,"2100 BC");
colorbar
subplot(233)
colormap(colors_1)
plot_global_map(lats, lons, Slope_BCs,-0.002,0.002,"Trend BC");
colorbar

subplot(234)
colormap(colors_1)
plot_global_map(lats, lons, DustS_2015, 0,1,"2015 Dust");
colorbar
subplot(235)
colormap(colors_1)
plot_global_map(lats, lons, DustS_2100, 0,1,"2100 Dust");
colorbar
subplot(236)
colormap(colors_1)
plot_global_map(lats, lons, Slope_Dusts,-0.002,0.002,"Trend Dust");
colorbar


