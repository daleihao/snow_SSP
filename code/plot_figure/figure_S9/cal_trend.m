%% get hist_BD

dirname = 'C:\Users\haod776\OneDrive - PNNL\Documents\work\E3SM\writting\snow_SSP\CMIP6-data\ELM_simulations\process_code_after_LULCC\data\';


%% plot
colors =  [0.45, 0.80, 0.69;...
    0.98, 0.40, 0.35;...
    0.55, 0.60, 0.79];

res = 0.5;
lon_base = [0+res/2:res:360-res/2];
lat_base =  [90-res/2:-res:20+res/2];
[lons,lats] = meshgrid(double(lon_base),double(lat_base));

filters_TP = lats>27 & lats<42 & lons>65 & lons<105;

fliter_rows = lat_base>27 & lat_base<40;
fliter_cols = lon_base>65 & lon_base<105;


%% plot sensitivity
%% hist
load([dirname 'April_mean_hist_run_1950_2014_Control_revise2.mat']);

mean_SWE_hist = SWE_means;

tmp = nanmean(mean_SWE_hist(:,:,(end-20+1):end),3);
tmp = flipud(tmp');
filters_TP = filters_TP & (tmp>5);



swe_threshold = 5;


mean_SWE_hist = mean_SWE_hist(:,:,32:(end-4));
Slope_SWEs = nan(size(mean_SWE_hist,[1,2])); % & mean_swes_1995(row_i,col_i)>swe_threshold 
p_val_SWEs = nan(size(mean_SWE_hist,[1,2])); % & mean_swes_1995(row_i,col_i)>swe_threshold 

Years = [1981:2010];
for row_i = 1:size(mean_SWE_hist, 1)
    for col_i = 1:size(mean_SWE_hist, 2)
        SWEs_tmp = squeeze(mean_SWE_hist(row_i,col_i,:));
        if(sum(isnan(SWEs_tmp))<1 & sum(SWEs_tmp)>0 ) %mean_SWE_hist
            [taub tau h sig Z S sigma sen n senplot CIlower CIupper D Dall C3 nsigma] = ktaub([Years' SWEs_tmp(:)], 0.05, 0);
            Slope_SWEs(row_i,col_i) = sen;
            p_val_SWEs(row_i,col_i) = sig;
        end
    end
end

%% figure;
Slope_SWEs = flipud(Slope_SWEs');
figure;
colormap jet
imagesc(Slope_SWEs,[-3 3])


