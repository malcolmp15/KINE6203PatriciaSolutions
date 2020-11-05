function [maleIsoIndMeans, femaleIsoIndMeans, maleGroupIsoMean, femaleGroupIsoMean] = genderIsoCalc(Gender,Day1,Day2,Day3)
% This function takes four variables (Gender, Day1, Day2, Day3) from the isometric data csv file titled "isok_data_6803"
% as inputs. This function has four outputs. The first two outputs are matrices of individudal mean isometric
% strength values for 3 days for men and women. The second two outputs are
% a single mean value for the mean isometric strength values for the group of men and the group of women. 

rowNumber = 1;              % This is used to indicate the row of the csv file
maleIsoIndMeans = [1];      % Establishing an intital value for the array of individual male isometric means
femaleIsoIndMeans = [1];    % Establishing an intital value for the array of individual female isometric means
maleGroupIsoMean = 0;       % Establishing an intital value for male group isometric means
femaleGroupIsoMean = 0;     % Establishing an intital value for female group isometric means

% Counting number of Males and Females
genderLength = length(Gender);      % Total males and females


for rowValue = (rowNumber:genderLength) % The for loop will run for the number of subjects
        
    if Gender(rowNumber) == 'M' % If subject is a male
        if maleIsoIndMeans == [1] % If no data has been put into the maleIsoIndMeans array
            maleIsoIndMeans(1) = ((Day1(rowNumber) + Day2(rowNumber) + Day3(rowNumber))/3); % Put average for the 3 Days into 1st array position
            rowNumber = rowNumber+1; % Next row
        else
        maleIsoIndMeans(end+1) = ((Day1(rowNumber) + Day2(rowNumber) + Day3(rowNumber))/3); % Put average into the next position of the array
        rowNumber = rowNumber+1;     % Next row
        end
    elseif Gender(rowNumber) == 'F'  % If subject is a female
        if femaleIsoIndMeans == [1]  % If no data has been put into the femaleIsoIndMeans array
            femaleIsoIndMeans(1) = ((Day1(rowNumber) + Day2(rowNumber) + Day3(rowNumber))/3); % Put average for the 3 Days into 1st array position
            rowNumber = rowNumber+1; % Next row
        else
        femaleIsoIndMeans(end+1) = ((Day1(rowNumber) + Day2(rowNumber) + Day3(rowNumber))/3); % Put average into the next position of the array
        rowNumber = rowNumber+1;     % Next row
        end
    else
    end
end
 
% Determining the means of subject means for males and females
maleGroupIsoMean = mean(maleIsoIndMeans);
femaleGroupIsoMean = mean(femaleIsoIndMeans);

