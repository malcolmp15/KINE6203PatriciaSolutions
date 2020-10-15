%% KINE6203 - Assignment 2
% Tic-Tac-Toe Game
% Written by: Patricia M. Butler
% Date: 10-08-2020

% Description: This code was written to generate a tic-tac-toe game that the user can
% play against an AI.

% Developed on Matlab version R2019b, Update 3, with Windows 10 Version

%% Clearing Variables, Command Window, and Closing Figures

clc
clear all
close all

%% Welcome Message
% This section is welcoming the user aand inquiring if they would like to
% play a game

i = 0; % Numerical indicator for identifying if a player wishes to play Tic-Tac-Toe, 1 means want to play, 2 doesn't want to play

while i == 0
    
promptPlay = 'Would you like to play Tic-Tac-Toe? (Y/N)  ' % Asking user if they want to play
userInput = input(promptPlay,'s')                          % User response

if userInput == 'Y'         % If User indicates that they would like to play
    i = 1                           
    promptResponse = 'Great! Lets get started!  ' % Response to user wanting to play

elseif userInput == 'N'     % If User indicates that they would not like to play
    i =2
    promptResponse = 'Get outta here!'            % Response to user not wanting to play

    quit                    % Closing Application
    
else 
    promptResponse = 'Please reply with Y or N  ' % If user inputs invalid answer
    i = 0;
    pause(1.5) % Pause so reader can read promptResponse
    end
end

pause(1.5)     % Brief Pause
clc            % Clears Command Window 

%% Establishing Turn Order
% This section is asking the user if they would prefer to go first or
% second

k = 0;              % Numerical indicator to ensure user selects to go first or second

userInputOrder = 'Would you prefer to go first or second? Please input 1 or 2   ' % Asking user if they would like to go first or second
playerOrder = input(userInputOrder); % Prompting user response

while k == 0            % While user has not selecting turn order
if playerOrder == 1     % If user chooses to go first
    userInputOrderResponse = 'You would like to go first? Alright, lets get started!   '
    k = 1;              % Ending loop; user goes first
elseif playerOrder == 2 % If user chooses to go second
    userInputOrderResponse = 'You would like to go second? They do say first is the worst and second is the best!  '
    k = 2;              % Ending loop; user goes second
else                    % If user does not input valid answer
    userInputOrderResponse = 'Someone was not reading very carefully. I am going to give you another chance, please do not let me down!   '
    pause(1.5)          % Pause
    userInputOrder = 'Would you prefer to go first or second? Please input 1 or 2   '
    
% Giving user another chance to input valid answer

    playerOrder = input(userInputOrder); % Prompting user to input if they would prefer to go first or second
    
    if playerOrder == 1     % If user chooses to go first
        userInputOrderResponse = 'You would like to go first? Alright, lets get started!   '
        k=1;                % Ending loop; user goes first
        
    elseif playerOrder == 2 % If user chooses to go second
        userInputOrderResponse = 'You would like to go second? They do say first is the worst and second is the best!  '
        k=2;                % Ending loop; user goes second
    else                    % If user does not input valid answer again
        'Okay, I give up, you are just going to go first. '
        k = 1;              % Ending loop; user goes first
    end
end
end

pause(1.5)      % Brief Pause
clc

%% Generating Game Board
% This section creates the game board

figure
hold on
title('Tic-Tac-Toe');

xlim([0 12]);
ylim([0 12]);

xline(4);
xline(8);
yline(4);
yline(8);

slotLabel1 = '1';
slotLabel2 = '2';
slotLabel3 = '3';
slotLabel4 = '4';
slotLabel5 = '5';
slotLabel6 = '6';
slotLabel7 = '7';
slotLabel8 = '8';
slotLabel9 = '9';

slot1 = 0;
slot2 = 0;
slot3 = 0;
slot4 = 0;
slot5 = 0;
slot6 = 0;
slot7 = 0;
slot8 = 0;
slot9 = 0;

