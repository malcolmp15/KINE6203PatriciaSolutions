%% KINE6203 - Assignment 2
% Tic-Tac-Toe Game
% Written by: Patricia M. Butler
% Date: 10-22-2020

% Description: This code was written to generate a tic-tac-toe game that the user can
% play against an AI.

% Developed on Matlab version R2019b, Update 3, with Windows 10 Version

%% Clearing Variables, Command Window, and Closing Figures
% This section clears the command window, workspace, and closes any figures

clc                 % Clears the command window
clear all           % Clears saved variables and values in workspace
close all           % Closes any open figures

%% Welcome Message
% This section is welcoming the user and inquiring if they would like to
% play a game

% Numerical indicator for identifying if a player wishes to play Tic-Tac-Toe
i = 0;                        % 1 means user wants to play 
                              % 2 means user does not want to play

while i == 0
    
promptPlay = 'Would you like to play Tic-Tac-Toe? (Y/N)  ' % Asking user if they want to play
userInput = input(promptPlay,'s')                          % User response

if userInput == 'Y'           % If User indicates that they would like to play
    i = 1                           
    promptResponse = 'Great! Lets get started!  '          % Response to user wanting to play

elseif userInput == 'N'       % If User indicates that they would not like to play
    i =2
    promptResponse = 'Get outta here!'                     % Response to user not wanting to play
    pause(.75)                                             % Brief pause
    quit                      % Closing Application
    
else 
    promptResponse = 'Please reply with Y or N  '          % If user inputs invalid answer
    i = 0;
    pause(1.5)                                             % Pause so reader can read promptResponse
    end
end

pause(1.5)                                                 % Brief Pause
clc                                                        % Clears Command Window 

%% Establishing Turn Order
% This section is asking the user if they would prefer to go first or
% second

% Number indicating if the user is going to go first or second
% k will begin at 0 so the user can decide if they want to go first or second
k = 0;              

% Asking user if they would like to go first or second 
userInputOrder = 'Would you prefer to go first or second? Please input 1 or 2   '  % Message to user
playerOrder = input(userInputOrder);        % Prompting user response

% Establishing the different scenarios in response to user's answer to prompt
while k == 0                                % While user has not selected turn order
if playerOrder == 1                         % If user chooses to go first
    userInputOrderResponse = 'You would like to go first? Alright, lets get started!   '
    k = 1;                                  % Ending loop; user goes first
    
elseif playerOrder == 2                     % If user chooses to go second
    userInputOrderResponse = 'You would like to go second? They do say first is the worst and second is the best!  '
    k = 2;                                  % Ending loop; user goes second
    
else                                        % If user does not input valid answer
    userInputOrderResponse = 'Someone was not reading very carefully. I am going to give you another chance, please do not let me down!   '
    pause(1.5)                              % Pause
    userInputOrder = 'Would you prefer to go first or second? Please input 1 or 2   '
    
% Giving user another chance to input valid answer

    playerOrder = input(userInputOrder);    % Prompting user to input if they would prefer to go first or second
    
    if playerOrder == 1                     % If user chooses to go first
        userInputOrderResponse = 'You would like to go first? Alright, lets get started!   '
        k=1;                                % Ending loop; user goes first
        
    elseif playerOrder == 2                 % If user chooses to go second
        userInputOrderResponse = 'You would like to go second? They do say first is the worst and second is the best!  '
        k=2;                                % Ending loop; user goes second
        
    else                                    % If user does not input valid answer again
        'Okay, I give up, you are just going to go first. '
        k = 1;                              % Ending loop; user goes first
        
    end
end
end

pause(1.5)                                  % Brief Pause
clc                                         % Clearing Command Window

%% Generating Game Board
% This section creates the game board and defines the slots of the
% Tic-Tac-Toe board

figure                      % Creating a figure
hold on                     % Allowing multiple lines to be plot
title('Tic-Tac-Toe');       % Creating a title for the figure

xlim([0 12]);               % Adjusting x-axis to span 0 to 12
ylim([0 12]);               % Adjusting y-axis to span 0 to 12

xline(4);                   % Creating a vertical line at x = 4
xline(8);                   % Creating a vertical line at x = 8
yline(4);                   % Creating a horizontal line at y = 4
yline(8);                   % Creating a horizontal line at y = 8

% Creating labels for the 9 slots on the Tic-Tac-Toe board %

slotLabel1 = '1';
slotLabel2 = '2';
slotLabel3 = '3';
slotLabel4 = '4';
slotLabel5 = '5';
slotLabel6 = '6';
slotLabel7 = '7';
slotLabel8 = '8';
slotLabel9 = '9';

% Assigning numerical indicators for slots to determine if they have been
% filled or not

slot1 = 0;
slot2 = 0;
slot3 = 0;
slot4 = 0;
slot5 = 0;
slot6 = 0;
slot7 = 0;
slot8 = 0;
slot9 = 0;

% Adding text labels to each slot on the Tic-Tac-Toe board %

slotLabel1Text = text(1.5,10,slotLabel1,'FontSize', 60, 'Color', 'r');
slotLabel2Text = text(1.5,6,slotLabel2,'FontSize', 60, 'Color', 'r');
slotLabel3Text = text(1.5,2,slotLabel3,'FontSize', 60, 'Color', 'r');
slotLabel4Text = text(5.5,10,slotLabel4,'FontSize', 60, 'Color', 'r');
slotLabel5Text = text(5.5,6,slotLabel5,'FontSize', 60, 'Color', 'r');
slotLabel6Text = text(5.5,2,slotLabel6,'FontSize', 60, 'Color', 'r');
slotLabel7Text = text(9.5,10,slotLabel7,'FontSize', 60, 'Color', 'r');
slotLabel8Text = text(9.5,6,slotLabel8,'FontSize', 60, 'Color', 'r');
slotLabel9Text = text(9.5,2,slotLabel9,'FontSize', 60, 'Color', 'r');

pause(1)        % Pause for 1 second

%% Defining Variables
% This section defines variables that are used throughout the script

% Defining Variables to determine who wins

% User Score Variables %
userScoreColumn1 = 0;       % Column 1 doesn't have user markers
userScoreColumn2 = 0;       % Column 2 doesn't have user markers
userScoreColumn3 = 0;       % Column 3 doesn't have user markers
userScoreRow1 = 0;          % Row 1 doesn't have user markers
userScoreRow2 = 0;          % Row 2 doesn't have user markers
userScoreRow3 = 0;          % Row 3 doesn't have user markers
userScoreDiagFromLeft = 0;  % Diagnoal Starting from the left doesn't have user markers
userScoreDiagFromRight = 0; % Diagnoal Starting from the right doesn't have user markers

% Computer Score Variables %
compScoreColumn1 = 0;       % Column 1 doesn't have computer markers
compScoreColumn2 = 0;       % Column 2 doesn't have computer markers
compScoreColumn3 = 0;       % Column 3 doesn't have computer markers
compScoreRow1 = 0;          % Row 1 doesn't have computer markers
compScoreRow2 = 0;          % Row 2 doesn't have computer markers
compScoreRow3 = 0;          % Row 3 doesn't have computer markers
compScoreDiagFromLeft = 0;  % Diagnoal Starting from the left doesn't have computer markers
compScoreDiagFromRight = 0; % Diagnoal Starting from the right doesn't have computer markers

% Numerical indicator for determining if someone has won
winnerResultIndicator = 0;  

% Defined message for prompting rematch
promptRematchWinner = 'Congratulations winner! Would you like to play again? Y/N     ';
promptRematchLoser = 'Hey, don''t give up! Would you like to play again? Y/N     ';
promptRematchDraw = 'Well that could have ended better! Would you like to play again? Y/N     ';
askRematch = 0;     % Variable used to reset board if user wishes to replay
%% User Goes First %%
% This section codes the scenario if the user decided to go first

if k==1  % k is an indication of player turn number
         % 1 means player is going first
    
n=1;     % Counter indicating what turn number it is 
         % In this scenario, odd numbers are the user's turn
         % and even numbers are the computer's turn

 
for t = (n:10)          % Limiting the game to 9 rounds

   if askRematch == 'Y' % If user has already played and wants to play again
       
    figure                      % Creating the figure where the game board will be generated
    hold on                     % Allowing multiple lines to be plot
    title('Tic-Tac-Toe');       % Creating a title for the figure
    xlim([0 12]);               % Adjusting x-axis to span 0 to 12
    ylim([0 12]);               % Adjusting y-axis to span 0 to 12
   
