function plot_global_map(lats, lons, sw_total, min_clr, max_clr, title_text)
axis equal
m_proj('stereographic','lat',90,'long',0,'radius',65); % robinson Mollweide
%m_proj('miller','lat',[25 60],'lon',[0 360]);
%m_proj('lambert','long',[0 320],'lat',[23.5 60]);
lons = [lons lons(:,1)];
lats = [lats lats(:,1)];
%sw_total = flipud(sw_total');
sw_total = [sw_total sw_total(:,1)];

%sw_total = log10(sw_total);
%sw_total(lats>66.5) = nan; 

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
m_coast('color','k');
m_grid('tickdir','in','linestyle','--', 'gridcolor',[0.7 0.7 0.7],...
        'fontsize',8,'tickstyle','dd','xtick',12,'ytick',6, 'yticklabels',[],'xticklabels',[]);
%
shading flat

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