function mean_value = cal_mean_value(data)
res = 0.5;
lon_base = [0+res/2:res:360-res/2];
lat_base =  [90-res/2:-res:20+res/2];
[lons,lats] = meshgrid(double(lon_base),double(lat_base));
radius = 6378137;
res_lat = 0.5;
res_lon = 0.5;
height = radius * res_lat*pi/180;
width2 = radius*(cos((lats-res_lat/2)*pi/180)+cos((lats+res_lat/2)*pi/180))/2 * res_lon*pi/180;
Areas = width2.*height/1e6;

tmp = flipud(data');
filters = lats> 59 & lats <=90 & lons > (360-63) & lons < (360-11);
tmp(filters) = nan;
Areas(isnan(tmp)) = nan;
mean_value = nansum(tmp(:).*Areas(:))./nansum(Areas(:));
