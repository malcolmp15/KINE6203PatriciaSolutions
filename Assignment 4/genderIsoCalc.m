function [maleIsoIndMeans, femaleIsoIndMeans, maleGroupIsoMean, femaleGroupIsoMean] = genderIsoCalc(Gender,Day1,Day2,Day3)
% This function takes four variables (Gender, Day1, Day2, Day3) from the isometric data csv file titled "isok_data_6803"
% as inputs. This function has four outputs. The first two outputs are matrices of individudal mean isometric
% strength values for 3 days for men and women. The second two outputs are
% a single mean value for the group of men and the group of women. 

rowNumber = 1;              % This is used to indicate the row of the csv file
maleIsoIndMeans = [1];      % Establishing an intital value for the array of individual male isometric means
femaleIsoIndMeans = [1];    % Establishing an intital value for the array of individual female isometric means
maleGroupIsoMean = 0;       % Establishing an intital value for male group isometric means
femaleGroupIsoMean = 0;     % Establishing an intital value for female group isometric means

% Counting number of Males and Females
numMales = sum(Gender(:) == 'M');   % Number of males
numFemales = sum(Gender(:) == 'F'); % Number of females
genderLength = length(Gender);      % Total males and females


for rowValue = (rowNumber:genderLength) % The for loop will run for the number of subjects
        
    if Gender(rowNumber) == 'M' % If subject is a male
        if maleIsoIndMeans == [1] % If no data has been put into the maleISoIndMeans array
            maleIsoIndMeans(1) = ((Day1(rowNumber) + Day2(rowNumber) + Day3(rowNumber))/3); % Put average for the 3 Days into 1st array position
            rowNumber = rowNumber+1; % Next row
        else
        maleIsoIndMeans(end+1) = ((Day1(rowNumber) + Day2(rowNumber) + Day3(rowNumber))/3); % Put average into the next position of the array
        rowNumber = rowNumber+1;     % Next row
        end
    elseif Gender(rowNumber) == 'F'  % If subject is a female
        if femaleIsoIndMeans == [1]  % If no data has been put into the femaleISoIndMeans array
            femaleIsoIndMeans(1) = ((Day1(rowNumber) + Day2(rowNumber) + Day3(rowNumber))/3); % Put average for the 3 Days into 1st array position
            rowNumber = rowNumber+1; % Next row
        else
        femaleIsoIndMeans(end+1) = ((Day1(rowNumber) + Day2(rowNumber) + Day3(rowNumber))/3); % Put average into the next position of the array
        rowNumber = rowNumber+1;     % Next row
        end
    else
    end
end
  
rowNumber = 1; % Resetting the row of the csv file    
   for rowValue = (rowNumber:25) % The for loop will run for the number of subjects
    if Gender(rowNumber) == 'M'  % If subject is a male
        maleGroupIsoMean = maleGroupIsoMean + (Day1(rowValue) + Day2(rowValue) + Day3(rowValue)); % Put average into the next position of the array
        rowNumber = rowNumber+1; % Next row
    elseif Gender(rowNumber) == 'F' % If subject is a female
        femaleGroupIsoMean = femaleGroupIsoMean + (Day1(rowValue) + Day2(rowValue) + Day3(rowValue)); % Put average into the next position of the array
        rowNumber = rowNumber+1; % Next row
    end
   end
   
   maleGroupIsoMean = maleGroupIsoMean/numMales; % Determining mean for male group
   femaleGroupIsoMean = femaleGroupIsoMean/numFemales; % Determining mean for women group
    
end