% Creating lines for the Game Board %
    xline(4);                   % Creating a vertical line at x = 4
    xline(8);                   % Creating a vertical line at x = 8
    yline(4);                   % Creating a horizontal line at y = 4
    yline(8);                   % Creating a horizontal line at y = 8

% Redefining slot numerical indicators so the slots are known to be empty

    slot1 = 0;
    slot2 = 0;
    slot3 = 0;
    slot4 = 0;
    slot5 = 0;
    slot6 = 0;
    slot7 = 0;
    slot8 = 0;
    slot9 = 0;

% Readding text labels to each slot on the Tic-Tac-Toe board %

    slotLabel1Text = text(1.5,10,slotLabel1,'FontSize', 60, 'Color', 'r');
    slotLabel2Text = text(1.5,6,slotLabel2,'FontSize', 60, 'Color', 'r');
    slotLabel3Text = text(1.5,2,slotLabel3,'FontSize', 60, 'Color', 'r');
    slotLabel4Text = text(5.5,10,slotLabel4,'FontSize', 60, 'Color', 'r');
    slotLabel5Text = text(5.5,6,slotLabel5,'FontSize', 60, 'Color', 'r');
    slotLabel6Text = text(5.5,2,slotLabel6,'FontSize', 60, 'Color', 'r');
    slotLabel7Text = text(9.5,10,slotLabel7,'FontSize', 60, 'Color', 'r');
    slotLabel8Text = text(9.5,6,slotLabel8,'FontSize', 60, 'Color', 'r');
    slotLabel9Text = text(9.5,2,slotLabel9,'FontSize', 60, 'Color', 'r');

    pause(1)        % Pause for 1 second

    % Defining Variables to determine who wins

    % User Score Variables %
    userScoreColumn1 = 0;       % Column 1 doesn't have user markers
    userScoreColumn2 = 0;       % Column 2 doesn't have user markers
    userScoreColumn3 = 0;       % Column 3 doesn't have user markers
    userScoreRow1 = 0;          % Row 1 doesn't have user markers
    userScoreRow2 = 0;          % Row 2 doesn't have user markers
    userScoreRow3 = 0;          % Row 3 doesn't have user markers
    userScoreDiagFromLeft = 0;  % Diagnoal Starting from the left doesn't have user markers
    userScoreDiagFromRight = 0; % Diagnoal Starting from the right doesn't have user markers

    % Computer Score Variables %
    compScoreColumn1 = 0;       % Column 1 doesn't have computer markers
    compScoreColumn2 = 0;       % Column 2 doesn't have computer markers
    compScoreColumn3 = 0;       % Column 3 doesn't have computer markers
    compScoreRow1 = 0;          % Row 1 doesn't have computer markers
    compScoreRow2 = 0;          % Row 2 doesn't have computer markers
    compScoreRow3 = 0;          % Row 3 doesn't have computer markers
    compScoreDiagFromLeft = 0;  % Diagnoal Starting from the left doesn't have computer markers
    compScoreDiagFromRight = 0; % Diagnoal Starting from the right doesn't have computer markers

    % Numerical indicator for determining if someone has won
    winnerResultIndicator = 0;  

    % Defined message for prompting rematch
    promptRematchWinner = 'Congratulations winner! Would you like to play again? Y/N     ';
    promptRematchLoser = 'Hey, don''t give up! Would you like to play again? Y/N     ';
    promptRematchDraw = 'Well that could have ended better! Would you like to play again? Y/N     ';
    askRematch = 0;
       else
       end
                %!!! CODE FOR THE USER'S TURN !!!%
                

while n == 1|3|5|7|9    % Ensuring user goes on odd turn numbers        
 
