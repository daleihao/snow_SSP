function plot_global_map(lats, lons, sw_total, min_clr, max_clr, title_text)
axis equal
m_proj('stereographic','lat',90,'long',0,'radius',65); % robinson Mollweide

sw_total = flipud(sw_total');
lons = [lons lons(:,1)];
lats = [lats lats(:,1)];
sw_total = [sw_total sw_total(:,1)];

%% remove greenland etween latitudes 59° and 83°N, and longitudes 11° and 74°W. 
filters = lats> 59 & lats <=90 & lons > (360-63) & lons < (360-11);
sw_total(filters) = nan;

m_pcolor(lons,lats,sw_total);

hold on
%m_coord('geographic');


% M=m_shaperead('../../data/TP_shp/ROTW_China');
% for k=1:length(M.ncst)
%     m_line(M.ncst{k}(:,1),M.ncst{k}(:,2),'color','k','linewidth',1);,'backcolor',[.9 .99 1],
% end

% lat_border = [27:40 40*ones(1,41) 40:-1:27 27*ones(1,41)];
% lon_border = [65*ones(1,14) 65:105 105*ones(1,14) 105:-1:65];
% m_line(lon_border, lat_border,'color','r','linewidth',1);

m_coast('color','k');
m_grid('tickdir','in','linestyle','--', 'gridcolor',[0.7 0.7 0.7],...
        'fontsize',8,'tickstyle','dd', 'yticklabels',[],'xticklabels',[],'xtick',12,'ytick',6);

shading flat

%% plot contour
caxis([min_clr-1e-5,max_clr+1e-5])
%colormap(m_colmap('jet','step',10));
%m_text(-170,80,sub_text,'fontsize',10)
%colorbar
%colormap(colors_single);

if iscell(title_text) || title_text ~= ""
    t = title(title_text,'fontsize',12, 'fontweight', 'bold');
%     set(t, 'horizontalAlignment', 'left');
%     set(t, 'units', 'normalized');
%     h1 = get(t, 'position');
%     set(t, 'position', [0 h1(2) h1(3)]);
end

set(gca, 'FontName', 'Time New Roman');

view(0,90);
hold off