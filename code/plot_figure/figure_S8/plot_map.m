res = 0.5;
lon_base = [0+res/2:res:360-res/2];
lat_base =  [90-res/2:-res:20+res/2];
[lons,lats] = meshgrid(double(lon_base),double(lat_base));
colors_1 = flipud(brewermap(11, 'Spectral'));
colors_2 = flipud(brewermap(11, 'RdBu'));
colors_2(6,:) = [0.9 0.9 0.9];
%colors_1 = crameri('batlow');
set(gcf,'unit','normalized','position',[0.1,0.05,0.6,0.92]);
set(gca, 'Position', [0 0 1 1])

future_hist_SWE(future_hist_SWE<=5) = nan;
figure;
plot_global_map(lats, lons, future_hist_SWE, 0,400,"Historical");
colormap(colors_1)
colorbar