function plot_global_map_trend(lats, lons, sw_total,p_values,slope_values, min_clr, max_clr, title_text,isincrease)
axis equal
m_proj('stereographic','lat',90,'long',0,'radius',65); % robinson Mollweide

lats_1 = lats;
lons_1 = lons;

lons = [lons lons(:,1)];
lats = [lats lats(:,1)];
sw_total = flipud(sw_total');
sw_total1 = sw_total;
sw_total = [sw_total sw_total(:,1)];


% tmp = sw_total;
% tmp(sw_total>0) = log10(1+sw_total(sw_total>0));
% tmp(sw_total<0) = -log10(1-sw_total(sw_total<0));
% 
% sw_total = tmp;
%% remove greenland etween latitudes 59° and 83°N, and longitudes 11° and 74°W. 
filters = lats> 59 & lats <=90 & lons > (360-63) & lons < (360-11);
sw_total(filters) = nan;
filters1 = lats_1> 59 & lats_1 <=90 & lons_1 > (360-63) & lons_1 < (360-11);
sw_total1(filters1) = nan;

m_pcolor(lons,lats,sw_total);
p_values = flipud(p_values');
slope_values = flipud(slope_values');
hold on
%m_coord('geographic');


% M=m_shaperead('../../data/TP_shp/ROTW_China');
% for k=1:length(M.ncst)
%     m_line(M.ncst{k}(:,1),M.ncst{k}(:,2),'color','k','linewidth',1);,'backcolor',[.9 .99 1],
% end
m_coast('color','k');
m_grid('tickdir','in','linestyle','--', 'gridcolor',[0.7 0.7 0.7],...
    'fontsize',8,'tickstyle','dd', 'yticklabels',[],'xticklabels',[],'xtick',12,'ytick',6);

shading flat

if isincrease==1
    filters = p_values<0.05 & slope_values>0;
else
    filters = p_values<0.05 & slope_values<0;  
end

filters(isnan(sw_total1)) = 0;

m_scatter(lons(filters),lats(filters),0.2,'k','filled');
%% plot contour
caxis([min_clr-1e-5,max_clr+1e-5])
%colormap(m_colmap('jet','step',10));
%m_text(-170,80,sub_text,'fontsize',10)
%colorbar
%colormap(colors_single);

if title_text ~= ""
    t = title({title_text},'fontsize',12, 'fontweight', 'bold');
    %     set(t, 'horizontalAlignment', 'left');
    %     set(t, 'units', 'normalized');
    %     h1 = get(t, 'position');
    %     set(t, 'position', [0 h1(2) h1(3)]);
end

set(gca, 'FontName', 'Time New Roman');

view(0,90);
hold off