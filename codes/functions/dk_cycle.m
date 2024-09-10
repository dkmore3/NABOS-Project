
function result = dk_cycle(DateArray, Fwc_timeseries)

% Form a Table from the DataArray
data = table(DateArray,Fwc_timeseries);
data.Properties.VariableNames(1) = "Date";
data.Properties.VariableNames(2) = "fwcts";

% Convert 'Date' column to datetime if it is not already
data.Date = datetime(data.Date, 'InputFormat', 'yyyy-MM-dd');

% Extract the month and day as separate variables
data.Month = month(data.Date);
data.Day = day(data.Date);

% Remove February 29th from the data
    isFeb29 = (data.Month == 2) & (data.Day == 29);
    data(isFeb29, :) = [];

% Initialize a table to store the results
uniqueDays = unique(data(:, {'Month', 'Day'}), 'rows');
avgValues = zeros(height(uniqueDays), 1);

% Loop through each unique month-day and calculate the average
for i = 1:height(uniqueDays)
    mask = (data.Month == uniqueDays.Month(i)) & (data.Day == uniqueDays.Day(i));
    avgValues(i) = mean(data.fwcts(mask),'omitnan');
end

seascycle= season_adj(avgValues,365);
dateTimes = datetime(2016, uniqueDays.Month, uniqueDays.Day);

% Combine the results into a table
result = table(dateTimes, seascycle', avgValues, 'VariableNames', {'MonthDay','SeasCycle', 'AverageValue'});
end
