
% Standard Error Code
% Made by Dolly More

function [avgline,SE,meany]= dk_errbar(fwcTs,datecell,n)
% fwcTs=var1;
% t1
%datecell is a matrix in a cell

% x = 1:length(fwcTs);
t1=n(4); t2=n(7);
dd = t2-t1+1;

% Avg lines for each seasons
avgline=NaN(size(fwcTs));




% if t2==1290 || t2==1291
%     mn1=NaN; SE1=NaN;
% else

if t2==1290 || t2==1291 % M1_2
    var1 = fwcTs(757:t1-1);
    mn1= mean(var1,'omitnan');
    avgline(757:t1-1)= mn1; % 1
    date1=datetime(datecell(round((757+t1-1)/2),:));
    var1(var1==0)=NaN;
    var1= fillmissing(var1,'linear');
    SE1=std(var1) ./ sqrt(size(var1,2));
else
    var1 = fwcTs(t1-dd:t1-1);
    mn1= nanmean((var1));
    avgline(t1-dd:t1-2)= mn1; % 1
    var1(var1==0)=NaN;
    var1= fillmissing(var1,'linear');
    date1=datetime(datecell(round((t1-dd+t1-1)./2),:));
    SE1=std(var1)./ sqrt(size(var1,2));
end


var2 = fwcTs(t1:t2-1);
mn2= nanmean((var2));
avgline(t1:t2-2)= mn2; % 2
% Std deviation/errorbar
date2=datetime(datecell(round((t1+t2-1)./2),:));
var2(var2==0)=NaN;
var2= fillmissing(var2,'linear');
SE2=std(var2)./ sqrt(size(var2,2));


if t1== 815 && t2==1277 % M1_3 % ZERO CROSS
    var3 = fwcTs(t2:1376);
    mn3= mean(var3,'omitnan');
    avgline(t2:1376-2)= mn3; % 3
    date3=datetime(datecell(round((t2+1376-1)/2),:));
    var3(var3==0)=NaN;
    var3= fillmissing(var3,'linear');
    SE3=std(var3) ./ sqrt(size(var3,2));

elseif t1== 827 && t2==1279 % M1_3 % MIDDLE PT
    var3 = fwcTs(t2:1376);
    mn3= mean(var3,'omitnan');
    avgline(t2:1376-2)= mn3; % 3
    date3=datetime(datecell(round((t2+1376-1)/2),:));
    var3(var3==0)=NaN;
    var3= fillmissing(var3,'linear');
    SE3=std(var3) ./ sqrt(size(var3,2));

elseif t1== 834 && t2==1348 %M3 % ZERO CROSS
    dnx3= length(datecell);
    var3 = fwcTs(t2:1833);
    mn3= mean(var3,'omitnan');
    avgline(t2:dnx3-2)= mn3; % 3
    date3=datetime(datecell(round((t2+dnx3-1)./2),:));
    var3(var3==0)=NaN;
    var3= fillmissing(var3,'linear');
    SE3=std(var3) ./ sqrt(size(var3,2));

elseif t1== 847 && t2==1340 %M3 % MIDDLE PT
    dnx3= length(datecell);
    var3 = fwcTs(t2:1833);
    mn3= mean(var3,'omitnan');
    avgline(t2:dnx3-2)= mn3; % 3
    date3=datetime(datecell(round((t2+dnx3-1)./2),:));
    var3(var3==0)=NaN;
    var3= fillmissing(var3,'linear');
    SE3=std(var3) ./ sqrt(size(var3,2));
else
    var3 = fwcTs(t2:t2+dd-1);
    mn3= nanmean((var3));
    avgline(t2:t2+dd-1)= mn3; % 3
    % Std deviation/errorbar
    date3=datetime(datecell(round((t2+t2+dd-1)./2),:));
    var3(var3==0)=NaN;
    var3= fillmissing(var3,'linear');
    SE3=std(var3) ./ sqrt(size(var3,2));
end

BarColor ='r';

% if t2==1290 || t2==1291
% SE = [SE2;SE3];
% datex = [date2;date3];
% meany = [mn2;mn3];
% err=errorbar(datex,meany,3*SE,BarColor);
% else
SE = [SE1;SE2;SE3];
datex = [date1;date2;date3];
meany = [mn1;mn2;mn3];

err=errorbar(datex,meany,3*SE,BarColor);
% end
err.LineStyle = 'none';
end

