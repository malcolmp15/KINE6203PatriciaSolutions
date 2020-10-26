function [sumResult] = sumOddEven(number1,number2)
% This function takes the sum of two inputs and returns 'Woo'
% if the sum is even and 'Hah' if the sum is odd

% Finding the sum of the two inputs
numSum = number1 + number2;


if rem(numSum,2) == 0 % Determining if the sum of the two inputs is even or odd
    sumResult = 'Woo';  % If the sum is even
else
    sumResult = 'Hah';  % If the sum is odd

end

