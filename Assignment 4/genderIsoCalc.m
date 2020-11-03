function [maleIsoIndMeans, femaleIsoIndMeans, maleGroupIsoMean, femaleGroupIsoMean] = genderIsoCalc(Gender,Day1,Day2,Day3)
% This function takes four variables (Gender, Day1, Day2, Day3) from the isometric data csv file titled "isok_data_6803"
% as inputs. This function has four outputs. The first two outputs are matrices of indivudal mean isometric
% strength values for 3 days for men and women. The second two outputs are
% a single mean value for the group of men and the group of women. 

rowNumber = 1; % This is used to indicate the row of the csv file
maleIsoIndMeans = [1];
femaleIsoIndMeans = [1];
maleGroupIsoMean = 0;
femaleGroupIsoMean = 0;

% Counting number of Males and Females
numMales = sum(Gender(:) == 'M');
numFemales = sum(Gender(:) == 'F');
genderLength = length(Gender);

for rowValue = (rowNumber:genderLength) % if messes up replace genderLength w 25
        
    if Gender(rowNumber) == 'M'
        if maleIsoIndMeans == [1]
            maleIsoIndMeans(1) = ((Day1(rowNumber) + Day2(rowNumber) + Day3(rowNumber))/3);
            rowNumber = rowNumber+1;
        else
        maleIsoIndMeans(end+1) = ((Day1(rowNumber) + Day2(rowNumber) + Day3(rowNumber))/3);
        rowNumber = rowNumber+1;
        end
    elseif Gender(rowNumber) == 'F'
        if femaleIsoIndMeans == [1]
            femaleIsoIndMeans(1) = ((Day1(rowNumber) + Day2(rowNumber) + Day3(rowNumber))/3);
            rowNumber = rowNumber+1;
        else
        femaleIsoIndMeans(end+1) = ((Day1(rowNumber) + Day2(rowNumber) + Day3(rowNumber))/3);
        rowNumber = rowNumber+1;
        end
    else
    end
end
  
rowNumber = 1; % This is used to indicate the row of the csv file    
   for rowValue = (rowNumber:25) 
    if Gender(rowNumber) == 'M'
        maleGroupIsoMean = maleGroupIsoMean + (Day1(rowValue) + Day2(rowValue) + Day3(rowValue));
        rowNumber = rowNumber+1;
    elseif Gender(rowNumber) == 'F'
        femaleGroupIsoMean = femaleGroupIsoMean + (Day1(rowValue) + Day2(rowValue) + Day3(rowValue));
        rowNumber = rowNumber+1;
    end
   end
   
   maleGroupIsoMean = maleGroupIsoMean/numMales;
   femaleGroupIsoMean = femaleGroupIsoMean/numFemales;
    
end