slotLabel1Text = text(1.5,10,slotLabel1,'FontSize', 60, 'Color', 'r');
slotLabel2Text = text(1.5,6,slotLabel2,'FontSize', 60, 'Color', 'r');
slotLabel3Text = text(1.5,2,slotLabel3,'FontSize', 60, 'Color', 'r');
slotLabel4Text = text(5.5,10,slotLabel4,'FontSize', 60, 'Color', 'r');
slotLabel5Text = text(5.5,6,slotLabel5,'FontSize', 60, 'Color', 'r');
slotLabel6Text = text(5.5,2,slotLabel6,'FontSize', 60, 'Color', 'r');
slotLabel7Text = text(9.5,10,slotLabel7,'FontSize', 60, 'Color', 'r');
slotLabel8Text = text(9.5,6,slotLabel8,'FontSize', 60, 'Color', 'r');
slotLabel9Text = text(9.5,2,slotLabel9,'FontSize', 60, 'Color', 'r');

pause(1)

%% Defining Variables
% This section defines variables that are used throughout the script

% Defining Variables to determine who wins

% User Score Variables
userScoreColumn1 = 0; % Column 1 doesn't have user markers
userScoreColumn2 = 0; % Column 2 doesn't have user markers
userScoreColumn3 = 0; % Column 3 doesn't have user markers
userScoreRow1 = 0;    % Row 1 doesn't have user markers
userScoreRow2 = 0;    % Row 2 doesn't have user markers
userScoreRow3 = 0;    % Row 3 doesn't have user markers
userScoreDiagFromLeft = 0;  % Diagnoal Starting from the left doesn't have user markers
userScoreDiagFromRight = 0; % Diagnoal Starting from the right doesn't have user markers

% Computer Score Variables
compScoreColumn1 = 0;   % Column 1 doesn't have computer markers
compScoreColumn2 = 0;   % Column 2 doesn't have computer markers
compScoreColumn3 = 0;   % Column 3 doesn't have computer markers
compScoreRow1 = 0;      % Row 1 doesn't have computer markers
compScoreRow2 = 0;      % Row 2 doesn't have computer markers
compScoreRow3 = 0;      % Row 3 doesn't have computer markers
compScoreDiagFromLeft = 0;  % Diagnoal Starting from the left doesn't have computer markers
compScoreDiagFromRight = 0; % Diagnoal Starting from the right doesn't have computer markers

winnerResultIndicator = 0;  % Numerical indicator for determining if someone has won
computerWin = 'You Lose!';  % Message if user wins
userWin = 'You Win!';       % Message if user loses

%% User Goes First %%
% This section codes the scenario if the user decided to go first


%% User Goes Second %%
% This section codes the scenario if the user decided to go second

if k==2  % k is an indication of player turn number, 2 means player goes second
    
n=1;     % Counter indicating what turn number it is 

while winnerResultIndicator == 0;   % This loop will run until there is a winner
for t = (n:9)                       % Limiting the game to 9 rounds

nx=0;               % Counter for ensuring that the computer does not place marker in an unwanted position 
ny=0;               % Counter for ensuring that the computer does not place marker in an unwanted position
    
% COMPUTER TURN 1 %
    % TURN 1 %

while n == 1        % While it is the first round
    
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
    else
        n;
    end

else
    n

end
end 

  
% PLAYER TURN 1 %
   % TURN 2 %

while n == 2;
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
        else
        end
        
    elseif userInput1 == 7
        if slot7 == 0
        delete(slotLabel7Text)
        plot(10,10,'r*', 'MarkerSize', 60)
        slot7 = 'Filled';
        n=n+1;
        userScoreColumn3 = userScoreColumn3 +1;
        userScoreRow1 = userScoreRow1 + 1;
        userScoreDiagFromRight = userScoreDiagFromRight+1;
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
        else
        end
    
    end
end
  
% COMPUTER TURN 2 %
    % TURN 3 %

while n == 3  
    nx=0;
    ny=0;
while nx == 0
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
    else
        n;
    end

end 
end

% USER TURN 2 %
   % TURN 4 %

while n == 4;
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
        else
        end
        
    elseif userInput1 == 7
        if slot7 == 0
        delete(slotLabel7Text)
        plot(10,10,'r*', 'MarkerSize', 60)
        slot7 = 'Filled';
        n=n+1;
        userScoreColumn3 = userScoreColumn3 +1;
        userScoreRow1 = userScoreRow1 + 1;
        userScoreDiagFromRight = userScoreDiagFromRight+1;
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
        else
        end
       
    end
end

% COMPUTER TURN 3 %
    % TURN 5 %

while n == 5
    nx=0;
    ny=0;
while nx == 0
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
    else
        n;
    end
end
end

% Determining if there is a winner %

 if     winnerResultIndicator ==0 
