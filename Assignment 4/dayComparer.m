function [daytoDay] = dayComparer(SubjectID, firstInputDay, secondInputDay)
% This function takes 3 variables (SubjectID, firstInputDay, secondInputDay) from the isometric data csv file titled "isok_data_6803"
% as inputs and has 1 outputs. The output is a matrix with the
% subject IDs who had an increase from the first input day to the second input day.
% Note: Ensure that the firstInputDay is a day that occurs before
% secondInputDay.

rowNumber = 1;
daytoDay1 = 'empty';
subjectLength = length(SubjectID);
transposedSubjectID = (SubjectID)';

for rowValue = (rowNumber:subjectLength)
if secondInputDay(rowNumber) > firstInputDay(rowNumber)
    if daytoDay1 == 'empty'
        daytoDay1 = SubjectID(rowNumber);
        daytoDay = daytoDay1;
        rowNumber = rowNumber + 1;
    else
        daytoDay(end+1) = SubjectID(rowNumber);
        rowNumber = rowNumber + 1;
        daytoDay = strcat(daytoDay);
    end
else
    rowNumber = rowNumber + 1;
end
end
end
