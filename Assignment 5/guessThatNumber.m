function guessThatNumber()  % *** WARNING: CONTAINS INTENTIONAL BUGS! ***
%---------------------------------------------------------------
%       USAGE: guessThatNumber() - Assignment 5
%
%        NAME: Patricia M. Butler
%
%         DUE: November 12
%
%
% DESCRIPTION: This program is supposed to allow the user to play
%              the Number Guessing Game, however, it contains bugs.
%              Your job is to find, correct, and mark the errors with
%              comments describing the bug, how you found it, 
%              and how you corrected it. Correct the bugs and submit this
%              corrected file on github. There are between 9 - 12 bugs,
%              depending on how you correct them. 
%
%      INPUTS: None
%
%     OUTPUTS: None
%
%---------------------------------------------------------------

beginner = 1;               % beginner level #
moderate = 2;               % moderate level #
advanced = 3;               % advanced level #
beginnerHighest = 10;       % highest possible number for beginner
moderateHighest = 100;      % highest possible number for moderate
advancedHighest = 1000;    % highest possible number for advanced

% clear screen and display game introduction

clc()
fprintf(['Guess That Number Game (buggy)\n\n', ...
'This program plays the game of Guess That Number in which you have to guess\n', ...
'a secret number.  After each guess you will be told whether your \n', ...
'guess is too high, too low, or correct.\n\n'])

% Get level of play (1-3) from user      %NOTE: I changed this to ask for beginner, moderate, or advanced, because it required less changes. 

fprintf('Please select one of the three levels of play:\n')
fprintf('   1) Beginner (range is 1 to %d)\n', beginnerHighest)
fprintf('   2) Moderate (range is 1 to %d)\n', moderateHighest)
fprintf('   3) Advanced (range is 1 to %d)\n', advancedHighest)

level = input('Enter level (beginner, moderate, advanced): '); % Found Bug 1: The input was asking for the user to input a numerical
                                                               % value for the level (1,2, or 3); however, the rest of the script uses
                                                               % beginner, moderate, or advanced. 
                                                               % I found this bug by starting the script and having "Sorry, that is
                                                               % not a valid level selection" appear in the command window whenever I would input a 1,2,or 3.
                                                               % I then searched through the code to find the part of the script related to
                                                               % the level selection and corrected the bug. I fixed the bug by prompting the user to input beginner, moderate, or advanced.
                                      
while level ~= beginner && level ~= moderate && level ~= advanced % Found Bug 2: The while loop originally had ||. This bug made the user stuck in an infinite while loop.       
fprintf('Sorry, that is not a valid level selection.\n')          % The level cannot be equal to all of the level names at once, therefore, having a while statement that 
level = input('Please re-enter a level of play (beginner, moderate, advanced): '); % continued as long as the level was not equal to beginner, moderate, or advanced is a major bug. I found 
end                                                               % this bug after trying to run the code and noticing that I was stuck in a continuous loop. I then searched for the part of the 
                                                                  % script that had the message that kept appearing in my command window. I
                                                                  % fixed it by changing the || to && so the while loop would only run if
                                                                  % there was an invalid input.
                                                                  
% Found Bug 3: The input that appears after submitting an invalid input
% asks for a numerical selection for the level; however, the code only uses
% beginner, moderate, or advanced. I found this error when writing about
% the second bug I found. I fixed the bug by changing the input prompt to
% prompt the user to input beginner, moderate, or advanced.
                                                                


% set highest secret number based on level selected

if level == beginner         % Found Bug 4: It originally said "if level = beginner", however, if you want to compare values for
                             % equality you need ==. I found this bug by
                             % scrolling through the MATLAB warnings. I fixed the bug by adding an additional =.

highest = beginnerHighest;

elseif level == moderate

highest = moderateHighest;

