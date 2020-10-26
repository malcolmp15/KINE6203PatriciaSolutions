function [changeSum] = changeCalc(quarters,dimes,nickels,pennies)
% This function takes in 4 number inputs representing the number of quarters,
% dimes, nickels, and pennies and outputs the total dollar amount

% Calculating the respective values of the coins
quarterValue = quarters * 0.25;
dimeValue = dimes * .1;
nickelValue = nickels * .05;
pennyValue = pennies * 0.01;

% Turning the sum of the quarterValue, dimeValue,
% nickelValue, and pennyValue into a string and adding a dollar sign 
changeSum = strcat('$', num2str(quarterValue + dimeValue + nickelValue + pennyValue));

end

