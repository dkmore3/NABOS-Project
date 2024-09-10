%% Made by Dolly More
% It gives average of event of each year
% Calculated average of Sep to Aug of next year
% for depth surface to 150m. Got average of each depth and
% later average over all depths to get one single value of average.

function moor_mean=dk_eventavg(depth,Date,T,S,B)

if Date(1) > datetime(2013,08,31)
    t0=1;
else if Date(1) <= datetime(2013,08,31)
        t0=find(datetime(2013,08,31) == Date,1, 'first');
    end
end
% t0 = find(datetime(2013,08,31) == Date,1, 'first');
t1 = find(datetime(2014,08,31) == Date,1, 'first');
t2 = find(datetime(2015,08,31) == Date,1, 'first');
t3 = find(datetime(2016,08,31) == Date,1, 'first');
t4 = find(datetime(2017,08,31) == Date,1, 'first');
% t5 = find(datetime(2018,08,31) == Date,1, 'first');
ln=length(Date);
if Date(end) < datetime(2018,08,31)
    t5=ln;
else if Date(end) >= datetime(2018,08,31)
        t5=find(datetime(2018,08,31) == Date,1, 'first');
    end
end


dz = find(150 <= depth,1, 'first');

% Temperature
meanT_14=nanmean(T(1:dz,t0+1:t1),2);
meanT_15=nanmean(T(1:dz,t1+1:t2),2);
meanT_16=nanmean(T(1:dz,t2+1:t3),2);
meanT_17=nanmean(T(1:dz,t3+1:t4),2);
meanT_18=nanmean(T(1:dz,t4+1:t5),2);
avgT=nanmean(T(1:dz,:),2);
meanT= table(meanT_14,meanT_15,meanT_16,meanT_17,meanT_18,avgT);
Tmn=nanmean(meanT{:,:});

% Salinity
meanS_14=nanmean(S(1:dz,t0+1:t1),2);
meanS_15=nanmean(S(1:dz,t1+1:t2),2);
meanS_16=nanmean(S(1:dz,t2+1:t3),2);
meanS_17=nanmean(S(1:dz,t3+1:t4),2);
meanS_18=nanmean(S(1:dz,t4+1:t5),2);
avgS=nanmean(S(1:dz,:),2);
meanS= table(meanS_14,meanS_15,meanS_16,meanS_17,meanS_18,avgS);
Smn=nanmean(meanS{:,:});

% Bouyancy
meanB_14=nanmean(B(1:dz,t0+1:t1),2);
meanB_15=nanmean(B(1:dz,t1+1:t2),2);
meanB_16=nanmean(B(1:dz,t2+1:t3),2);
meanB_17=nanmean(B(1:dz,t3+1:t4),2);
meanB_18=nanmean(B(1:dz,t4+1:t5),2);
avgB=nanmean(B(1:dz,:),2);
meanB= table(meanB_14,meanB_15,meanB_16,meanB_17,meanB_18,avgB);
Bmn=nanmean(meanB{:,:});
Years={2014;2015;2016;2017;2018;'AllYears'};
varNam = {'Years','Tavg','Savg','Bavg'};
%
moor_mean=table(Years,Tmn',Smn',Bmn','VariableNames',varNam);
end




