%% Made by Dolly More

%%Anomaly
function anomT=anom(var)
%Averages
avgT=nanmean(var,2);
[Nz, Nt]=size(var);
maskA = isnan(avgT);
maskB = isnan(var);
%Temp Anomaly
for k=1:Nz %408
    for m=1:Nt   %1071
    anomT(k,m)= var(k,m)-avgT(k,1);
    end
end

end

    