else
highest = advancedHighest;   % Found Bug 5: It originally said "highest = advancedhighest;". The h was not capitilized, however, the h was capitilized when the variable was first defined.   
                             % Therefore, the variable was not recognized. I found this bug by trying
                             % to play the advanced level and getting an error message. I corrected the error by changing the lowercase h to an uppercase H.
end

% randomly select secret number between 1 and highest for level of play

secretNumber = floor(rand() * highest);      % Found Bug 6: The script originally said "floor(rand() + 1 * highest). Adding the 1 was not necessary and resulted in the 1 being multiplied
                                             % by the 'highest' variable. Thus the rand() would produce a random number that was less than 1, that secret number would be added to the product of 1 and 'highest', 
                                             % and 'floor' would round the secret number to the closest integer (10, 100, or 1000 depending on the selected level). 
                                             % I noticed this bug after testing the script on beginner and always getting "Congratulations!  You got 10 in Game Over. Thanks for playing the Guess That Number game."
                                             % I fixed the bug by removing "+1".
                                             
% initialize number of guesses and User_guess

numOfTries = 0;                              % Found Bug 7: This bug starts the "numOfTries" at 1, however, this is incorrect because this happens before the user guesses once. 
userGuess = 0;                               % This bug results in the number of tries being 1 larger than what it actually is. I found this code by playing the game and noticing that 
                                             % number of tries was incorrect. I corrected this bug by changing
                                             % numOfTries to begin as 0.
    
% repeatedly get user's guess until the user guesses correctly

while userGuess ~= secretNumber   
        
% get a valid guess (an integer from 1-Highest) from the user

fprintf('\nEnter a guess (1-%d): ', highest);
userGuess = input('');
while userGuess < 1 || userGuess > highest  % Found Bug 8: Script originally said "userGuess >= highest".
                                            % This meant that the highest value could not be input by the
                                            % user. I found this bug by trying to play the beginner level and 
                                            % inputing 10 as my guess and
                                            % encountering errors. I corrected this bug by removing the =.

fprintf('Sorry, that is not a valid guess.\nRe-enter a guess (1-%d): ', highest);

userGuess = input('');

end % of guess validation loop

% add 1 to the number of guesses the user has made

numOfTries = numOfTries + 1;

% report whether the user's guess was high, low, or correct

if userGuess < secretNumber         % Found Bug 9: This originally said "if userGuess > secretNumber ", but it wants to check 
                                    % if the user guessed below the secret
                                    % number. I found this bug by scrolling
                                    % through the code looking for a
                                    % different error.  I corrected it by switching the "greater than" to a "less than". 
                                    
fprintf('Sorry, %d is too low.\n', userGuess);
elseif userGuess > secretNumber 
fprintf('Sorry, %d is too high.\n', userGuess);
elseif numOfTries == 1
fprintf('\nLucky You!  You got it on your first try!\n\n');
else
fprintf('\nCongratulations!  You got %d in %d tries.\n\n', ...
secretNumber, numOfTries); % Found Bug 10:  It originally said "fprintf('\nCongratulations!  You got %d in %d tries.\n\n', ...
                           % secretNumber). This bug would not output the
                           % number of tries it took to find the secret number. 
                           % I found this bug by playing the
                           % game and noticing that everytime I got the
                           % correct answer the Command Window would say "Congratulations!  You got "whatever the secret number was" in Game Over. Thanks for playing the Guess That Number game."
                           % It would not tell me the number of tries I had even though there is a
                           % variable and the fprintf script mentioning the number of tries. 
                           % I corrected this error by including "numofTries"
                           % so that the fprintf would print the secret number and the number of attempts.
     
fprintf('Game Over. Thanks for playing the Guess That Number game.\n\n');

end  % Found Bug 11: The conditional did not have an end statement. I found this bug when I noticed that
     % the while loop did not have an end statment by scrolling through MATLAB's warnings. 
     % I corrected it by adding an end statement.
     
end  % of guessing while loop

% end of game