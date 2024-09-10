load("D:\One-drive\OneDrive - University of Alaska\UAF\NABOS\work\season13-18\mat-data\mat-cell-moordata",'-mat')
% run('D:\One-drive\OneDrive - University of Alaska\UAF\NABOS\work\season13-18\icedata\read_ice.m')
run('D:\One-drive\OneDrive - University of Alaska\UAF\NABOS\work\season13-18\codes\customcolor.m')
load("D:\One-drive\OneDrive - University of Alaska\UAF\NABOS\work\season13-18\mat-data\mid_zeropoints",'-mat')

anomS_1=anom(M1_1{4,2});
% Removing M1_2a data as its is not a good data

M1_2{4,2}(:,1:736)=NaN;
anomS_2=anom(M1_2{4,2});
% sm2 = abs(anomS_2(37:62,126:186));  %(35:70,110:200));
% % % sm2(sm2<0.001 & sm2>0) =NaN;
% sm2( sm2>0.21) =NaN;
% % % sm2=inpaintn(sm2);
% % anomS_2(37:62,126:186)=sm2;
% ind= isnan(anomS_2);
% M1_2{4,2}(ind) = NaN;
% M1_2{4,2}(37:62,126:186)=inpaintn(M1_2{4,2}(37:62,126:186));
% anomS_2=anom(M1_2{4,2});

% % To Remove the Dots in M1_2 mooring location
% col=[139:141,167:169,179:181,171:173,159:161,127:129,143:145,175:177,163:165,183:185,131:133];
% row=[38,39,44,48,49,50,50,50,56,59,61];
% anomS_2 (row,col)=NaN;
% anomS_2(34:313,110:736) = inpaintn(anomS_2(34:313,110:736)); % integrating the section of M1_2

anomS_3=anom(M1_3{4,2});

anomS_4=anom(M1_4{4,2});
anomS_4(:,706:707)=NaN;
anomS_4(30:end,600:800) = fillmissing(anomS_4(30:end,600:800),'linear');

anomS_5=anom(M1_5{4,2});
anomS_6a=anom(M1_6{4,2});
anomS_3ef=anom(M_3ef{4,2});
anomS_6b=anom(M_6b{4,2});
anomS_3ef(:,738) = NaN;
% Not including indx for xlines from vertical extn_spec script as it is
% giving big range



%%
x1 = (datetime([2013,08,26]) + caldays(0:1849))'; % till 18 Sept 2018
tt=cellstr(datestr(x1,'m'));
mycolor = [0 0 0];
mycolor1=[0.6350 0.0780 0.1840]; %[1 0 0];
fig=figure;
t = tiledlayout(6,2);

% TILE 1
h1=nexttile(1,[1 2]);
% t1=755; t2=1259; %% New t1 and t2
nd=middlepts.M1_1(1:7);
imAlpha=ones(size(anomS_1));
imAlpha(isnan(anomS_1))=0;
imagesc(datenum(M1_1{2,2}),M1_1{1,2},anomS_1,'AlphaData',imAlpha)
colormap(h1,ornwhtprpl);
% ylim([50 233])
ylim([50  250])
set(gca,'TickDir','in','clim',[-0.5 0.5]);
% vertical lines
dk_vert_line(M1_1{2,2},M1_4{2,2},nd(4),nd(7),31,mycolor1)
xtickangle(360)

% TILE 2
h2=nexttile(3,[1 2]);
% t1=808; t2=1293;
nd=middlepts.M1_2(1:7);
imAlpha=ones(size(anomS_2));
imAlpha(isnan(anomS_2))=0;
imagesc(datenum(M1_2{2,2}),M1_2{1,2},anomS_2,'AlphaData',imAlpha)
colormap(ornwhtprpl);
% ylim([30 600])
ylim([30  250])
set(gca,'TickDir','in','clim',[-0.5 0.5]);
% ax=gca; set(gca, 'YGrid', 'off', 'XGrid', 'on','GridLineStyle','--')
% vertical lines
dk_vert_line(M1_2{2,2},M1_4{2,2},nd(4),nd(7),31,mycolor1)
xtickangle(360)


% TILE 3
h3=nexttile(5,[1 2]);
% t1=815; t2=1277;
nd=middlepts.M1_3(1:7);
imAlpha=ones(size(anomS_3));
imAlpha(isnan(anomS_3))=0;
imagesc(datenum(M1_3{2,2}),M1_3{1,2},anomS_3,'AlphaData',imAlpha)
colormap(h3,ornwhtprpl);
%h = colorbar;
%set(get(h,'title'),'string','dS (psu)','fontsize',8);
% ylim([64 600])
ylim([64  250])
set(gca,'TickDir','in','clim',[-0.5 0.5]);
% vertical lines
dk_vert_line(M1_3{2,2},M1_4{2,2},nd(4),nd(7),31,mycolor1)
xline(datenum(x1(1392)),'Color',mycolor,'LineWidth',1.5);
xtickangle(360)


