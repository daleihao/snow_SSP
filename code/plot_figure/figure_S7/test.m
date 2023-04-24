res = 0.5;
lon = [0+res/2:res:360-res/2];
lat =  [90-res/2:-res:20+res/2];

[lons,lats] = meshgrid(double(lon),double(lat));
%load('latlons.mat');
%[lons_i,lats_i] = meshgrid(double(lon_base),double(lat_base));


radius = 6378137;
res_lat = 0.5;
res_lon = 0.5;
height = radius * res_lat*pi/180;
width2 = radius*(cos((lats-res_lat/2)*pi/180)+cos((lats+res_lat/2)*pi/180))/2 * res_lon*pi/180;
Areas = width2.*height/1e6;


filters_TP = lats>27 & lats<42 & lons>65 & lons<105;
