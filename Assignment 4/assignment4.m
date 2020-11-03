%% Assignment 4 - KINE 6203
% Title
% Written by: Patricia Butler
% Date: November 5, 2020
%
% Description: This script analyzes isometric strength data from a strength training
% research protocol.

% Developed on Matlab version R2019b, Update 3, with Windows 10 Version

%% Clearing Workspace and Command Window
% This section clears the workspace of any saved variables and clears the
% command window

clc
clear all

%% Analyzing Isokinetic Data
% This section imports the cvs file 'isok_data_6803.csv' and determines the
% isokinetic averages of males, females, individual males and individual
% females. It also determines what subjects had higher isometric strength
% values for 

% Assigning each variable as a specific vector
[SubjectID, Age, Gender, Weight, Day1, Day2, Day3] = importfile('isok_data_6803.csv');

% Determining isokinetic mean data for individual males, indivdual females,
% the male group, and the female group
[maleIsoIndMeans, femaleIsoIndMeans, maleGroupIsoMeanand, femaleGroupIsoMean] = genderIsoCalc(Gender,Day1,Day2,Day3)

% Determining what subjects had higher isometric strength values on day 2 when compared to day 1
firstInputDay = Day1;
secondInputDay = Day2;
[day1toDay2] = dayComparer(SubjectID, firstInputDay, secondInputDay)

% Determining what subjects had higher isometric strength values on day 3 when compared to day 2
firstInputDay = Day2;
secondInputDay = Day3;
[day2toDay3] = dayComparer(SubjectID, firstInputDay, secondInputDay)

% Weight normalizing isokinetic data for each day
        %!!!!!! HELP !!!!!!%
 normDay1 = normalize(Day1);
 normDay2 = normalize(Day2);
 normDay3 = normalize(Day3);

% Determining averages of the normalized data for each day
normDay1mean = mean(normDay1)
normDay2mean = mean(normDay2)
normDay3mean = mean(normDay3)

% Exporting results to csvfile named 'iso_results.csv'
save('iso_results.csv')