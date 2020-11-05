%% Assignment 4 - KINE 6203
% Title: Analyzing Isometric Strength Data
% Written by: Patricia M. Butler
% Date: November 5, 2020
%
% Description: This script analyzes isometric strength data from a strength training
% research protocol.

% Developed on Matlab version R2019b, Update 3, with Windows 10 Version

%% Clearing Workspace and Command Window
% This section clears the workspace of any saved variables and clears the
% command window

clc         % Clearing Command Window
clear all   % Clearing Workspace

%% Analyzing Isokinetic Data
% This section imports the cvs file 'isok_data_6803.csv' and determines the
% isometric averages of the males, the females, individual males, and individual
% females. It also determines what subjects had higher isometric strength
% values for day 2 compared to day 1 as well as day 3 to day 2.

% Assigning each variable as a specific vector
[SubjectID, Age, Gender, Weight, Day1, Day2, Day3] = importfile('isok_data_6803.csv');

% Determining isokinetic mean data for individual males, indivdual females,
% the male group, and the female group.
[maleIsoIndMeans, femaleIsoIndMeans, maleGroupIsoMean, femaleGroupIsoMean] = genderIsoCalc(Gender,Day1,Day2,Day3)

% Determining what subjects had higher isometric strength values on day 2 when compared to day 1
firstInputDay = Day1;
secondInputDay = Day2;
[day1toDay2] = dayComparer(SubjectID, firstInputDay, secondInputDay)

% Determining what subjects had higher isometric strength values on day 3 when compared to day 2
firstInputDay = Day2;
secondInputDay = Day3;
[day2toDay3] = dayComparer(SubjectID, firstInputDay, secondInputDay)

% Weight normalizing isokinetic data for each day
 normDay1 = Day1./Weight;
 normDay2 = Day2./Weight;
 normDay3 = Day3./Weight;

% Determining averages of the normalized data for each day
normDay1mean = mean(normDay1)
normDay2mean = mean(normDay2)
normDay3mean = mean(normDay3)

%% Exporting results to csvfile named 'iso_results.csv' %%
% This section prepares the variables to be put into a table and then
% creates a table. 

% Establishing Length of Variables
lengthGIM = length(maleGroupIsoMean);       % Length of both gender's group isometric means
lengthMIIM = length(maleIsoIndMeans);       % Length of male isometric individual means
lengthFIIM = length(femaleIsoIndMeans);     % Length of female isometric individual means
lengthd1d2 = length(day1toDay2);            % Length of day1toDay2
lengthd2d3 = length(day2toDay3);            % Length of day2toDay3
lengthNormDayMean = length(normDay1mean);   % Length of norm day mean

% Finding which variable was the longest
maxLength = max([lengthGIM lengthMIIM lengthFIIM lengthd1d2 lengthd2d3 lengthNormDayMean])

% Making each variable the same length by adding 0 to the numerical values
% and "NaN" to the strings

% Changing length of maleGroupIsoMean and femaleGroupIsoMean
for n = (lengthGIM:(maxLength-1))
    maleGroupIsoMean(end+1) = 0;
    femaleGroupIsoMean(end+1) = 0;
end

% Changing length of maleIsoIndMeans
for n = (lengthMIIM:(maxLength-1))
    maleIsoIndMeans(end+1) = 0;
    femaleIsoIndMeans(end+1)= 0;
end

% Changing length of femaleIsoIndMeans
for n = (lengthFIIM:(maxLength-1))
    femaleIsoIndMeans(end+1)= 0;
end

% Changing length of day1toDay2 
for n = (lengthd1d2:(maxLength-1))
    day1toDay2(end+1)= 'NaN';
    
end

% Changing length of day2toDay3
for n = (lengthd2d3:(maxLength-1))
    day2toDay3(end+1) = 'NaN';
end

% Changing length of normDay1mean, normDay2mean, and normDay3mean
for n = (lengthNormDayMean:(maxLength-1))
    normDay1mean(end+1) = 0;
    normDay2mean(end+1) = 0;
    normDay3mean(end+1) = 0;
end

% Placing variables into table and establishing variable names
resultsTableInitial = table(maleGroupIsoMean' , femaleGroupIsoMean' ,maleIsoIndMeans' ,femaleIsoIndMeans' ,day1toDay2' ,day2toDay3' ,normDay1mean', normDay2mean', normDay3mean', 'VariableNames',{'maleGroupIsoMean', 'femaleGroupIsoMean', 'maleIsoIndMeans' ,'femaleIsoIndMeans' ,'day1toDay2', 'day2toDay3', 'normDay1mean', 'normDay2mean', 'normDay3mean'})

% standardizing 0's to NaN
resultsTable = standardizeMissing(resultsTableInitial,0)

%% Exporting Data to a csv file
% This section exports the table to a csv file named 'iso_results.csv'

writetable(resultsTable, 'iso_results.csv')