disp('Your Turn!')
    userInput1 = input('What is the number of the box you wish to select?   ');
    if userInput1 == 1
        if slot1 == 0
        delete(slotLabel1Text)
        plot(2,10,'rX', 'MarkerSize', 60)
        slot1 = 'Filled';
        n=n+1;
        userScoreColumn1 = userScoreColumn1 + 1;
        userScoreRow1 = userScoreRow1 + 1;
        userScoreDiagFromLeft = userScoreDiagFromLeft +1;
        break

        else
        end
        
    elseif userInput1 == 'One'
        if slot1 == 0
        delete(slotLabel1Text)
        plot(2,10,'rX', 'MarkerSize', 60)
        slot1 = 'Filled';
        n=n+1;
        userScoreColumn1 = userScoreColumn1 + 1;
        userScoreRow1 = userScoreRow1 + 1;
        userScoreDiagFromLeft = userScoreDiagFromLeft +1;
        break
        
        else
        end
        
    elseif userInput1 == 'one'
        if slot1 == 0
        delete(slotLabel1Text)
        plot(2,10,'rX', 'MarkerSize', 60)
        slot1 = 'Filled';
        n=n+1;
        userScoreColumn1 = userScoreColumn1 + 1;
        userScoreRow1 = userScoreRow1 + 1;
        userScoreDiagFromLeft = userScoreDiagFromLeft +1;
        break
        
        else
        end
        
     elseif userInput1 == 2
         if slot2 == 0
        delete(slotLabel2Text)
        plot(2,6,'rX', 'MarkerSize', 60)
        slot2 = 'Filled';
        n=n+1;
        userScoreColumn1 = userScoreColumn1 + 1;
        userScoreRow2 = userScoreRow2 + 1;
        break
        
         else
         end
        
    elseif userInput1 == 'Two'
        if slot2 == 0
        delete(slotLabel2Text)
        plot(2,6,'rX', 'MarkerSize', 60)
        slot2 = 'Filled';
        n=n+1;
        userScoreColumn1 = userScoreColumn1 + 1;
        userScoreRow2 = userScoreRow2 + 1;
        break
        
        else 
        end
        
    elseif userInput1 == 'two'
        if slot2 == 0
        delete(slotLabel2Text)
        plot(2,6,'rX', 'MarkerSize', 60)
        slot2 = 'Filled';
        n=n+1;
        userScoreColumn1 = userScoreColumn1 + 1;
        userScoreRow2 = userScoreRow2 + 1;
        break
        
        else
        end
        
    elseif userInput1 == 3
        if slot3 == 0
        delete(slotLabel3Text)
        plot(2,2,'rX', 'MarkerSize', 60)
        slot3 = 'Filled';
        n=n+1;
        userScoreColumn1 = userScoreColumn1 + 1;
        userScoreRow3 = userScoreRow3 + 1;
        userScoreDiagFromRight = userScoreDiagFromRight+1;
        break
        
        else
        end
        
    elseif userInput1 == 'Three'
        if slot3 == 0
        delete(slotLabel3Text)
        plot(2,2,'rX', 'MarkerSize', 60)
        slot3 = 'Filled';
        n=n+1;        
        userScoreColumn1 = userScoreColumn1 + 1;
        userScoreRow3 = userScoreRow3 + 1;
        userScoreDiagFromRight = userScoreDiagFromRight+1;
        break
        
        else
        end
        
    elseif userInput1 == 'three'
        if slot3 == 0
        delete(slotLabel3Text)
        plot(2,2,'rX', 'MarkerSize', 60)
        slot3 = 'Filled';
        n=n+1;        
        userScoreColumn1 = userScoreColumn1 + 1;
        userScoreRow3 = userScoreRow3 + 1;
        userScoreDiagFromRight = userScoreDiagFromRight+1;
        break
        
        else
        end
        
    elseif userInput1 == 4
        if slot4 == 0
        delete(slotLabel4Text)
        plot(6,10,'rX', 'MarkerSize', 60)
        slot4 = 'Filled';
        n=n+1;
        userScoreColumn2 = userScoreColumn2 +1;
        userScoreRow1 = userScoreRow1 + 1;
        break
        
        else
        end
        
    elseif userInput1 == 'Four'
        if slot4 == 0
        delete(slotLabel4Text)
        plot(6,10,'rX', 'MarkerSize', 60)
        slot4 = 'Filled';
        n=n+1;
        userScoreColumn2 = userScoreColumn2 +1;
        userScoreRow1 = userScoreRow1 + 1;
        break
        
        else
        end
        
    elseif userInput1 == 'four'
        if slot4 == 0
        delete(slotLabel4Text)
        plot(6,10,'rX', 'MarkerSize', 60)
        slot4 = 'Filled';
        n=n+1;
        userScoreColumn2 = userScoreColumn2 +1;
        userScoreRow1 = userScoreRow1 + 1;
        break
        
        else
        end
        
    elseif userInput1 == 5
        if slot5 == 0
        delete(slotLabel5Text)
        plot(6,6,'rX', 'MarkerSize', 60)
        slot5 = 'Filled';
        n=n+1;
        userScoreColumn2 = userScoreColumn2 +1;
        userScoreRow2 = userScoreRow2 + 1;
        userScoreDiagFromLeft = userScoreDiagFromLeft +1;
        userScoreDiagFromRight = userScoreDiagFromRight+1;
        break
        
        else
        end
        
    elseif userInput1 == 'Five'
        if slot5 == 0
        delete(slotLabel5Text)
        plot(6,6,'rX', 'MarkerSize', 60)
        slot5 = 'Filled';
        n=n+1;        
        userScoreColumn2 = userScoreColumn2 +1;
        userScoreRow2 = userScoreRow2 + 1;
        userScoreDiagFromLeft = userScoreDiagFromLeft +1;
        userScoreDiagFromRight = userScoreDiagFromRight+1;
        break
        
        else
        end
        
    elseif userInput1 == 'five'
        if slot5 == 0
        delete(slotLabel5Text)
        plot(6,6,'rX', 'MarkerSize', 60)
        slot5 = 'Filled';
        n=n+1;        
        userScoreColumn2 = userScoreColumn2 +1;
        userScoreRow2 = userScoreRow2 + 1;
        userScoreDiagFromLeft = userScoreDiagFromLeft +1;
        userScoreDiagFromRight = userScoreDiagFromRight+1;
        break
        
        else
        end
        
    elseif userInput1 == 6
        if slot6 == 0
        delete(slotLabel6Text)
        plot(6,2,'rX', 'MarkerSize', 60)
        slot6 = 'Filled';
        n=n+1;        
        userScoreColumn2 = userScoreColumn2 +1;
        userScoreRow3 = userScoreRow3 + 1;
        break
        
        else
        end
        
    elseif userInput1 == 'Six'
        if slot6 == 0
        delete(slotLabel6Text)
        plot(6,2,'rX', 'MarkerSize', 60)
        slot6 = 'Filled';
        n=n+1;        
        userScoreColumn2 = userScoreColumn2 +1;
        userScoreRow3 = userScoreRow3 + 1;
        break
        
        else
        end
        
    elseif userInput1 == 'six'
        if slot6 == 0
        delete(slotLabel6Text)
        plot(6,2,'rX', 'MarkerSize', 60)
        slot6 = 'Filled';
        n=n+1;        
        userScoreColumn2 = userScoreColumn2 +1;
        userScoreRow3 = userScoreRow3 + 1;
        break
        
        else
        end
        
    elseif userInput1 == 7
        if slot7 == 0
        delete(slotLabel7Text)
        plot(10,10,'rX', 'MarkerSize', 60)
        slot7 = 'Filled';
        n=n+1;
        userScoreColumn3 = userScoreColumn3 +1;
        userScoreRow1 = userScoreRow1 + 1;
        userScoreDiagFromRight = userScoreDiagFromRight+1;
        break
        
        else
        end
        
    elseif userInput1 == 'Seven'
        if slot7 == 0
        delete(slotLabel7Text)
        plot(10,10,'rX', 'MarkerSize', 60)
        slot7 = 'Filled';
        n=n+1;
        userScoreColumn3 = userScoreColumn3 +1;
        userScoreRow1 = userScoreRow1 + 1;
        userScoreDiagFromRight = userScoreDiagFromRight+1;
        break
        
        else
        end
        
    elseif userInput1 == 'seven'
        if slot7 == 0
        delete(slotLabel7Text)
        plot(10,10,'rX', 'MarkerSize', 60)
        slot7 = 'Filled';
        n=n+1;
        userScoreColumn3 = userScoreColumn3 +1;
        userScoreRow1 = userScoreRow1 + 1;
        userScoreDiagFromRight = userScoreDiagFromRight+1;
        break
        
        else
        end
        
    elseif userInput1 == 8
        if slot8 == 0
        delete(slotLabel8Text)
        plot(10,6,'rX', 'MarkerSize', 60)
        slot8 = 'Filled';
        n=n+1;        
        userScoreColumn3 = userScoreColumn3 +1;
        userScoreRow2 = userScoreRow2 + 1;
        break
        
        else
        end
        
    elseif userInput1 == 'Eight'
        if slot8 == 0
        delete(slotLabel8Text)
        plot(10,6,'rX', 'MarkerSize', 60)
        slot8 = 'Filled';
        n=n+1;        
        userScoreColumn3 = userScoreColumn3 +1;
        userScoreRow2 = userScoreRow2 + 1;
        break
        
        else
        end
        
    elseif userInput1 == 'eight'
        if slot8 == 0
        delete(slotLabel8Text)
        plot(10,6,'rX', 'MarkerSize', 60)
        slot8 = 'Filled';
        n=n+1;        
        userScoreColumn3 = userScoreColumn3 +1;
        userScoreRow2 = userScoreRow2 + 1;
        break
        
        else
        end
        
    elseif userInput1 == 9
        if slot9 == 0
        delete(slotLabel9Text)
        plot(10,2,'rX', 'MarkerSize', 60)
        slot9 = 'Filled';
        n=n+1;
        userScoreColumn3 = userScoreColumn3 +1;
        userScoreRow3 = userScoreRow3 + 1;
        break
        
        else
        end
        
    elseif userInput1 == 'Nine'
        if slot9 == 0
        delete(slotLabel9Text)
        plot(10,2,'rX', 'MarkerSize', 60)
        slot9 = 'Filled';
        n=n+1;
        userScoreColumn3 = userScoreColumn3 +1;
        userScoreRow3 = userScoreRow3 + 1;
        break
        
        else
        end
        
    elseif userInput1 == 'nine'
        if slot9 == 0
        delete(slotLabel9Text)
        plot(10,2,'rX', 'MarkerSize', 60)
        slot9 = 'Filled';
        n=n+1;
        userScoreColumn3 = userScoreColumn3 +1;
        userScoreRow3 = userScoreRow3 + 1;
        break
        
        else
        end
    
    end
   
    


 if     winnerResultIndicator ==0 
if userScoreColumn1 == 3;
    winnerResult = msgbox(userWin);
    winnerResultIndicator = 1;
    close all
    
    
elseif userScoreColumn2 == 3;
    winnerResult = msgbox(userWin);
    winnerResultIndicator = 1;
    close all
     
    
    elseif userScoreColumn3 == 3;
    winnerResult = msgbox(userWin);
    winnerResultIndicator = 1;
    close all
    
    
    elseif userScoreRow1 == 3;
    winnerResult = msgbox(userWin);
    winnerResultIndicator = 1;
    close all
    
    
    elseif userScoreRow2 == 3;
    winnerResult = msgbox(userWin);
    winnerResultIndicator = 1;
    close all
    
    
    elseif userScoreRow3 == 3;
    winnerResult = msgbox(userWin);  
    winnerResultIndicator = 1;
    close all
    
    
    elseif userScoreDiagFromLeft == 3;
    winnerResult = msgbox(userWin);
    winnerResultIndicator = 1;
    close all
   
    
    elseif userScoreDiagFromRight == 3;
    winnerResult = msgbox(userWin);
    winnerResultIndicator = 1;
    close all
    
    
elseif compScoreColumn1 == 3;
    winnerResult = msgbox(computerWin);
    winnerResultIndicator = 2;
    close all
    
    
elseif compScoreColumn2 == 3;
    winnerResult = msgbox(computerWin);
    winnerResultIndicator = 2;
    close all
    
    
elseif compScoreColumn3 == 3;
    winnerResult = msgbox(computerWin);
    winnerResultIndicator = 2;
    close all
    
    
elseif compScoreRow1 == 3;
    winnerResult = msgbox(computerWin);
    winnerResultIndicator = 2;
    close all
    
    
