function [sum,difference,product,maxNumber] = sumDiffProductMax(number1,number2)
% This function takes 2 numbers as inputs and returns the sum, difference,
% product, and maximum of the 2 numbers as outputs. 

% Determining the sum of the 2 numbers
sum = number1 + number2;

% Determining the difference between the 2 numbers
difference = (number1 - number2);

% Determining the product of the 2 numbers
product = number1 * number2;

% Determining which of the 2 number inputs is the maximum 
maxNumber = max(number1, number2);

end