if userScoreColumn1 == 3;
    winnerResult = msgbox(userWin)
    winnerResultIndicator = 1;
    close all
    
elseif userScoreColumn2 == 3;
    winnerResult = msgbox(userWin)
    winnerResultIndicator = 1;
    close all
     
    elseif userScoreColumn3 == 3;
    winnerResult = msgbox(userWin)
    winnerResultIndicator = 1;
    close all
    
    elseif userScoreRow1 == 3;
    winnerResult = msgbox(userWin)
    winnerResultIndicator = 1;
    close all
    
    elseif userScoreRow2 == 3;
    winnerResult = msgbox(userWin)
    winnerResultIndicator = 1;
    close all
    
    elseif userScoreRow3 == 3;
    winnerResult = msgbox(userWin)  
    winnerResultIndicator = 1;
    close all
    
    elseif userScoreDiagFromLeft == 3;
    winnerResult = msgbox(userWin)
    winnerResultIndicator = 1;
    close all
    
    elseif userScoreDiagFromRight == 3;
    winnerResult = msgbox(userWin)
    winnerResultIndicator = 1;
    close all
    
elseif compScoreColumn1 == 3;
    winnerResult = msgbox(computerWin)
    winnerResultIndicator = 1;
    close all
    
elseif compScoreColumn2 == 3;
    winnerResult = msgbox(computerWin)
    winnerResultIndicator = 1;
    close all
    
elseif compScoreColumn3 == 3;
    winnerResult = msgbox(computerWin)
    winnerResultIndicator = 1;
    close all
 
elseif compScoreRow1 == 3;
    winnerResult = msgbox(computerWin)
    winnerResultIndicator = 1;
    close all
    
elseif compScoreRow2 == 3;
    winnerResult = msgbox(computerWin)
    winnerResultIndicator = 1;
    close all
    
elseif compScoreRow3 == 3;
    winnerResult = msgbox(computerWin)
    winnerResultIndicator = 1;
    close all  
    
elseif compScoreDiagFromLeft == 3;
    winnerResult = msgbox(computerWin)
    winnerResultIndicator = 1;
    close all

    
elseif compScoreDiagFromRight == 3;
    winnerResult = msgbox(computerWin)
    winnerResultIndicator = 1;
    close all
    
else
end
end

% USER TURN 3 %
  % TURN 6 %

while n == 6;
disp('Your Turn!')
if winnerResultIndicator == 0
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
        else
        end
        
    elseif userInput1 == 7
        if slot7 == 0
        delete(slotLabel7Text)
        plot(10,10,'r*', 'MarkerSize', 60)
        slot7 = 'Filled';
        n=n+1;
        userScoreColumn3 = userScoreColumn3 +1;
        userScoreRow1 = userScoreRow1 + 1;
        userScoreDiagFromRight = userScoreDiagFromRight+1;
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
        else
        end
    
    end
end
end

% Determining if there is a winner %

 if     winnerResultIndicator ==0 
if userScoreColumn1 == 3;
    winnerResult = msgbox(userWin)
    winnerResultIndicator = 1;
    close all
    
elseif userScoreColumn2 == 3;
    winnerResult = msgbox(userWin)
    winnerResultIndicator = 1;
    close all
     
    elseif userScoreColumn3 == 3;
    winnerResult = msgbox(userWin)
    winnerResultIndicator = 1;
    close all
    
    elseif userScoreRow1 == 3;
    winnerResult = msgbox(userWin)
    winnerResultIndicator = 1;
    close all
    
    elseif userScoreRow2 == 3;
    winnerResult = msgbox(userWin)
    winnerResultIndicator = 1;
    close all
    
    elseif userScoreRow3 == 3;
    winnerResult = msgbox(userWin)  
    winnerResultIndicator = 1;
    close all
    
    elseif userScoreDiagFromLeft == 3;
    winnerResult = msgbox(userWin)
    winnerResultIndicator = 1;
    close all
    
    elseif userScoreDiagFromRight == 3;
    winnerResult = msgbox(userWin)
    winnerResultIndicator = 1;
    close all
    
elseif compScoreColumn1 == 3;
    winnerResult = msgbox(computerWin)
    winnerResultIndicator = 1;
    close all
    
elseif compScoreColumn2 == 3;
    winnerResult = msgbox(computerWin)
    winnerResultIndicator = 1;
    close all
    
elseif compScoreColumn3 == 3;
    winnerResult = msgbox(computerWin)
    winnerResultIndicator = 1;
    close all
 
