function [daytoDay] = dayComparer(SubjectID, firstInputDay, secondInputDay)
% This function takes 3 variables (SubjectID, firstInputDay, secondInputDay) from the isometric data csv file titled "isok_data_6803"
% as inputs and has 1 output. The output is a matrix with the
% subject IDs who had an increase from the first input day to the second input day.
% Note: Ensure that the firstInputDay is a day that occurs before
% secondInputDay.

rowNumber = 1;                      % Variable to indicate what row is being examined
daytoDay1 = 'empty';                % Setting variable to 'empty'
subjectLength = length(SubjectID);  % Finding number of subjects
transposedSubjectID = (SubjectID)'; % Transposing SubjectID

for rowValue = (rowNumber:subjectLength)                % The for loop will run for the number of subjects
if secondInputDay(rowNumber) > firstInputDay(rowNumber) % If secondInputDay is larger than the firstInputDay
    if daytoDay1 == 'empty'                             % If daytoDay1 has not had any SubjectIDs recorded yet
        daytoDay1 = SubjectID(rowNumber);               % Setting value of daytoDay1 as the SubjectID that corresponds to the rowNumber
        daytoDay = daytoDay1;                           % Establishing output
        rowNumber = rowNumber + 1;                      % Next row
    else
        daytoDay(end+1) = SubjectID(rowNumber);         % Adding SubjectID to next spot of daytoDay array
        rowNumber = rowNumber + 1;                      % Next row
        daytoDay = strcat(daytoDay);                    % Adding string values
    end
else
    rowNumber = rowNumber + 1;                          % If firstInputDay is larger than secondInputDay, then go to the next row
end
end
end
