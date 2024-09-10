% Function to extract dates and save
function day = dk_extractseas(Cell,t)
dd= t(7) - t(4) + 1;
day(1,1)= Cell{2,2}(t(4) - dd); % Ta

if t(4)== 815 && t(7)==1277 % M1_3 Zero Crossing
    day(2,1) = Cell{2,2}(1390);
elseif t(4)== 827 && t(7)==1279  % M1_3 middle pt
    day(2,1) = Cell{2,2}(1390);
elseif    t(4)== 834 && t(7)==1348 % M3 zero crossing
    day(2,1) = Cell{2,2}(1833);
elseif    t(4)== 847 && t(7)==1340 % M3 middle pt
    day(2,1) = Cell{2,2}(1833);
else
    day(2,1)= Cell{2,2}(t(7) + dd); % Tb
end
day(3,1)= Cell{2,2}(t(1));
day(4,1)= Cell{2,2}(t(2));
day(5,1)= Cell{2,2}(t(3));
day(6,1)= Cell{2,2}(t(4));
day(7,1)= Cell{2,2}(t(5));
day(8,1)= Cell{2,2}(t(6));
day(9,1)= Cell{2,2}(t(7));
% [y, m, d] =ymd(day);
% day(1:4,2) = datetime(y(:,1)-1,m(:,1),d(:,1));
% day(:,3) = datetime(y(:,1)+1,m(:,1),d(:,1));
end

