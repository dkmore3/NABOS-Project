%% Made by Dkm

% Calculate Fresh water Content Time series
% FORMULA : Fwc = sum{[(Sal_data  - 34.8)/34.8]*dz} % Fwc_prf0,Fwc_prf1,Fwc_prf2

function [Fwc_timeseries,FWC_mat,Anom_prof,Fwc_prf]= dk_fwc(var,dp0,dp1,n) 

% Fwc calculation integrated
So= 34.8;  % Constant salinity
depth = var{1,2};
ind0=find(depth >=dp0,1,'first');
ind=find(depth >=dp1,1,'first');
 % dx=ind-ind0+1;
 S=[];
S (ind0:ind,:)= var{4,2}(ind0:ind,:);
[~, tm]=size(S);
FWC_mat=NaN(ind,tm);

for k=ind0:ind-1
    for m=1:tm
        dz = (depth(k+1,:) - depth(k,:));
        Ssub = bsxfun(@minus, S(k,m),So);
        FWC_mat(k,m)= (1/So).*(Ssub.*dz);
    end
end

% seperating profiles
dd = n(7)-n(4)+1;
Fwc_prf0 = mean(FWC_mat(:,n(4)-dd:n(4)),2,'omitnan'); % prior
Fwc_prf1 = mean(FWC_mat(:,n(4):n(7)),2,'omitnan');    % event
if n(7)==1290 &&  n(7)==1291            % M1_2 Zerocross/midpt
Fwc_prf2 = mean(FWC_mat(:,n(7):n(7)+dd),2,'omitnan');
elseif n(4)== 815 && n(7)==1277 % M1_3 % zero cross
    Fwc_prf2 = mean(FWC_mat(:,n(7):1376),2,'omitnan'); % later
elseif n(4)== 827 && n(7)==1279 % M1_3 % % middle pt
    Fwc_prf2 = mean(FWC_mat(:,n(7):1376),2,'omitnan'); % later
    
elseif    n(4)== 834 && n(7)==1348 % M3 % zero cross
    Fwc_prf2 = mean(FWC_mat(:,n(7):1833),2,'omitnan'); % later
elseif    n(4)== 847 && n(7)==1340 % M3 % middle pt
    Fwc_prf2 = mean(FWC_mat(:,n(7):1833),2,'omitnan'); % later
    
else
    Fwc_prf2 = mean(FWC_mat(:,n(7):(n(7)+dd)),2,'omitnan');
end

avg_prf = (Fwc_prf0 + Fwc_prf2)./2;  % AVERAGE PROFILE
Anom_prof = bsxfun(@minus, Fwc_prf1,avg_prf);
Fwc_prf= [Fwc_prf1,Fwc_prf0,Fwc_prf2];
Fwc_timeseries=sum(FWC_mat(1:ind,:),"omitnan");

end
