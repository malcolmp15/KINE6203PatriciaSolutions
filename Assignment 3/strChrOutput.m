function [stringLength, firstCharacter, lastCharacter] = strChrOutput(string)
% This function takes a string value as an input and outputs the length of
% the string and the first and last characters of the input

% Determining the length of the input
stringLength = length(string);

% Determining the first character
firstCharacter = string(1);

% Determining the last character
lastCharacter = string(end);


end