elseif compScoreRow1 == 3;
    winnerResult = msgbox(computerWin)
    winnerResultIndicator = 1;
    close all
    
elseif compScoreRow2 == 3;
    winnerResult = msgbox(computerWin)
    winnerResultIndicator = 1;
    close all
    
elseif compScoreRow3 == 3;
    winnerResult = msgbox(computerWin)
    winnerResultIndicator = 1;
    close all  
    
elseif compScoreDiagFromLeft == 3;
    winnerResult = msgbox(computerWin)
    winnerResultIndicator = 1;
    close all

    
elseif compScoreDiagFromRight == 3;
    winnerResult = msgbox(computerWin)
    winnerResultIndicator = 1;
    close all
    
else
end
 end

% COMPUTER TURN 4 %
    % TURN 7 %
 
while n == 7
    nx=0;
    ny=0;
while nx == 0
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
    else
        n;
    end
end 
  
% Determining if there is a winner %

 if     winnerResultIndicator ==0 
if userScoreColumn1 == 3;
    winnerResult = msgbox(userWin)
    winnerResultIndicator = 1;
    close all
    
elseif userScoreColumn2 == 3;
    winnerResult = msgbox(userWin)
    winnerResultIndicator = 1;
    close all
     
    elseif userScoreColumn3 == 3;
    winnerResult = msgbox(userWin)
    winnerResultIndicator = 1;
    close all
    
    elseif userScoreRow1 == 3;
    winnerResult = msgbox(userWin)
    winnerResultIndicator = 1;
    close all
    
    elseif userScoreRow2 == 3;
    winnerResult = msgbox(userWin)
    winnerResultIndicator = 1;
    close all
    
    elseif userScoreRow3 == 3;
    winnerResult = msgbox(userWin)  
    winnerResultIndicator = 1;
    close all
    
    elseif userScoreDiagFromLeft == 3;
    winnerResult = msgbox(userWin)
    winnerResultIndicator = 1;
    close all
    
    elseif userScoreDiagFromRight == 3;
    winnerResult = msgbox(userWin)
    winnerResultIndicator = 1;
    close all
    
elseif compScoreColumn1 == 3;
    winnerResult = msgbox(computerWin)
    winnerResultIndicator = 1;
    close all
    
elseif compScoreColumn2 == 3;
    winnerResult = msgbox(computerWin)
    winnerResultIndicator = 1;
    close all
    
elseif compScoreColumn3 == 3;
    winnerResult = msgbox(computerWin)
    winnerResultIndicator = 1;
    close all
 
elseif compScoreRow1 == 3;
    winnerResult = msgbox(computerWin)
    winnerResultIndicator = 1;
    close all
    
elseif compScoreRow2 == 3;
    winnerResult = msgbox(computerWin)
    winnerResultIndicator = 1;
    close all
    
elseif compScoreRow3 == 3;
    winnerResult = msgbox(computerWin)
    winnerResultIndicator = 1;
    close all  
    
elseif compScoreDiagFromLeft == 3;
    winnerResult = msgbox(computerWin)
    winnerResultIndicator = 1;
    close all

    
elseif compScoreDiagFromRight == 3;
    winnerResult = msgbox(computerWin)
    winnerResultIndicator = 1;
    close all
    
else
end
end

% USER TURN 4 %
   % TURN 8 %

while n == 8;
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
        else
        end
        
    elseif userInput1 == 7
        if slot7 == 0
        delete(slotLabel7Text)
        plot(10,10,'r*', 'MarkerSize', 60)
        slot7 = 'Filled';
        n=n+1;
        userScoreColumn3 = userScoreColumn3 +1;
        userScoreRow1 = userScoreRow1 + 1;
        userScoreDiagFromRight = userScoreDiagFromRight+1;
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
        else
        end
    
        end

% Determining if there is a winner %

 if     winnerResultIndicator ==0 
if userScoreColumn1 == 3;
    winnerResult = msgbox(userWin)
    winnerResultIndicator = 1;
    close all
    
