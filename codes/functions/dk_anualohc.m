

function sesohc=dk_anualohc(var)
[a, b] =size(var);
sesohc=NaN(size(var));
for i=1:a
    % i
    % longest_nonnan_block=[];
    var_ts = var(i,:);              % Take one time series
    var_ts(var_ts==0)=NaN;          % Convert all 0 from timeseries to NaN
    index    = isnan(var_ts);       % count of NaN values
    index2 = ~isnan(var_ts);        % count of nonNaN vlaues
    if sum(index2) < 100            % if count of nonNaN values is less than 100
        sesohc(i,:) = NaN;          % make the OHC -an values of that level to NaN 
    else                            % if count of nonNaN values is more than 100
% To find block of consecutive data in the Time-series
        mask = ~isnan(var_ts(:).'); % Check where are the values
        starts = strfind([false mask], [false true]);   % find index of the seperate block first value
        stops = strfind([mask false], [true false]);    % find index of the seperate block last value
        Df = stops - starts;        % size of different blocks
        mx=find(Df==max(Df));       % Index of bigger block size
        B = sort(Df, 'descend');    % arrane the block size descending order
        
        if length(B) ~= 1           % if there are more than one block
            Max2 = B(2);            % Take the first smaller block
        else                        % if there is jsut one block
            Max2 = B(1);            % take the only block
        end
        
        if Max2>=300                % if the smallest block is bigger than 300 values
            % Interpolation of missing data
            var_ts(index) = interp1(find(~index), var_ts(~index), find(index), 'linear');
        else                        
       % If the smallest block is smaller than 300 values     
            first = starts(mx);     % take the start value of 2nd block
            last = stops(mx);       % take the last value of 2nd block
            S=NaN(1,b);             % make a variable of the size of a timeseries
            S(first:last)=var_ts(first:last);       %just copy the 2nd big block to the new variable
            S(index) = interp1(find(~index), S(~index), find(index), 'linear'); % Interpolate the new variable including the nan values
            var_ts=S;               % Use this new variable S as variable time series for that level where just one block is present
        end
        
        %%%
        mask = ~isnan(var_ts(:).');  % Check where are the values in the vector
        start = strfind([false mask], [false true]);  % find index of the seperate block first value
        stop = strfind([mask false], [true false]);   % find index of the seperate block last value
        [~, idx] = max(stop - start);
        first = start(idx);             % start of the big block
        last = stop(idx);               % end of the big block
        longest_nonnan_block = var_ts(first:last);
        Tseas_adj=season_adj(longest_nonnan_block,365);
        sesohc(i,first:last)=Tseas_adj;
%         sesohc(i,first:last)=rw3;

        if B(1)< 300
            sesohc(i,:) = NaN;
        end
    end
end
%     des_sal = var - sesohc;
end
