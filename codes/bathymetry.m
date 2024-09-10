% load /ocean/rich/home/dens14/VENTS 
% lp=load('/ocean/rich/home/dens14/Linep_201402');
figure
m_proj('azimuthal equal-area','latitude',103,'long',-55,'radius',6.5,...
    'rectbox','on');
% Reducing::latitude-shifts up, longitude-shifts left, LAT 90 AND RADIUS 25
m_etopo2('contourf',[-5000:1000:0 -500 -200 0],'linest','none'); %,...   %
%         'linest','none');                             % To plot contour
%         lines  
colormap([m_colmap('blues',128)]);                      % To add light blue color water/blue
% m_coast('patch',[.7 .7 .7],'edgecolor','black');        % Color the land area
m_gshhs_i('patch',[.8 .8 .8]);
% offs=9036842.762500/6371228;
brighten(.4);
m_grid('linewi',3,'tickdir','in','fontsize',18,'yaxis','right','xaxis','top');% To show lat long circles bold Add -- ,'linest','-','fonts',8 -- 
% m_grid('linewi',3,'tickdir','in','fontsize',18);% Add -- ,'linest','-','fonts',8 -- 
caxis([-6000 0]);

ax = gca;
cb = colorbar('Location','eastoutside');
% cb.Position = cb.Position + [-0.045 0 -0.02 0];
set(cb,'fontsize',11,'fontweight','bold');
set(get(cb,'title'),'string','Ocean Depth (m)','fontsize',13);

% xlabel(cb,'Ocean depth (m)','fontsize',12);
title({'Arctic Ocean - Depth',''},'fontsize',18,'fontweight','bold');
%To Show Mooring locations
moor = readtable('D:\One-drive\OneDrive - University of Alaska\UAF\NABOS\work\bathymetry\moor.xlsx');
% h1=m_line(moor.Long,moor.Lat,'marker','o','color','k',...            % Purple Color: [.5 0 .5] Orient Red: #A43338
%           'linest','none','markerfacecolor','#D7A0A6','clip','point',... %Light PInk: #D7A0A6
%           'markersize',6.5);
h1=m_line(moor.Long,moor.Lat,'marker','o','color','r','linewi',1.5,...              % Purple Color: [.5 0 .5] Orient Red: #A43338
'linest','none','markerfacecolor','y','clip','point',...               % Light PInk: #D7A0A6
'markersize',10);

% Name Moorings
m_text(130,76.5,{'M1_1'},'fontsize',25,'fontweight','bold');
m_text(124,77.2,{'M1_2'},'fontsize',25,'fontweight','bold');
m_text(124,77.9,{'M1_3'},'fontsize',25,'fontweight','bold');
m_text(124,78.7,{'M1_4'},'fontsize',25,'fontweight','bold');
m_text(124,80.2,{'M1_5'},'fontsize',25,'fontweight','bold');
m_text(140,80,{'M3'},'fontsize',25,'fontweight','bold');
% m_text(128,76.7,{'m1-2a'},'fontsize',25,'fontweight','bold');
% m_text(128,78.1,{'m1-3a'},'fontsize',25,'fontweight','bold');
% m_text(125.99,80.0,{'m1-5a'},'fontsize',25,'fontweight','bold');
% m_text(127.5,81.5,{'M1-6a'},'fontsize',25,'fontweight','bold');
% m_text(95,82,{'M6b'},'fontsize',25,'fontweight','bold');

% Other Text
opacity = 0.4; % 40 percent visible = mainly transparent
my_color = [0 0 1];
% m_text(125.98,75.3,{'Cen'},'fontsize',25,'fontweight','bold','color','b');
% m_text(112.98,77.4,{'NW'},'fontsize',25,'fontweight','bold','color',(1 - opacity * (1 - my_color)));
% m_text(142,77.8,{'NE'},'fontsize',25,'fontweight','bold','color',(1 - opacity * (1 - my_color)));
% (1 - opacity * (1 - my_color))
m_text(130,75, 'Laptev Sea','fontweight','bold','Color', (1 - opacity * (1 - my_color)),'fontsize',25);

% % Colorbar
% ax = gca;
% cb = colorbar('Location','eastoutside');
% cb.Position = cb.Position + [-0.045 0 -0.02 0];
% set(cb,'fontsize',11,'fontweight','bold');
% % h=colorbar('eastoutside');
% % set(h,'tickdir','out');
% set(get(cb,'title'),'string','Ocean Depth (m)','fontsize',10);