elseif compScoreRow2 == 3;
    winnerResult = msgbox(computerWin);
    winnerResultIndicator = 2;
    close all
    
    
elseif compScoreRow3 == 3;
    winnerResult = msgbox(computerWin);
    winnerResultIndicator = 2;
    close all
    
    
elseif compScoreDiagFromLeft == 3;
    winnerResult = msgbox(computerWin);
    winnerResultIndicator = 2;
    close all
    
    
elseif compScoreDiagFromRight == 3;
    winnerResult = msgbox(computerWin);
    winnerResultIndicator = 2;
    close all
    
    
else
end

 end
 

if winnerResultIndicator == 1;
    askRematch = input(promptRematchWinner, 's')
    if askRematch == 'Y'
        n=1;
    elseif askRematch == 'N'
        n=1;
    else 
           promptRematchWinner = 'Cmon winner, please reply with Y or N  ' % If user inputs invalid answer
           askRematch = input(promptRematchWinner, 's')
    if askRematch == 'Y'
        n=1;
        disp('Great! Lets go again!')
    elseif askRematch == 'N'
        n=1;
        disp('Okay, come back soon! Goodbye!')
        quit
        
    else disp('Alright, I am just going to assume you do not want to play again. Have a nice day!')
        quit
    end
    end

    
elseif winnerResultIndicator == 2;
    askRematch = input(promptRematchLoser, 's')
    if askRematch == 'Y'
        n=1;
    elseif askRematch == 'N'
        n=1;
    else 
           promptRematchLoser = 'Hey you lost, but you can try again. Please reply with Y or N  ' % If user inputs invalid answer
           askRematch = input(promptRematchLoser, 's')
    if askRematch == 'Y'
        n=1;
        disp('Great! Lets go again!')
    elseif askRematch == 'N'
        n=1;
        disp('Okay, come back soon! Goodbye!')
        quit
        
    else disp('Alright, I am just going to assume you do not want to play again. Have a nice day!')
        quit
    end
    end
    
elseif winnerResultIndicator == 0
    n=n;
else
draw = msgbox('It is a Draw!');
    askRematch = input(promptRematchDraw, 's')
        askRematch = input(promptRematchDraw, 's')
    if askRematch == 'Y'
        n=1;
    elseif askRematch == 'N'
        n=1;
    else 
           promptRematchDraw = 'You don''t want to end on a tie! Please reply with Y or N  ' % If user inputs invalid answer
           askRematch = input(promptRematchDraw, 's')
    if askRematch == 'Y'
        n=1;
        disp('Great! Lets go again!')
    elseif askRematch == 'N'
        n=1;
        disp('Okay, come back soon! Goodbye!')
        quit
        
    else disp('Alright, I am just going to assume you do not want to play again. Have a nice day!')
        quit
    end
    end
    
end
end
  
                    %!!! CODE FOR THE COMPUTER'S TURN !!!%

while n == 2|4|6|8;

nx=0;               % Counter for ensuring that the computer does not place marker in an unwanted position 
ny=0;               % Counter for ensuring that the computer does not place marker in an unwanted position 
    
while nx == 0       % Counter for ensuring that the computer does not place marker in an unwanted position
    
computerOutputx = randi([2 10],1);
if computerOutputx == 1
    nx = 0;
elseif computerOutputx == 3
    nx = 0;
elseif computerOutputx == 4
    nx = 0;
elseif computerOutputx == 5
    nx = 0;
elseif computerOutputx == 7
    nx = 0;
elseif computerOutputx == 8
    nx = 0;
elseif computerOutputx == 9
    nx = 0;
elseif computerOutputx == 11
    nx = 0;
else
    nx = 1;

end
end

while ny == 0
computerOutputy = randi([2 10],1);
if computerOutputy == 1
    ny = 0;
elseif computerOutputy == 3
    ny = 0;
elseif computerOutputy == 4
    ny = 0;
elseif computerOutputy == 5
    ny = 0;
elseif computerOutputy == 7
    ny = 0;
elseif computerOutputy == 8
    ny = 0;
elseif computerOutputy == 9
    ny = 0;
elseif computerOutputy == 11
    ny = 0;
else
    ny = 1;

end
end

   ComputerInput1 = ([computerOutputx,computerOutputy]);
   
if ComputerInput1 == ([2,10])
    if slot1 == 0
        delete(slotLabel1Text)
        plot(computerOutputx,computerOutputy,'bo', 'MarkerSize', 60)
        slot1 = 1;
        n=n+1;
        compScoreColumn1 = compScoreColumn1 + 1;
        compScoreRow1 = compScoreRow1 + 1;
        compScoreDiagFromLeft = compScoreDiagFromLeft +1;
        break
        
    else
    end
        
elseif ComputerInput1 == ([2,6])
    if slot2 == 0
        delete(slotLabel2Text)
        plot(computerOutputx,computerOutputy,'bo', 'MarkerSize', 60)
        slot2 = 1;
        n=n+1;
        compScoreColumn1 = compScoreColumn1 + 1;
        compScoreRow2 = compScoreRow2 + 1;
        break
    else
    end
        
elseif ComputerInput1 == ([2,2])
      if slot3 == 0
        delete(slotLabel3Text)
        plot(computerOutputx,computerOutputy,'bo', 'MarkerSize', 60)
        slot3 = 1;
        n=n+1;
        compScoreColumn1 = compScoreColumn1 + 1;
        compScoreRow3 = compScoreRow3 + 1;
        compScoreDiagFromRight = compScoreDiagFromRight+1;
        break
        
      else
      end
    
elseif ComputerInput1 == ([6,10])
   if slot4 == 0
        delete(slotLabel4Text)
        plot(computerOutputx,computerOutputy,'bo', 'MarkerSize', 60)
        slot4 = 1;
        n=n+1;
        compScoreColumn2 = compScoreColumn2 +1;
        compScoreRow1 = compScoreRow1 + 1;
        break
        
   else
   end
    
elseif ComputerInput1 == ([6,6])
    if slot5 == 0
        delete(slotLabel5Text)
        plot(computerOutputx,computerOutputy,'bo', 'MarkerSize', 60)
        slot5 = 1;
        n=n+1;
        compScoreColumn2 = compScoreColumn2 +1;
        compScoreRow2 = compScoreRow2 + 1;
        compScoreDiagFromLeft = compScoreDiagFromLeft +1;
        compScoreDiagFromRight = compScoreDiagFromRight+1;
        break
        
    else
    end
    
elseif ComputerInput1 == ([6,2])
    if slot6 == 0
        delete(slotLabel6Text)
        plot(computerOutputx,computerOutputy,'bo', 'MarkerSize', 60)
        slot6 = 1;
        n=n+1;
        compScoreColumn2 = compScoreColumn2 +1;
        compScoreRow3 = compScoreRow3 + 1;
        break
        
    else
    end

elseif ComputerInput1 == ([10,10])
   if slot7 == 0
        delete(slotLabel7Text)
        plot(computerOutputx,computerOutputy,'bo', 'MarkerSize', 60)
        slot7 = 1;
        n=n+1;
        compScoreColumn3 = compScoreColumn3 +1;
        compScoreRow1 = compScoreRow1 + 1;
        compScoreDiagFromRight = compScoreDiagFromRight+1;
        break
        
   else
   end

    
elseif ComputerInput1 == ([10,6])
   if slot8 == 0
        delete(slotLabel8Text)
        plot(computerOutputx,computerOutputy,'bo', 'MarkerSize', 60)
        slot8 = 1;
        n=n+1;
        compScoreColumn3 = compScoreColumn3 +1;
        compScoreRow2 = compScoreRow2 + 1;
        break
        
   else 
   end
    
elseif ComputerInput1 == ([10,2])
    if slot9 == 0
        delete(slotLabel9Text)
        plot(computerOutputx,computerOutputy,'bo', 'MarkerSize', 60)
        slot9 = 1;
        n=n+1;
        compScoreColumn3 = compScoreColumn3 +1;
        compScoreRow3 = compScoreRow3 + 1;
        break
        
    else
        n;
    end

else
    n

end
end 
    
% Determining if there is a winner %

 if     winnerResultIndicator ==0 
if userScoreColumn1 == 3;
    msgbox('You Win!');
    winnerResultIndicator = 1;
    close all
    
    
