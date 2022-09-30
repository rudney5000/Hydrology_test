clear all;
close all;
clc;

disp('Read raw data Exercise.xlsx with xlsread');

pkg load statistics

[numdata, txtdata, rawdata] = xlsread('Exercise.xlsx');

% Prepare the temperature matrix
temperature = numdata(:, 2:end);
temperature = fliplr(temperature);
temperature = temperature';

% Prepare the sensors and time
size_of_temperaturematrix = size(temperature);
number_of_sensors = size(temperature,1);
number_of_timeslots = size(temperature,2);

% Prepare time information

time = 0:1:number_of_timeslots-1;

% Doing the plotting

figure(1);

for plotcount = 1:number_of_sensors
  subplot(2,2,plotcount);
  plot(time,temperature(plotcount,:));
  xlabel('Time and date');
  ylabel('Temperature');
  title('Temperature');
end

%Calcule Mean and Standart Deviation
Temp = rmmissing(temperature(:, 1:number_of_timeslots));
Temp2 = reshape(Temp, [], 2);
Mean = mean(Temp, 2);
Deviation = std(Temp, 1);
