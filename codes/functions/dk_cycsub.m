


function [anom_mon, anom] = dk_cycsub(M_cyc,fwc_ts, t1,t2)

B=[];
for i=1:6
        % Concatenate new data to B in two columns at once
        B = [B; M_cyc.SeasCycle, M_cyc.AverageValue];
end
x1 = (datetime(2013,01,01) + caldays(0:2189)');
M1seas  = timetable(x1,B(:,1),B(:,2));
 M1seas.Properties.VariableNames(1) = "cyc";
M1seas.Properties.VariableNames(2) = "avg";
anom =fwc_ts' - M1seas(t1:t2,:); %240:2072,:);
anom_mon= retime(anom,'monthly','mean');
end