elseif userScoreColumn2 == 3;
    msgbox('You Win!');
    winnerResultIndicator = 1;
    close all
     
    
    elseif userScoreColumn3 == 3;
    msgbox('You Win!');
    winnerResultIndicator = 1;
    close all
    
    
    elseif userScoreRow1 == 3;
    msgbox('You Win!');
    winnerResultIndicator = 1;
    close all
    
    
    elseif userScoreRow2 == 3;
    msgbox('You Win!');
    winnerResultIndicator = 1;
    close all
    
    
    elseif userScoreRow3 == 3;
    msgbox('You Win!');  
    winnerResultIndicator = 1;
    close all
    
    
    elseif userScoreDiagFromLeft == 3;
    msgbox('You Win!');
    winnerResultIndicator = 1;
    close all
    
    
    elseif userScoreDiagFromRight == 3;
    msgbox('You Win!');
    winnerResultIndicator = 1;
    close all
    
    
elseif compScoreColumn1 == 3;
    msgbox('You Lose!');
    winnerResultIndicator = 2;
    close all
    
    
elseif compScoreColumn2 == 3;
    msgbox('You Lose!');
    winnerResultIndicator = 2;
    close all
    
    
elseif compScoreColumn3 == 3;
    msgbox('You Lose!');
    winnerResultIndicator = 2;
    close all
    
    
elseif compScoreRow1 == 3;
    msgbox('You Lose!');
    winnerResultIndicator = 2;
    close all
    
    
elseif compScoreRow2 == 3;
    msgbox('You Lose!');
    winnerResultIndicator = 2;
    close all
    
    
elseif compScoreRow3 == 3;
    msgbox('You Lose!');
    winnerResultIndicator = 2;
    close all
    
elseif compScoreDiagFromLeft == 3;
    msgbox('You Lose!');
    winnerResultIndicator = 2;
    close all
    
    
elseif compScoreDiagFromRight == 3;
    msgbox('You Lose!');
    winnerResultIndicator = 2;
    close all
    
    
else
end

 end
 

if winnerResultIndicator == 1;
    askRematch = input(promptRematchWinner, 's')
    if askRematch == 'Y'
        n=1;
        continue
    elseif askRematch == 'N'
        n=1;
        quit
    else 
           promptRematchWinner = 'Please reply with Y or N  ' % If user inputs invalid answer
           askRematch = input(promptRematchWinner, 's')
    if askRematch == 'Y'
        n=1;
        disp('Great! Lets go again!')
        continue 
    elseif askRematch == 'N'
        n=1;
        disp('Okay, come back soon! Goodbye!')
        quit
        
    else disp('Alright, I am just going to assume you do not want to play again. Have a nice day!')
        quit
    end
    end

    
elseif winnerResultIndicator == 2;
    askRematch = input(promptRematchLoser, 's')
        askRematch = input(promptRematchLoser, 's')
    if askRematch == 'Y'
        n=1;
        continue
    elseif askRematch == 'N'
        n=1;
        quit
    else 
           promptRematchLoser = 'Please reply with Y or N  ' % If user inputs invalid answer
           askRematch = input(promptRematchLoser, 's')
    if askRematch == 'Y'
        n=1;
        disp('Great! Lets go again!')
        continue
    elseif askRematch == 'N'
        n=1;
                disp('Okay, come back soon! Goodbye!')
        quit
        
    else disp('Alright, I am just going to assume you do not want to play again. Have a nice day!')
        quit
    end
    end
    
elseif winnerResultIndicator == 0
    n=n;
else
draw = msgbox('It is a Draw!');
    askRematch = input(promptRematchDraw, 's')
        askRematch = input(promptRematchDraw, 's')
    if askRematch == 'Y'
        n=1;
        continue
    elseif askRematch == 'N'
        n=1;
        break
        
    else 
           promptRematchDraw = 'Please reply with Y or N  ' % If user inputs invalid answer
           askRematch = input(promptRematchDraw, 's')
           
    if askRematch == 'Y'
        n=1;
        disp('Great! Lets go again!')
        continue
        
    elseif askRematch == 'N'
        n=1;
        disp('Okay, come back soon! Goodbye!')
        break
        
    else disp('Alright, I am just going to assume you do not want to play again. Have a nice day!')
        break
    end
    end
    
    
    end
end
 
end


%% User Goes Second %%
% This section codes the scenario if the user decided to go second

if k==2  % k is an indication of player turn number, 2 means player goes second
    
n=1;     % Counter indicating what turn number it is 


for t = (n:10)                       % Limiting the game to 9 rounds

if askRematch == 'Y' % If user has already played and wants to play again
       
    figure                      % Creating the figure where the game board will be generated
    hold on                     % Allowing multiple lines to be plot
    title('Tic-Tac-Toe');       % Creating a title for the figure
    xlim([0 12]);               % Adjusting x-axis to span 0 to 12
    ylim([0 12]);               % Adjusting y-axis to span 0 to 12
   
% Creating lines for the Game Board %
    xline(4);                   % Creating a vertical line at x = 4
    xline(8);                   % Creating a vertical line at x = 8
    yline(4);                   % Creating a horizontal line at y = 4
    yline(8);                   % Creating a horizontal line at y = 8

% Redefining slot numerical indicators so the slots are known to be empty

    slot1 = 0;
    slot2 = 0;
    slot3 = 0;
    slot4 = 0;
    slot5 = 0;
    slot6 = 0;
    slot7 = 0;
    slot8 = 0;
    slot9 = 0;

% Readding text labels to each slot on the Tic-Tac-Toe board %

    slotLabel1Text = text(1.5,10,slotLabel1,'FontSize', 60, 'Color', 'r');
    slotLabel2Text = text(1.5,6,slotLabel2,'FontSize', 60, 'Color', 'r');
    slotLabel3Text = text(1.5,2,slotLabel3,'FontSize', 60, 'Color', 'r');
    slotLabel4Text = text(5.5,10,slotLabel4,'FontSize', 60, 'Color', 'r');
    slotLabel5Text = text(5.5,6,slotLabel5,'FontSize', 60, 'Color', 'r');
    slotLabel6Text = text(5.5,2,slotLabel6,'FontSize', 60, 'Color', 'r');
    slotLabel7Text = text(9.5,10,slotLabel7,'FontSize', 60, 'Color', 'r');
    slotLabel8Text = text(9.5,6,slotLabel8,'FontSize', 60, 'Color', 'r');
    slotLabel9Text = text(9.5,2,slotLabel9,'FontSize', 60, 'Color', 'r');

    pause(1)        % Pause for 1 second

    % Defining Variables to determine who wins

    % User Score Variables %
    userScoreColumn1 = 0;       % Column 1 doesn't have user markers
    userScoreColumn2 = 0;       % Column 2 doesn't have user markers
    userScoreColumn3 = 0;       % Column 3 doesn't have user markers
    userScoreRow1 = 0;          % Row 1 doesn't have user markers
    userScoreRow2 = 0;          % Row 2 doesn't have user markers
    userScoreRow3 = 0;          % Row 3 doesn't have user markers
    userScoreDiagFromLeft = 0;  % Diagnoal Starting from the left doesn't have user markers
    userScoreDiagFromRight = 0; % Diagnoal Starting from the right doesn't have user markers

    % Computer Score Variables %
    compScoreColumn1 = 0;       % Column 1 doesn't have computer markers
    compScoreColumn2 = 0;       % Column 2 doesn't have computer markers
    compScoreColumn3 = 0;       % Column 3 doesn't have computer markers
    compScoreRow1 = 0;          % Row 1 doesn't have computer markers
    compScoreRow2 = 0;          % Row 2 doesn't have computer markers
    compScoreRow3 = 0;          % Row 3 doesn't have computer markers
    compScoreDiagFromLeft = 0;  % Diagnoal Starting from the left doesn't have computer markers
    compScoreDiagFromRight = 0; % Diagnoal Starting from the right doesn't have computer markers

    % Numerical indicator for determining if someone has won
    winnerResultIndicator = 0;  

    % Defined message for prompting rematch
    promptRematchWinner = 'Congratulations winner! Would you like to play again? Y/N     ';
    promptRematchLoser = 'Hey, don''t give up! Would you like to play again? Y/N     ';
    promptRematchDraw = 'Well that could have ended better! Would you like to play again? Y/N     ';
    askRematch = 0;
       else
       end
    
