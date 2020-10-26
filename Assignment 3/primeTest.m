function [ifPrime] = primeTest(number)
% This function take a number as an input and outputs 'True' if the number
% is a prime number and 'False' if it is not

% Creating an array of prime numbers from 1 up to the input number
primeNumber = primes(number);

% Checking if the input number is in the prime number array
primeTest = ismember(number,primeNumber);

    % If the number is in the array
if primeTest == 1
    ifPrime = true;     % Outputs true
else % If the number is not in the array
    ifPrime = false;    % Outputs false
end

end

% numberOut = isprime(numberIn)