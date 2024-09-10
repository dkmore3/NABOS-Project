%% Made by Dkm
% Calculate Ocean Potential Energy (APE is calculated outside this function)
function [Ape_ts,PE1,PE_trap1,smoth_anomPE]= dk_ape(var,dp0,dp)
g=9.8 ; %m/s^2
% h=140-65; % height depth
[~, tm]=size(var{3,2});
xx=find(var{1,2}>=dp0,1,'first'); % Finding 65(z)m depth index
zz=find(var{1,2}<=dp,1,'last'); % Finding 144 m depth index
dens=[];
dens(xx:zz,:) = var{5,2}(xx:zz,:);
dens(1:xx-1,:)=NaN;
depth = var{1,2}(1:zz,1); % From 1st to zz
% zx = length(depth); % If depth taken from 1st zx=zz
drhodz1=NaN(zz,tm);
PE1=NaN(zz,tm); 

for k=1:zz
    drhodz1(k,:)=dens(k,:)-dens(zz,:);
    dz = depth(2) - depth(3);
    PE1(k,:)=  g*dz*drhodz1(k,:).*(depth(k));
end

% ind = find(~isnan(PE1(:,1)), 1);
% if isempty(ind)
%     ind = find(~isnan(PE1(:,2)), 1)
% end

% [~, col] = find(PE1<0);
% PE1(:,col)=NaN;
PE_int= fillmissing(PE1(xx:zz,:),"linear");
zy =length(PE_int(:,1));
PE_trap1 = cumtrapz(PE_int(1:zy-1,:));
% Ape_ts=sum(PE_trap1(2:end,:),"omitnan");
Ape_ts= PE_trap1(zy,:);
Ape_ts(Ape_ts==0)=NaN;
Anom_PE= (Ape_ts - mean(Ape_ts));   % Calculating anomaly of integrated APE
smoth_anomPE=movmean(Anom_PE,3);    % Smoothing the anomalous data
end
%     PE(PE<0) = NaN;

%     index    = isnan(PE);
%     PE(index) = interp1(find(~index), PE(~index), find(index), 'linear');


% % IGNORE NAN
% for i2 = 1:size(PE1,2)
%   i1 = find(isfinite(PE1(:,i2)));
%   if ~isempty(i1)
%     I_OK(:,i2) = [i1(1) i1(end)];
%     PE_CTS{i2} = cumtrapz(PE1(i1,i2));
%   end
% end
% PEtrap = cell2mat(PE_CTS);
% C = reshape(cell2mat( [ PE_CTS{:} ] ),size(PE_CTS))

% PE_trap0 = cumtrapz(PE0(2:zy,:));


% 1=find(var{1,2}<=100,1,'last');