% COMPUTER TURN 1 %

while n == 1|3|5|7|9        
 
nx=0;               % Counter for ensuring that the computer does not place marker in an unwanted position 
ny=0;               % Counter for ensuring that the computer does not place marker in an unwanted position 
    
while nx == 0       % Counter for ensuring that the computer does not place marker in an unwanted position
    
computerOutputx = randi([2 10],1);
if computerOutputx == 1
    nx = 0;
elseif computerOutputx == 3
    nx = 0;
elseif computerOutputx == 4
    nx = 0;
elseif computerOutputx == 5
    nx = 0;
elseif computerOutputx == 7
    nx = 0;
elseif computerOutputx == 8
    nx = 0;
elseif computerOutputx == 9
    nx = 0;
elseif computerOutputx == 11
    nx = 0;
else
    nx = 1;

end
end

while ny == 0
computerOutputy = randi([2 10],1);
if computerOutputy == 1
    ny = 0;
elseif computerOutputy == 3
    ny = 0;
elseif computerOutputy == 4
    ny = 0;
elseif computerOutputy == 5
    ny = 0;
elseif computerOutputy == 7
    ny = 0;
elseif computerOutputy == 8
    ny = 0;
elseif computerOutputy == 9
    ny = 0;
elseif computerOutputy == 11
    ny = 0;
else
    ny = 1;

end
end

   ComputerInput1 = ([computerOutputx,computerOutputy]);
   
if ComputerInput1 == ([2,10])
    if slot1 == 0
        delete(slotLabel1Text)
        plot(computerOutputx,computerOutputy,'bo', 'MarkerSize', 60)
        slot1 = 1;
        n=n+1;
        compScoreColumn1 = compScoreColumn1 + 1;
        compScoreRow1 = compScoreRow1 + 1;
        compScoreDiagFromLeft = compScoreDiagFromLeft +1;
        break
        
    else
    end
        
elseif ComputerInput1 == ([2,6])
    if slot2 == 0
        delete(slotLabel2Text)
        plot(computerOutputx,computerOutputy,'bo', 'MarkerSize', 60)
        slot2 = 1;
        n=n+1;
        compScoreColumn1 = compScoreColumn1 + 1;
        compScoreRow2 = compScoreRow2 + 1;
        break
    else
    end
        
elseif ComputerInput1 == ([2,2])
      if slot3 == 0
        delete(slotLabel3Text)
        plot(computerOutputx,computerOutputy,'bo', 'MarkerSize', 60)
        slot3 = 1;
        n=n+1;
        compScoreColumn1 = compScoreColumn1 + 1;
        compScoreRow3 = compScoreRow3 + 1;
        compScoreDiagFromRight = compScoreDiagFromRight+1;
        break
        
      else
      end
    
elseif ComputerInput1 == ([6,10])
   if slot4 == 0
        delete(slotLabel4Text)
        plot(computerOutputx,computerOutputy,'bo', 'MarkerSize', 60)
        slot4 = 1;
        n=n+1;
        compScoreColumn2 = compScoreColumn2 +1;
        compScoreRow1 = compScoreRow1 + 1;
        break
        
   else
   end
    
elseif ComputerInput1 == ([6,6])
    if slot5 == 0
        delete(slotLabel5Text)
        plot(computerOutputx,computerOutputy,'bo', 'MarkerSize', 60)
        slot5 = 1;
        n=n+1;
        compScoreColumn2 = compScoreColumn2 +1;
        compScoreRow2 = compScoreRow2 + 1;
        compScoreDiagFromLeft = compScoreDiagFromLeft +1;
        compScoreDiagFromRight = compScoreDiagFromRight+1;
        break
        
    else
    end
    
elseif ComputerInput1 == ([6,2])
    if slot6 == 0
        delete(slotLabel6Text)
        plot(computerOutputx,computerOutputy,'bo', 'MarkerSize', 60)
        slot6 = 1;
        n=n+1;
        compScoreColumn2 = compScoreColumn2 +1;
        compScoreRow3 = compScoreRow3 + 1;
        break
        
    else
    end

elseif ComputerInput1 == ([10,10])
   if slot7 == 0
        delete(slotLabel7Text)
        plot(computerOutputx,computerOutputy,'bo', 'MarkerSize', 60)
        slot7 = 1;
        n=n+1;
        compScoreColumn3 = compScoreColumn3 +1;
        compScoreRow1 = compScoreRow1 + 1;
        compScoreDiagFromRight = compScoreDiagFromRight+1;
        break
        
   else
   end

    
elseif ComputerInput1 == ([10,6])
   if slot8 == 0
        delete(slotLabel8Text)
        plot(computerOutputx,computerOutputy,'bo', 'MarkerSize', 60)
        slot8 = 1;
        n=n+1;
        compScoreColumn3 = compScoreColumn3 +1;
        compScoreRow2 = compScoreRow2 + 1;
        break
        
   else 
   end
    
elseif ComputerInput1 == ([10,2])
    if slot9 == 0
        delete(slotLabel9Text)
        plot(computerOutputx,computerOutputy,'bo', 'MarkerSize', 60)
        slot9 = 1;
        n=n+1;
        compScoreColumn3 = compScoreColumn3 +1;
        compScoreRow3 = compScoreRow3 + 1;
        break
        
    else
        n;
    end

else
    n

end
end 

 if     winnerResultIndicator ==0 
if userScoreColumn1 == 3;
    msgbox('You Win!');
    winnerResultIndicator = 1;
    close all
    
    
elseif userScoreColumn2 == 3;
    msgbox('You Win!');
    winnerResultIndicator = 1;
    close all
     
    
    elseif userScoreColumn3 == 3;
    msgbox('You Win!');
    winnerResultIndicator = 1;
    close all
    
    
    elseif userScoreRow1 == 3;
    msgbox('You Win!');
    winnerResultIndicator = 1;
    close all
    
    
    elseif userScoreRow2 == 3;
    msgbox('You Win!');
    winnerResultIndicator = 1;
    close all
    
    
    elseif userScoreRow3 == 3;
    msgbox('You Win!'); 
    winnerResultIndicator = 1;
    close all
    
    
    elseif userScoreDiagFromLeft == 3;
    msgbox('You Win!');
    winnerResultIndicator = 1;
    close all
    
    
    elseif userScoreDiagFromRight == 3;
    msgbox('You Win!');
    winnerResultIndicator = 1;
    close all
    
    
elseif compScoreColumn1 == 3;
    msgbox('You Lose!');
    winnerResultIndicator = 2;
    close all
    
    
elseif compScoreColumn2 == 3;
    msgbox('You Lose!');
    winnerResultIndicator = 2;
    close all
    
    
elseif compScoreColumn3 == 3;
    msgbox('You Lose!');
    winnerResultIndicator = 2;
    close all
    
    
elseif compScoreRow1 == 3;
    msgbox('You Lose!');
    winnerResultIndicator = 2;
    close all
    
    
elseif compScoreRow2 == 3;
    msgbox('You Lose!');
    winnerResultIndicator = 2;
    close all
    
    
elseif compScoreRow3 == 3;
    msgbox('You Lose!');
    winnerResultIndicator = 2;
    close all  
    
    
elseif compScoreDiagFromLeft == 3;
    msgbox('You Lose!');
    winnerResultIndicator = 2;
    close all
    
    
elseif compScoreDiagFromRight == 3;
    msgbox('You Lose!');
    winnerResultIndicator = 2;
    close all
    
    
else
end

 end

if winnerResultIndicator == 1;
    askRematch = input(promptRematchWinner, 's')
    if askRematch == 'Y'
        n=1;
    elseif askRematch == 'N'
        n=1;
    else 
           promptRematchWinner = 'Please reply with Y or N  ' % If user inputs invalid answer
           askRematch = input(promptRematchWinner, 's')
    if askRematch == 'Y'
        n=1;
        disp('Great! Lets go again!')
    elseif askRematch == 'N'
        n=1;
        disp('Okay, come back soon! Goodbye!')
        break
        
    else disp('Alright, I am just going to assume you do not want to play again. Have a nice day!')
        break
    end
    end

    
