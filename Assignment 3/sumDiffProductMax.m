function [sum,difference,product,maxNumber] = sumDiffProductMax(number1,number2)
% This function takes two numbers as inputs and returns the sum, difference,
% product, and maximum of the two numbers as outputs. 

% Determining the sum of the two numbers
sum = number1 + number2;

% Determining the difference between the two numbers
difference = (number1 - number2);

% Determining the product of the two numbers
product = number1 * number2;

% Determining which of the two number inputs is the maximum 
maxNumber = max(number1, number2);

end