elseif userScoreColumn2 == 3;
    winnerResult = msgbox(userWin)
    winnerResultIndicator = 1;
    close all
     
    elseif userScoreColumn3 == 3;
    winnerResult = msgbox(userWin)
    winnerResultIndicator = 1;
    close all
    
    elseif userScoreRow1 == 3;
    winnerResult = msgbox(userWin)
    winnerResultIndicator = 1;
    close all
    
    elseif userScoreRow2 == 3;
    winnerResult = msgbox(userWin)
    winnerResultIndicator = 1;
    close all
    
    elseif userScoreRow3 == 3;
    winnerResult = msgbox(userWin)  
    winnerResultIndicator = 1;
    close all
    
    elseif userScoreDiagFromLeft == 3;
    winnerResult = msgbox(userWin)
    winnerResultIndicator = 1;
    close all
    
    elseif userScoreDiagFromRight == 3;
    winnerResult = msgbox(userWin)
    winnerResultIndicator = 1;
    close all
    
elseif compScoreColumn1 == 3;
    winnerResult = msgbox(computerWin)
    winnerResultIndicator = 1;
    close all
    
elseif compScoreColumn2 == 3;
    winnerResult = msgbox(computerWin)
    winnerResultIndicator = 1;
    close all
    
elseif compScoreColumn3 == 3;
    winnerResult = msgbox(computerWin)
    winnerResultIndicator = 1;
    close all
 
elseif compScoreRow1 == 3;
    winnerResult = msgbox(computerWin)
    winnerResultIndicator = 1;
    close all
    
elseif compScoreRow2 == 3;
    winnerResult = msgbox(computerWin)
    winnerResultIndicator = 1;
    close all
    
elseif compScoreRow3 == 3;
    winnerResult = msgbox(computerWin)
    winnerResultIndicator = 1;
    close all  
    
elseif compScoreDiagFromLeft == 3;
    winnerResult = msgbox(computerWin)
    winnerResultIndicator = 1;
    close all

    
elseif compScoreDiagFromRight == 3;
    winnerResult = msgbox(computerWin)
    winnerResultIndicator = 1;
    close all
    
else
end
 end
    
% COMPUTER TURN 5 %
    % TURN 9 %
 
while n == 9 
    nx=0;
    ny=0;
while nx == 0
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
    else
        n;
    end
end 

end
end
end

% Determining if there is a winner %

 if     winnerResultIndicator ==0 
if userScoreColumn1 == 3;
    winnerResult = msgbox(userWin)
    winnerResultIndicator = 1;
    close all
    
elseif userScoreColumn2 == 3;
    winnerResult = msgbox(userWin)
    winnerResultIndicator = 1;
    close all
     
    elseif userScoreColumn3 == 3;
    winnerResult = msgbox(userWin)
    winnerResultIndicator = 1;
    close all
    
    elseif userScoreRow1 == 3;
    winnerResult = msgbox(userWin)
    winnerResultIndicator = 1;
    close all
    
    elseif userScoreRow2 == 3;
    winnerResult = msgbox(userWin)
    winnerResultIndicator = 1;
    close all
    
    elseif userScoreRow3 == 3;
    winnerResult = msgbox(userWin)  
    winnerResultIndicator = 1;
    close all
    
    elseif userScoreDiagFromLeft == 3;
    winnerResult = msgbox(userWin)
    winnerResultIndicator = 1;
    close all
    
    elseif userScoreDiagFromRight == 3;
    winnerResult = msgbox(userWin)
    winnerResultIndicator = 1;
    close all
    
elseif compScoreColumn1 == 3;
    winnerResult = msgbox(computerWin)
    winnerResultIndicator = 1;
    close all
    
elseif compScoreColumn2 == 3;
    winnerResult = msgbox(computerWin)
    winnerResultIndicator = 1;
    close all
    
elseif compScoreColumn3 == 3;
    winnerResult = msgbox(computerWin)
    winnerResultIndicator = 1;
    close all
 
elseif compScoreRow1 == 3;
    winnerResult = msgbox(computerWin)
    winnerResultIndicator = 1;
    close all
    
elseif compScoreRow2 == 3;
    winnerResult = msgbox(computerWin)
    winnerResultIndicator = 1;
    close all
    
elseif compScoreRow3 == 3;
    winnerResult = msgbox(computerWin)
    winnerResultIndicator = 1;
    close all  
    
elseif compScoreDiagFromLeft == 3;
    winnerResult = msgbox(computerWin)
    winnerResultIndicator = 1;
    close all

    
elseif compScoreDiagFromRight == 3;
    winnerResult = msgbox(computerWin)
    winnerResultIndicator = 1;
    close all
    
else
end
end

 
end
end
end



        