elseif winnerResultIndicator == 2;
    askRematch = input(promptRematchLoser, 's')
        askRematch = input(promptRematchLoser, 's')
    if askRematch == 'Y'
        n=1;
    elseif askRematch == 'N'
        n=1;
    else 
           promptRematchLoser = 'Please reply with Y or N  ' % If user inputs invalid answer
           askRematch = input(promptRematchLoser, 's')
    if askRematch == 'Y'
        n=1;
        disp('Great! Lets go again!')
    elseif askRematch == 'N'
        n=1;
        disp('Okay, come back soon! Goodbye!')
        break
        
    else disp('Alright, I am just going to assume you do not want to play again. Have a nice day!')
        break
    end
    end
    
elseif winnerResultIndicator == 0
    n=n;
else
draw = msgbox('It is a Draw!');
    askRematch = input(promptRematchDraw, 's')
        askRematch = input(promptRematchDraw, 's')
    if askRematch == 'Y'
        n=1;
    elseif askRematch == 'N'
        n=1;
    else 
           promptRematchDraw = 'Please reply with Y or N  ' % If user inputs invalid answer
           askRematch = input(promptRematchDraw, 's')
    if askRematch == 'Y'
        n=1;
        disp('Great! Lets go again!')
    elseif askRematch == 'N'
        n=1;
        disp('Okay, come back soon! Goodbye!')
        break
        
    else disp('Alright, I am just going to assume you do not want to play again. Have a nice day!')
        break
    end
    end
    
    
    end
  
% PLAYER TURN %

while n == 2|4|6|8;
disp('Your Turn!')
    userInput1 = input('What is the number of the box you wish to select?   ');
    if userInput1 == 1
        if slot1 == 0
        delete(slotLabel1Text)
        plot(2,10,'rX', 'MarkerSize', 60)
        slot1 = 'Filled';
        n=n+1;
        userScoreColumn1 = userScoreColumn1 + 1;
        userScoreRow1 = userScoreRow1 + 1;
        userScoreDiagFromLeft = userScoreDiagFromLeft +1;
        break

        else
        end
        
    elseif userInput1 == 'One'
        if slot1 == 0
        delete(slotLabel1Text)
        plot(2,10,'rX', 'MarkerSize', 60)
        slot1 = 'Filled';
        n=n+1;
        userScoreColumn1 = userScoreColumn1 + 1;
        userScoreRow1 = userScoreRow1 + 1;
        userScoreDiagFromLeft = userScoreDiagFromLeft +1;
        break
        
        else
        end
        
    elseif userInput1 == 'one'
        if slot1 == 0
        delete(slotLabel1Text)
        plot(2,10,'rX', 'MarkerSize', 60)
        slot1 = 'Filled';
        n=n+1;
        userScoreColumn1 = userScoreColumn1 + 1;
        userScoreRow1 = userScoreRow1 + 1;
        userScoreDiagFromLeft = userScoreDiagFromLeft +1;
        break
        
        else
        end
        
     elseif userInput1 == 2
         if slot2 == 0
        delete(slotLabel2Text)
        plot(2,6,'rX', 'MarkerSize', 60)
        slot2 = 'Filled';
        n=n+1;
        userScoreColumn1 = userScoreColumn1 + 1;
        userScoreRow2 = userScoreRow2 + 1;
        break
        
         else
         end
        
    elseif userInput1 == 'Two'
        if slot2 == 0
        delete(slotLabel2Text)
        plot(2,6,'rX', 'MarkerSize', 60)
        slot2 = 'Filled';
        n=n+1;
        userScoreColumn1 = userScoreColumn1 + 1;
        userScoreRow2 = userScoreRow2 + 1;
        break
        
        else 
        end
        
    elseif userInput1 == 'two'
        if slot2 == 0
        delete(slotLabel2Text)
        plot(2,6,'rX', 'MarkerSize', 60)
        slot2 = 'Filled';
        n=n+1;
        userScoreColumn1 = userScoreColumn1 + 1;
        userScoreRow2 = userScoreRow2 + 1;
        break
        
        else
        end
        
    elseif userInput1 == 3
        if slot3 == 0
        delete(slotLabel3Text)
        plot(2,2,'rX', 'MarkerSize', 60)
        slot3 = 'Filled';
        n=n+1;
        userScoreColumn1 = userScoreColumn1 + 1;
        userScoreRow3 = userScoreRow3 + 1;
        userScoreDiagFromRight = userScoreDiagFromRight+1;
        break
        
        else
        end
        
    elseif userInput1 == 'Three'
        if slot3 == 0
        delete(slotLabel3Text)
        plot(2,2,'rX', 'MarkerSize', 60)
        slot3 = 'Filled';
        n=n+1;        
        userScoreColumn1 = userScoreColumn1 + 1;
        userScoreRow3 = userScoreRow3 + 1;
        userScoreDiagFromRight = userScoreDiagFromRight+1;
        break
        
        else
        end
        
    elseif userInput1 == 'three'
        if slot3 == 0
        delete(slotLabel3Text)
        plot(2,2,'rX', 'MarkerSize', 60)
        slot3 = 'Filled';
        n=n+1;        
        userScoreColumn1 = userScoreColumn1 + 1;
        userScoreRow3 = userScoreRow3 + 1;
        userScoreDiagFromRight = userScoreDiagFromRight+1;
        break
        
        else
        end
        
    elseif userInput1 == 4
        if slot4 == 0
        delete(slotLabel4Text)
        plot(6,10,'rX', 'MarkerSize', 60)
        slot4 = 'Filled';
        n=n+1;
        userScoreColumn2 = userScoreColumn2 +1;
        userScoreRow1 = userScoreRow1 + 1;
        break
        
        else
        end
        
    elseif userInput1 == 'Four'
        if slot4 == 0
        delete(slotLabel4Text)
        plot(6,10,'rX', 'MarkerSize', 60)
        slot4 = 'Filled';
        n=n+1;
        userScoreColumn2 = userScoreColumn2 +1;
        userScoreRow1 = userScoreRow1 + 1;
        break
        
        else
        end
        
    elseif userInput1 == 'four'
        if slot4 == 0
        delete(slotLabel4Text)
        plot(6,10,'rX', 'MarkerSize', 60)
        slot4 = 'Filled';
        n=n+1;
        userScoreColumn2 = userScoreColumn2 +1;
        userScoreRow1 = userScoreRow1 + 1;
        break
        
        else
        end
        
    elseif userInput1 == 5
        if slot5 == 0
        delete(slotLabel5Text)
        plot(6,6,'rX', 'MarkerSize', 60)
        slot5 = 'Filled';
        n=n+1;
        userScoreColumn2 = userScoreColumn2 +1;
        userScoreRow2 = userScoreRow2 + 1;
        userScoreDiagFromLeft = userScoreDiagFromLeft +1;
        userScoreDiagFromRight = userScoreDiagFromRight+1;
        break
        
        else
        end
        
    elseif userInput1 == 'Five'
        if slot5 == 0
        delete(slotLabel5Text)
        plot(6,6,'rX', 'MarkerSize', 60)
        slot5 = 'Filled';
        n=n+1;        
        userScoreColumn2 = userScoreColumn2 +1;
        userScoreRow2 = userScoreRow2 + 1;
        userScoreDiagFromLeft = userScoreDiagFromLeft +1;
        userScoreDiagFromRight = userScoreDiagFromRight+1;
        break
        
        else
        end
        
    elseif userInput1 == 'five'
        if slot5 == 0
        delete(slotLabel5Text)
        plot(6,6,'rX', 'MarkerSize', 60)
        slot5 = 'Filled';
        n=n+1;        
        userScoreColumn2 = userScoreColumn2 +1;
        userScoreRow2 = userScoreRow2 + 1;
        userScoreDiagFromLeft = userScoreDiagFromLeft +1;
        userScoreDiagFromRight = userScoreDiagFromRight+1;
        break
        
        else
        end
        
    elseif userInput1 == 6
        if slot6 == 0
        delete(slotLabel6Text)
        plot(6,2,'rX', 'MarkerSize', 60)
        slot6 = 'Filled';
        n=n+1;        
        userScoreColumn2 = userScoreColumn2 +1;
        userScoreRow3 = userScoreRow3 + 1;
        break
        
        else
        end
        
    elseif userInput1 == 'Six'
        if slot6 == 0
        delete(slotLabel6Text)
        plot(6,2,'rX', 'MarkerSize', 60)
        slot6 = 'Filled';
        n=n+1;        
        userScoreColumn2 = userScoreColumn2 +1;
        userScoreRow3 = userScoreRow3 + 1;
        break
        
        else
        end
        
    elseif userInput1 == 'six'
        if slot6 == 0
        delete(slotLabel6Text)
        plot(6,2,'rX', 'MarkerSize', 60)
        slot6 = 'Filled';
        n=n+1;        
        userScoreColumn2 = userScoreColumn2 +1;
        userScoreRow3 = userScoreRow3 + 1;
        break
        
        else
        end
        
    elseif userInput1 == 7
        if slot7 == 0
        delete(slotLabel7Text)
        plot(10,10,'rX', 'MarkerSize', 60)
        slot7 = 'Filled';
        n=n+1;
        userScoreColumn3 = userScoreColumn3 +1;
        userScoreRow1 = userScoreRow1 + 1;
        userScoreDiagFromRight = userScoreDiagFromRight+1;
        break
        
        else
        end
        
    elseif userInput1 == 'Seven'
        if slot7 == 0
        delete(slotLabel7Text)
        plot(10,10,'rX', 'MarkerSize', 60)
        slot7 = 'Filled';
        n=n+1;
        userScoreColumn3 = userScoreColumn3 +1;
        userScoreRow1 = userScoreRow1 + 1;
        userScoreDiagFromRight = userScoreDiagFromRight+1;
        break
        
        else
        end
        
    elseif userInput1 == 'seven'
        if slot7 == 0
        delete(slotLabel7Text)
        plot(10,10,'rX', 'MarkerSize', 60)
        slot7 = 'Filled';
        n=n+1;
        userScoreColumn3 = userScoreColumn3 +1;
        userScoreRow1 = userScoreRow1 + 1;
        userScoreDiagFromRight = userScoreDiagFromRight+1;
        break
        
        else
        end
        
    elseif userInput1 == 8
        if slot8 == 0
        delete(slotLabel8Text)
        plot(10,6,'rX', 'MarkerSize', 60)
        slot8 = 'Filled';
        n=n+1;        
        userScoreColumn3 = userScoreColumn3 +1;
        userScoreRow2 = userScoreRow2 + 1;
        break
        
        else
        end
        
    elseif userInput1 == 'Eight'
        if slot8 == 0
        delete(slotLabel8Text)
        plot(10,6,'rX', 'MarkerSize', 60)
        slot8 = 'Filled';
        n=n+1;        
        userScoreColumn3 = userScoreColumn3 +1;
        userScoreRow2 = userScoreRow2 + 1;
        break
        
        else
        end
        
    elseif userInput1 == 'eight'
        if slot8 == 0
        delete(slotLabel8Text)
        plot(10,6,'rX', 'MarkerSize', 60)
        slot8 = 'Filled';
        n=n+1;        
        userScoreColumn3 = userScoreColumn3 +1;
        userScoreRow2 = userScoreRow2 + 1;
        break
        
        else
        end
        
    elseif userInput1 == 9
        if slot9 == 0
        delete(slotLabel9Text)
        plot(10,2,'rX', 'MarkerSize', 60)
        slot9 = 'Filled';
        n=n+1;
        userScoreColumn3 = userScoreColumn3 +1;
        userScoreRow3 = userScoreRow3 + 1;
        break
        
        else
        end
        
    elseif userInput1 == 'Nine'
        if slot9 == 0
        delete(slotLabel9Text)
        plot(10,2,'rX', 'MarkerSize', 60)
        slot9 = 'Filled';
        n=n+1;
        userScoreColumn3 = userScoreColumn3 +1;
        userScoreRow3 = userScoreRow3 + 1;
        break
        
        else
        end
        
    elseif userInput1 == 'nine'
        if slot9 == 0
        delete(slotLabel9Text)
        plot(10,2,'rX', 'MarkerSize', 60)
        slot9 = 'Filled';
        n=n+1;
        userScoreColumn3 = userScoreColumn3 +1;
        userScoreRow3 = userScoreRow3 + 1;
        break
        
        else
        end
    
    end