% TILE 4
h4=nexttile(7,[1 2]);
% t1=842; t2=1260;
nd=middlepts.M1_4(1:7);
imAlpha=ones(size(anomS_4));
imAlpha(isnan(anomS_4))=0;
imagesc(datenum(M1_4{2,2}),M1_4{1,2},anomS_4,'AlphaData',imAlpha)
colormap(ornwhtprpl);
% ylim([60 600])
ylim([60  250])
set(gca,'TickDir','in','clim',[-0.5 0.5]);
dk_vert_line(M1_4{2,2},M1_4{2,2},nd(4),nd(7),31,mycolor1)
xtickangle(360)

% % TILE 5
h5=nexttile(9,[1 2]);
% t1=735+25; t2=1069+174;
nd=middlepts.M1_5(1:7);
imAlpha=ones(size(anomS_5));
imAlpha(isnan(anomS_5))=0;
imagesc(datenum(M1_5{2,2}),M1_5{1,2},anomS_5,'AlphaData',imAlpha)
colormap(h5,ornwhtprpl);
ylim([53 250])
set(gca,'TickDir','in','clim',[-0.5 0.5]);
dk_vert_line(M1_5{2,2},M1_4{2,2},nd(4),nd(7),31,mycolor1)
xtickangle(360)


% TILE 6
h6=nexttile(11,[1 2]);
% h5=nexttile(9,[1 2]);
% t1=834; t2=1349; %% New t1 and t2
nd=middlepts.M3(1:7);
imAlpha=ones(size(anomS_3ef));
imAlpha(isnan(anomS_3ef))=0;
imagesc(datenum(M_3ef{2,2}),M_3ef{1,2},anomS_3ef,'AlphaData',imAlpha)
colormap(ornwhtprpl);
%h = colorbar;
%set(get(h,'title'),'string','dS (psu)','fontsize',8);
% ylim([37 565])
ylim([48 200])
set(gca,'TickDir','in','clim',[-0.5 0.5]);
dk_vert_line(M_3ef{2,2},M1_4{2,2},nd(4),nd(7),31,mycolor1)
xtickangle(360)

%%%
cb = colorbar;
cb.Layout.Tile = 'east';
set(get(cb,'title'),'string','dS (psu)','fontsize',11);
cb.FontSize=11;
sgtitle('Anom Salinity 2013-18','Fontsize',15,'Color','r')

t.Padding = 'compact';
t.TileSpacing = 'tight';
% title(t,{'','Moor Temp 2013-15',''},'Color','#A2142F','fontsize',10);
% xlabel(t,'Time (year)','fontsize',11)
ylabel(t,'Depth (m)','fontsize',13,'FontWeight','bold')

%%%
annotation('textbox',[0.80 0.84 0.10 0.024],'String','M1-1','FontSize',15,...
    'FontName','Chaparral Pro','FontAngle','italic','FitBoxToText','off','EdgeColor','none');
%[0.84 0.85 0.10 0.024]
annotation('textbox',[0.80 0.68 0.15 0.029],'String','M1-2','FontSize',15,...
    'FontName','Chaparral Pro','FontAngle','italic','FitBoxToText','off','EdgeColor','none');
%[0.84 0.68 0.15 0.029]
annotation('textbox',[0.80 0.52 0.17 0.029],'String','M1-3','FontSize',15,...
    'FontName','Chaparral Pro','FontAngle','italic','FitBoxToText','off','EdgeColor','none');
%[0.84 0.53 0.17 0.029]
annotation('textbox',[0.78 0.37 0.15 0.029],'String','M1-4','FontSize',15,...
    'FontName','Chaparral Pro','FontAngle','italic','FitBoxToText','off','EdgeColor','none');
%[0.84 0.37 0.15 0.029]
annotation('textbox',[0.80 0.22 0.17 0.029],'String','M1-5','FontSize',15,...
    'FontName','Chaparral Pro','FontAngle','italic','FitBoxToText','off','EdgeColor','none');

annotation('textbox',[0.81 0.06 0.17 0.029],'String','M3','FontSize',15,...
    'FontName','Chaparral Pro','FontAngle','italic','FitBoxToText','off','EdgeColor','none');

% YEARS

%%%
annotation('textbox',[0.065 0.01 0.066 0.029],'String',{'2013'},'FontSize',16,'EdgeColor','none');
annotation('textbox',[0.183 0.01 0.059 0.028],'String',{'2014'},'FontSize',16,'EdgeColor','none');
annotation('textbox',[0.355 0.01 0.05 0.028],'String',{'2015'},'FontSize',16,'EdgeColor','none');
annotation('textbox',[0.53 0.01 0.059 0.028],'String',{'2016'},'FontSize',16,'EdgeColor','none');
annotation('textbox',[0.705 0.01 0.05 0.028],'String',{'2017'},'FontSize',16,'EdgeColor','none');
annotation('textbox',[0.85 0.01 0.05 0.028],'String',{'2018'},'FontSize',16,'EdgeColor','none');


annotation('textbox',[0.81 0.932 0.18 0.04],'String','Mid point','FontSize',13,...
    'Color','b','FontName','Chaparral Pro','FontAngle','italic','FitBoxToText','off','EdgeColor','none');

% annotation('textbox',[0.81 0.932 0.18 0.04],'String','Zero cross','FontSize',13,...
%     'Color','b','FontName','Chaparral Pro','FontAngle','italic','FitBoxToText','off','EdgeColor','none');

