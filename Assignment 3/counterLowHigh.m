function counterLowHigh(number1,number2)
% This function takes 2 numbers as inputs and creates a counter from the
% lower number to the higher number

largerNum = max(number1, number2); % Finding the higher number
smallerNum = min(number1,number2); % Finding the lower number

% While the smaller number is lower than or equal to the higher number
while smallerNum <= largerNum      
  
    visibleNum = strcat(num2str(smallerNum)); % Setting the current number as a string
    smallerNum = smallerNum + 1;              % Adding 1 to the current number
    disp(visibleNum)                          % Displaying the current number
   
end