% Determining if there is a winner %

 if     winnerResultIndicator ==0 
if userScoreColumn1 == 3;
    msgbox('You Win!')
    winnerResultIndicator = 1;
    
    
    
elseif userScoreColumn2 == 3;
    msgbox('You Win!')
    winnerResultIndicator = 1;
    
    
    
    elseif userScoreColumn3 == 3;
    msgbox('You Win')
    winnerResultIndicator = 1;
    
    
    
    elseif userScoreRow1 == 3;
    msgbox('You Win!')
    winnerResultIndicator = 1;
    
   
    
    elseif userScoreRow2 == 3;
    msgbox('You Win!')
    winnerResultIndicator = 1;
    
    
    
    elseif userScoreRow3 == 3;
    msgbox('You Win!')  
    winnerResultIndicator = 1;
    
    
    
    elseif userScoreDiagFromLeft == 3;
    msgbox('You Win!')
    winnerResultIndicator = 1;
    
    
    
    elseif userScoreDiagFromRight == 3;
    msgbox('You Win!')
    winnerResultIndicator = 1;
    
   
    
elseif compScoreColumn1 == 3;
    msgbox('You Lose!')
    winnerResultIndicator = 2;
    
   
    
elseif compScoreColumn2 == 3;
    msgbox('You Lose!')
    winnerResultIndicator = 2;
    
    
    
elseif compScoreColumn3 == 3;
    msgbox('You Lose!')
    winnerResultIndicator = 2;
    
    
    
elseif compScoreRow1 == 3;
    msgbox('You Lose!')
    winnerResultIndicator = 2;
    
    
    
elseif compScoreRow2 == 3;
    msgbox('You Lose!')
    winnerResultIndicator = 2;
    
    
    
elseif compScoreRow3 == 3;
    msgbox('You Lose!')
    winnerResultIndicator = 2;
      
    
    
elseif compScoreDiagFromLeft == 3;
    msgbox('You Lose!')
    winnerResultIndicator = 2;
    
    
    
elseif compScoreDiagFromRight == 3;
    msgbox('You Lose!')
    winnerResultIndicator = 2;
    
    
    
else
end

 end
 


    
    
end

if winnerResultIndicator == 1;
    askRematch = input(promptRematch, 's')
    if askRematch == 'Y'
        n=1;
    elseif askRematch == 'N'
        n=1;
    else 
           promptRematch = 'Please reply with Y or N  ' % If user inputs invalid answer
           askRematch = input(promptRematch, 's')
    if askRematch == 'Y'
        n=1;
        disp('Great! Lets go again!')
    elseif askRematch == 'N'
        n=1;
        disp('Okay, come back soon! Goodbye!')
        quit
        
    else disp('Alright, I am just going to assume you do not want to play again. Have a nice day!')
        quit
    end
    end

    
elseif winnerResultIndicator == 2;
    askRematch = input(promptRematch, 's')
        askRematch = input(promptRematch, 's')
    if askRematch == 'Y'
        n=1;
    elseif askRematch == 'N'
        n=1;
    else 
           promptRematch = 'Please reply with Y or N  ' % If user inputs invalid answer
           askRematch = input(promptRematch, 's')
    if askRematch == 'Y'
        n=1;
        disp('Great! Lets go again!')
    elseif askRematch == 'N'
        n=1;
        disp('Okay, come back soon! Goodbye!')
        break
        
    else disp('Alright, I am just going to assume you do not want to play again. Have a nice day!')
        break
    end
    end
    
elseif winnerResultIndicator == 0
    n=n;
else
draw = msgbox('It is a Draw!');
    askRematch = input(promptRematch, 's')
        askRematch = input(promptRematch, 's')
    if askRematch == 'Y'
        n=1;
    elseif askRematch == 'N'
        n=1;
    else 
           promptRematch = 'Please reply with Y or N  ' % If user inputs invalid answer
           askRematch = input(promptRematch, 's')
    if askRematch == 'Y'
        n=1;
        disp('Great! Lets go again!')
    elseif askRematch == 'N'
        n=1;
        disp('Okay, come back soon! Goodbye!')
        break
        
    else disp('Alright, I am just going to assume you do not want to play again. Have a nice day!')
        break
    end

end
 
 
end

end
end
