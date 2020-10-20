%% KINE6203 - Assignment 2
% Tic-Tac-Toe Game
% Written by: Patricia M. Butler
% Date: 10-22-2020

% Description: This code was written to generate a tic-tac-toe game. The
% user will play against a computer with randomly generated moves.

% Developed on Matlab version R2019b, Update 3, with Windows 10 Version

%% Clearing Variables, Command Window, and Closing Figures
% This section clears the command window, workspace, and closes any figures

clc                 % Clears the command window
clear all           % Clears saved variables and values in workspace
close all           % Closes any open figures

replayAnswer = '?'; % Variable that indicates whether a player would like to replay
replayPrompt = 0;   % Variable used to ensure a player will input a valid answer when asked if they would like to replay

%% Asking User if they would like to play
% This section is welcoming the user and inquiring if they would like to
% play a game

% Numerical indicator for identifying if a player wishes to play Tic-Tac-Toe
i = 0;                        % 1 means user wants to play
% 2 means user does not want to play

% While player has not chosen whether they wanted to play or not
while i == 0
    
    promptPlay = 'Welcome, thank you for opening up my code! Would you like to play Tic-Tac-Toe? (Y/N)  '; % Asking user if they want to play
    userInput = upper(input(promptPlay,'s'))                          % User response
    
    if userInput == 'Y'           % If User indicates that they would like to play
        i = 1;
        promptResponse = 'Great! Lets get started!  '          % Response to user wanting to play
        
    elseif userInput == 'N'       % If User indicates that they would not like to play
        i = 2;
        promptResponse = 'Get outta here!'                     % Response to user not wanting to play
        pause(.75)                                             % Brief pause
        quit                      % Closing Application
        
    else                          % If user input an invalid answer
        promptResponse = 'Please reply with Y or N  '          % Reminding user how to properly respond to the prompt
        i = 0;
        pause(1.5)                                             % Pause so reader can read promptResponse
    end
end

pause(1.5)                                                 % Brief Pause
clc                                                        % Clear command window

%% The Game
% This section includes the code to generate the game board, prompting user
% for moves, randomly deciding the computer's moves, determining the winner,
% prompting the user if they would like to replay, and restarting the game.


while replayAnswer ~= 'N'       % While user has not said they would not like to replay
    
    clear all                   % Clear all saved variables and values in Workspace
    close all                   % Close any open figures
    clc                         % Clear command window
    
    % !!!!!!!!!!!!!!!!!!!!! %
    % Generating Game Board %
    % !!!!!!!!!!!!!!!!!!!!! %
    
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
    spotLabel1 = '1';
    spotLabel2 = '2';
    spotLabel3 = '3';
    spotLabel4 = '4';
    spotLabel5 = '5';
    spotLabel6 = '6';
    spotLabel7 = '7';
    spotLabel8 = '8';
    spotLabel9 = '9';
    
    % Adding text labels to each spot on the Tic-Tac-Toe board %
    spotLabel1Text = text(1.5,10,spotLabel1,'FontSize', 60, 'Color', 'r');
    spotLabel2Text = text(1.5,6,spotLabel2,'FontSize', 60, 'Color', 'r');
    spotLabel3Text = text(1.5,2,spotLabel3,'FontSize', 60, 'Color', 'r');
    spotLabel4Text = text(5.5,10,spotLabel4,'FontSize', 60, 'Color', 'r');
    spotLabel5Text = text(5.5,6,spotLabel5,'FontSize', 60, 'Color', 'r');
    spotLabel6Text = text(5.5,2,spotLabel6,'FontSize', 60, 'Color', 'r');
    spotLabel7Text = text(9.5,10,spotLabel7,'FontSize', 60, 'Color', 'r');
    spotLabel8Text = text(9.5,6,spotLabel8,'FontSize', 60, 'Color', 'r');
    spotLabel9Text = text(9.5,2,spotLabel9,'FontSize', 60, 'Color', 'r');
    
    % Varibales to indicate whether a spot on the board has been filled %
    spot1 = 0;
    spot2 = 0;
    spot3 = 0;
    spot4 = 0;
    spot5 = 0;
    spot6 = 0;
    spot7 = 0;
    spot8 = 0;
    spot9 = 0;
    
    % Variables for establishing user score %
    userRow1 = [0 0 0];
    userRow2 = [0 0 0];
    userRow3 = [0 0 0];
    userColumn1 = [0 0 0]';
    userColumn2 = [0 0 0]';
    userColumn3 = [0 0 0]';
    userDiagFromLeft = [0 0 0];
    userDiagFromRight = [0 0 0];
    
    % Variables for establishing the computer's score %
    compRow1 = [0 0 0];
    compRow2 = [0 0 0];
    compRow3 = [0 0 0];
    compColumn1 = [0 0 0]';
    compColumn2 = [0 0 0]';
    compColumn3 = [0 0 0]';
    compDiagFromLeft = [compRow1(1) compRow2(2) compRow3(3)];
    compDiagFromRight = [compRow1(3) compRow2(2) compRow3(1)];
    
    % Variables for maintaining the game %
    turn = 1;           % Variable indicating what turn it is
    userWins = '?';     % Variable indicating whether the user has won, lost, or tied with the computer
    replayAnswer = '?'; % Variable that indicates whether a player would like to replay
    replayPrompt = 0;   % Variable used to ensure a player will input a valid answer when asked if they would like to replay
    
    while userWins == '?'   % While the user has not won, lost, or tied
        for n = (turn:9)    % Limiting the game to 9 rounds
            
            while turn == 1 % While it is the first turn
                userInput = input('What spot do you want to pick? (ex: 1,2,3, ... )  '); % Asking user where they would like to place an X
                
                if userWins == '?'                              % If the user has not won, lost, or tied
                    if userInput == 1                           % If user inputs 1
                        if spot1 == 0                           % If spot 1 is empty
                            delete(spotLabel1Text)              % Delete the label "1" on board
                            plot(2,10,'rX', 'MarkerSize', 60)   % Plot X at 1
                            spot1 = 1;                          % Spot 1 is now full
                            userRow1(1) = 1;                     % User has marked the first spot in Row 1
                            userColumn1(1) = 1;                 % User has marked the first spot in Column 1
                            userDiagFromLeft(1) = 1;            % User has marked the first spot in Left Diagonal
                            turn = turn + 1;                    % It is the next turn
                        else
                            disp('Please input a number that has not been taken (format ex: 1,2,3, ...)   '); % Telling user to input number that has not been taken
                        end
                        
                        
                    elseif userInput == 2                       % If user inputs 2
                        if spot2 == 0                           % If spot 2 is empty
                            delete(spotLabel2Text)              % Delete the label "2" on board
                            plot(2,6,'rX', 'MarkerSize', 60)    % Plot X at 2
                            spot2 = 1;                          % Spot 2 is now full
                            userRow2(1) = 1;                     % User has marked the first spot in Row 2
                            userColumn1(2) = 1;                 % User has marked the second spot in Column 1
                            turn = turn + 1;                    % It is the next turn
                        else
                            disp('Please input a number that has not been taken (format ex: 1,2,3, ...)   '); % Telling user to input number that has not been taken
                        end
                        
                    elseif userInput == 3                       % If user inputs 3
                        if spot3 == 0                           % If spot 3 is empty
                            delete(spotLabel3Text)              % Delete the label "3" on board
                            plot(2,2,'rX', 'MarkerSize', 60)    % Plot X at 3
                            spot3 = 1;                          % Spot 3 is now full
                            userRow3(1) = 1;                    % User has marked the first spot in Row 3
                            userColumn1(3) = 1;                 % User has marked the third spot in Column 1
                            userDiagFromRight(1) = 1;           % User has marked the first spot in the Right Diagonal
                            turn = turn + 1;                    % It is the next turn
                        else
                            disp('Please input a number that has not been taken (format ex: 1,2,3, ...)   '); % Telling user to input number that has not been taken
                        end
                        
                    elseif userInput == 4                       % If user inputs 4
                        if spot4 == 0                           % If spot 4 is empty
                            delete(spotLabel4Text)              % Delete the label "4" on board
                            plot(6,10,'rX', 'MarkerSize', 60)   % Plot X at 4
                            spot4 = 1;                          % Spot 4 is now full
                            userRow1(2) = 1;                     % User has marked the second spot in Row 1
                            userColumn2(1) = 1;                 % User has marked the first spot in Column 1
                            turn = turn + 1;                    % It is the next turn
                        else
                            disp('Please input a number that has not been taken (format ex: 1,2,3, ...)   '); % Telling user to input number that has not been taken
                        end
                        
                    elseif userInput == 5                       % If user inputs 5
                        if spot5 == 0                           % If spot 5 is empty
                            delete(spotLabel5Text)              % Delete the label "5" on board
                            plot(6,6,'rX', 'MarkerSize', 60)    % Plot X at 5
                            spot5 = 1;                          % Spot 5 is now full
                            userRow2(2) = 1                     % User has marked the second spot in Row 2
                            userColumn2(2) = 1;                 % User has marked the second spot in Column 2
                            userDiagFromLeft(2) = 1;            % User has marked the second spot in the Left Diagonal
                            userDiagFromRight(2) = 1;           % User has marked the second spot in the Right Diagonal
                            turn = turn + 1;                    % It is the next turn
                        else
                            disp('Please input a number that has not been taken (format ex: 1,2,3, ...)   '); % Telling user to input number that has not been taken
                        end
                        
                    elseif userInput == 6                       % If user inputs 6
                        if spot6 == 0                           % If spot 6 is empty
                            delete(spotLabel6Text)              % Delete the label "6" on board
                            plot(6,2,'rX', 'MarkerSize', 60)    % Plot X at 6
                            spot6 = 1;                          % Spot 6 is now full
                            userRow3(2) = 1;                    % User has marked the second spot in Row 3
                            userColumn2(3) = 1;                 % User has marked the third spot in Column 2
                            turn = turn + 1;                    % It is the next turn
                        else
                            disp('Please input a number that has not been taken (format ex: 1,2,3, ...)   '); % Telling user to input number that has not been taken
                        end
                        
                    elseif userInput == 7                       % If user inputs 7
                        if spot7 == 0                           % If spot 7 is empty
                            delete(spotLabel7Text)              % Delete the label "7" on board
                            plot(10,10,'rX', 'MarkerSize', 60)  % Plot X at 7
                            spot7 = 1;                          % Spot 7 is now full
                            userRow1(3) = 1;                    % User has marked the thrid spot in Row 3
                            userColumn3(1) = 1;                 % User has marked the first spot in Column 3
                            userDiagFromRight(3) = 1;           % User has marked the third spot in the Right Diagonal
                            turn = turn + 1;                    % It is the next turn
                        else
                            disp('Please input a number that has not been taken (format ex: 1,2,3, ...)   '); % Telling user to input number that has not been taken
                        end
                        
                    elseif userInput == 8                       % If user inputs 8
                        if spot8 == 0                           % If spot 8 is empty
                            delete(spotLabel8Text)              % Delete the label "8" on board
                            plot(10,6,'rX', 'MarkerSize', 60)   % Plot X at 8
                            spot8 = 1;                          % Spot 8 is now full
                            userRow2(3) = 1;                     % User has marked the third spot in Row 2
                            userColumn3(2) = 1;                 % User has marked the second spot in Column 3
                            turn = turn + 1;                    % It is the next turn
                        else
                            disp('Please input a number that has not been taken (format ex: 1,2,3, ...)   '); % Telling user to input number that has not been taken
                        end
                        
                    elseif userInput == 9                       % If user inputs 9
                        if spot9 == 0                           % If spot 9 is empty
                            delete(spotLabel9Text)              % Delete the label "9" on board
                            plot(10,2,'rX', 'MarkerSize', 60)   % Plot X at 9
                            spot9 = 1;                          % Spot 9 is now full
                            userRow3(3) = 1;                    % User has marked the third spot in Row 3
                            userColumn3(3) = 1;                 % User has marked the thrid spot in Column 3
                            userDiagFromLeft(3) = 1;            % User has marked the third spot in the Right Diagonal
                            turn = turn + 1;                    % It is the next turn
                        else
                            disp('Please input a number that has not been taken (format ex: 1,2,3, ...)   '); % Telling user to input number that has not been taken
                        end
                        
                    else userInput = input('Please input a number (ex: 1,2,3, ...)   '); % Reminidng user to input valid number
                    end
                else
                    break                                       % If someone has won, exit loop
                end
                
            end
            
            
            while turn == 2     % While it is the second turn
                if userWins == '?'                          % If user has not won, lost, or tied
                    
                    compInput = randi([1,9],1);              % Computer randomly chosing a spot to mark
                    
                    if compInput == 1 && spot1 == 0        % If computer inputs 1 and spot 1 is empty
                        delete(spotLabel1Text)              % Delete label "1" from board
                        plot(2,10,'bo', 'MarkerSize', 60)   % Plot O at 1
                        spot1 = 1;                          % Spot 1 is now full
                        compRow1(1) = 1;                    % Computer has marked the first spot in Row 1
                        compColumn1(1) = 1;                 % Computer has marked the first spot in Column 1
                        compDiagFromLeft(1) = 1;            % Computer has marked the first spot in the Left Diagonal
                        turn = turn + 1;                    % It is now the next turn
                        
                        
                    elseif compInput == 2 && spot2 == 0     % If computer inputs 2 and spot 2 is empty
                        delete(spotLabel2Text)              % Delete label "2" from board
                        plot(2,6,'bo', 'MarkerSize', 60)    % Plot O at 2
                        spot2 = 1;                          % Spot 2 is now full
                        compRow2(1) = 1;                    % Computer has marked the first spot in Row 2
                        compColumn1(2) = 1;                 % Computer has marked the second spot in Column 2
                        turn = turn + 1;                    % It is now the next turn
                        
                    elseif compInput == 3 && spot3 == 0     % If computer inputs 3 and spot 3 is empty
                        delete(spotLabel3Text)              % Delete label "3" from board
                        plot(2,2,'bo', 'MarkerSize', 60)    % Plot O at 3
                        spot3 = 1;                          % Spot 3 is now full
                        compRow3(1) = 1;                    % Computer has marked the first spot in Row 3
                        compColumn1(3) = 1;                 % Computer has marked the third spot in Column 3
                        compDiagFromRight(1) = 1;           % Computer has marked the first spot in the Right Diagonal
                        turn = turn + 1;                    % It is now the next turn
                        
                    elseif compInput == 4 && spot4 ==0      % If the computer inputs 4 and spot 4 is empty
                        delete(spotLabel4Text)              % Delete label "4" from board
                        plot(6,10,'bo', 'MarkerSize', 60)   % Plot O at 4
                        spot4 = 1;                          % Spot 4 is now full
                        compRow1(2) = 1;                    % Computer has marked the second spot in Row 1
                        compColumn2(1) = 1;                 % Computer has marked the first spot in Column 1
                        turn = turn + 1;                    % It is now the next turn
                        
                    elseif compInput == 5 && spot5 == 0     % If the computer inputs 5 and spot 5 is empty
                        delete(spotLabel5Text)              % Delete label "5" from board
                        plot(6,6,'bo', 'MarkerSize', 60)    % Plot O at 5
                        spot5 = 1;                          % Spot 5 is now full
                        compRow2(2) = 1;                    % Computer has marked the second spot in Row 2
                        compColumn2(2) = 1;                 % Computer has marked the second spot in Column 2
                        compDiagFromLeft(2) = 1;            % Computer has marked the second spot in the Left Diagonal
                        compDiagFromRight(2) = 1;           % Computer has marked the second spot in the Right Diagonal
                        turn = turn + 1;                    % It is now the next turn
                        
                    elseif compInput == 6 && spot6 == 0     % If the computer inputs 6 and spot 6 is empty
                        delete(spotLabel6Text)              % Delete label "6" from board
                        plot(6,2,'bo', 'MarkerSize', 60)    % Plot O at 6
                        spot6 = 1;                          % Spot 6 is now full
                        compRow3(2) = 1;                    % Computer has marked the second spot in Row 3
                        compColumn2(3) = 1;                 % Computer has marked the third spot in Column 2
                        turn = turn + 1;                    % It is now the next turn
                        
                    elseif compInput == 7 && spot7 == 0     % If the computer inputs 7 and spot 7 is empty
                        delete(spotLabel7Text)              % Delete label "7" from board
                        plot(10,10,'bo', 'MarkerSize', 60)  % Plot O at 7
                        spot7 = 1;                          % Spot 7 is now full
                        compRow1(3) = 1;                    % Computer has marked the third spot in Row 1
                        compColumn3(1) = 1;                 % Computer has marked the first spot in Column 3
                        compDiagFromRight(3) = 1;           % Computer has marked the third spot in the Right Diagonal
                        turn = turn + 1;                    % It is now the next turn
                        
                    elseif compInput == 8 && spot8 == 0     % If the computer inputs 8 and spot 8 is empty
                        delete(spotLabel8Text)              % Delete label "8" from board
                        plot(10,6,'bo', 'MarkerSize', 60)   % Plot O at 8
                        spot8 = 1;                          % Spot 8 is now full
                        compRow2(3) = 1;                    % Computer has marked the third spot in Row 2
                        compColumn3(2) = 1;                 % Computer has marked the second spot in Column 3
                        turn = turn + 1;                    % It is now the next turn
                        
                    elseif compInput == 9 && spot9 == 0     % If the computer inputs 9 and spot 9 is empty
                        delete(spotLabel9Text)              % Delete label "9" from board
                        plot(10,2,'bo', 'MarkerSize', 60)   % Plot O at 9
                        spot9 = 1;                          % Spot 9 is now full
                        compRow3(3) = 1;                    % Computer has marked the third spot in Row 3
                        compColumn3(3) = 1;                 % Computer has marked the third spot in Column 3
                        compDiagFromLeft(3) = 1;            % Computer has marked the third spot in the Left Diagonal
                        turn = turn + 1;                    % It is now the next turn
                        
                    else
                    end
                else
                    break                                   % If someone has won, exit loop
                end
            end
            
            while turn == 3     % While it is the third turn
                if userWins == '?'      % If user has not won, lost, or tied
                    userInput = input('What spot do you want to pick? (ex: 1,2,3, ... )  '); % Asking user where to place X
                    
                    
                    if userInput == 1                           % If user inputs 1
                        if spot1 == 0                           % If spot 1 is empty
                            delete(spotLabel1Text)              % Delete the label "1" on board
                            plot(2,10,'rX', 'MarkerSize', 60)   % Plot X at 1
                            spot1 = 1;                          % Spot 1 is now full
                            userRow1(1) = 1;                     % User has marked the first spot in Row 1
                            userColumn1(1) = 1;                 % User has marked the first spot in Column 1
                            userDiagFromLeft(1) = 1;            % User has marked the first spot in Left Diagonal
                            turn = turn + 1;                    % It is the next turn
                        else
                            disp('Please input a number that has not been taken (format ex: 1,2,3, ...)   '); % Telling user to input number that has not been taken
                        end
                        
                        
                    elseif userInput == 2                       % If user inputs 2
                        if spot2 == 0                           % If spot 2 is empty
                            delete(spotLabel2Text)              % Delete the label "2" on board
                            plot(2,6,'rX', 'MarkerSize', 60)    % Plot X at 2
                            spot2 = 1;                          % Spot 2 is now full
                            userRow2(1) = 1;                     % User has marked the first spot in Row 2
                            userColumn1(2) = 1;                 % User has marked the second spot in Column 1
                            turn = turn + 1;                    % It is the next turn
                        else
                            disp('Please input a number that has not been taken (format ex: 1,2,3, ...)   '); % Telling user to input number that has not been taken
                        end
                        
                    elseif userInput == 3                       % If user inputs 3
                        if spot3 == 0                           % If spot 3 is empty
                            delete(spotLabel3Text)              % Delete the label "3" on board
                            plot(2,2,'rX', 'MarkerSize', 60)    % Plot X at 3
                            spot3 = 1;                          % Spot 3 is now full
                            userRow3(1) = 1;                    % User has marked the first spot in Row 3
                            userColumn1(3) = 1;                 % User has marked the third spot in Column 1
                            userDiagFromRight(1) = 1;           % User has marked the first spot in the Right Diagonal
                            turn = turn + 1;                    % It is the next turn
                        else
                            disp('Please input a number that has not been taken (format ex: 1,2,3, ...)   '); % Telling user to input number that has not been taken
                        end
                        
                    elseif userInput == 4                       % If user inputs 4
                        if spot4 == 0                           % If spot 4 is empty
                            delete(spotLabel4Text)              % Delete the label "4" on board
                            plot(6,10,'rX', 'MarkerSize', 60)   % Plot X at 4
                            spot4 = 1;                          % Spot 4 is now full
                            userRow1(2) = 1;                     % User has marked the second spot in Row 1
                            userColumn2(1) = 1;                 % User has marked the first spot in Column 1
                            turn = turn + 1;                    % It is the next turn
                        else
                            disp('Please input a number that has not been taken (format ex: 1,2,3, ...)   '); % Telling user to input number that has not been taken
                        end
                        
                    elseif userInput == 5                       % If user inputs 5
                        if spot5 == 0                           % If spot 5 is empty
                            delete(spotLabel5Text)              % Delete the label "5" on board
                            plot(6,6,'rX', 'MarkerSize', 60)    % Plot X at 5
                            spot5 = 1;                          % Spot 5 is now full
                            userRow2(2) = 1;                    % User has marked the second spot in Row 2
                            userColumn2(2) = 1;                 % User has marked the second spot in Column 2
                            userDiagFromLeft(2) = 1;            % User has marked the second spot in the Left Diagonal
                            userDiagFromRight(2) = 1;           % User has marked the second spot in the Right Diagonal
                            turn = turn + 1;                    % It is the next turn
                        else
                            disp('Please input a number that has not been taken (format ex: 1,2,3, ...)   '); % Telling user to input number that has not been taken
                        end
                        
                    elseif userInput == 6                       % If user inputs 6
                        if spot6 == 0                           % If spot 6 is empty
                            delete(spotLabel6Text)              % Delete the label "6" on board
                            plot(6,2,'rX', 'MarkerSize', 60)    % Plot X at 6
                            spot6 = 1;                          % Spot 6 is now full
                            userRow3(2) = 1;                    % User has marked the second spot in Row 3
                            userColumn2(3) = 1;                 % User has marked the third spot in Column 2
                            turn = turn + 1;                    % It is the next turn
                        else
                            disp('Please input a number that has not been taken (format ex: 1,2,3, ...)   '); % Telling user to input number that has not been taken
                        end
                        
                    elseif userInput == 7                       % If user inputs 7
                        if spot7 == 0                           % If spot 7 is empty
                            delete(spotLabel7Text)              % Delete the label "7" on board
                            plot(10,10,'rX', 'MarkerSize', 60)  % Plot X at 7
                            spot7 = 1;                          % Spot 7 is now full
                            userRow1(3) = 1;                     % User has marked the thrid spot in Row 3
                            userColumn3(1) = 1;                 % User has marked the first spot in Column 3
                            userDiagFromRight(3) = 1;           % User has marked the third spot in the Right Diagonal
                            turn = turn + 1;                    % It is the next turn
                        else
                            disp('Please input a number that has not been taken (format ex: 1,2,3, ...)   '); % Telling user to input number that has not been taken
                        end
                        
                    elseif userInput == 8                       % If user inputs 8
                        if spot8 == 0                           % If spot 8 is empty
                            delete(spotLabel8Text)              % Delete the label "8" on board
                            plot(10,6,'rX', 'MarkerSize', 60)   % Plot X at 8
                            spot8 = 1;                          % Spot 8 is now full
                            userRow2(3) = 1;                     % User has marked the third spot in Row 2
                            userColumn3(2) = 1;                 % User has marked the second spot in Column 3
                            turn = turn + 1;                    % It is the next turn
                        else
                            disp('Please input a number that has not been taken (format ex: 1,2,3, ...)   '); % Telling user to input number that has not been taken
                        end
                        
                    elseif userInput == 9                       % If user inputs 9
                        if spot9 == 0                           % If spot 9 is empty
                            delete(spotLabel9Text)              % Delete the label "9" on board
                            plot(10,2,'rX', 'MarkerSize', 60)   % Plot X at 9
                            spot9 = 1;                          % Spot 9 is now full
                            userRow3(3) = 1;                    % User has marked the third spot in Row 3
                            userColumn3(3) = 1;                 % User has marked the thrid spot in Column 3
                            userDiagFromLeft(3) = 1;            % User has marked the third spot in the Right Diagonal
                            turn = turn + 1;                    % It is the next turn
                        else
                            disp('Please input a number that has not been taken (format ex: 1,2,3, ...)   '); % Telling user to input number that has not been taken
                        end
                        
                    else userInput = input('Please input a number (ex: 1,2,3, ...)   '); % Reminding user to input valid number
                    end
                else
                    break   % If someone has won, exit loop
                end
                
            end
            
            while turn == 4 % While it is the fourth turn
                if userWins == '?'  % If the user has not won, lost, or tied
                    
                    compInput = randi([1,9],1);      % Computer randomly choosing a spot to mark
                    
                    if compInput == 1 && spot1 == 0         % If computer inputs 1 and spot 1 is empty
                        delete(spotLabel1Text)              % Delete label "1" from board
                        plot(2,10,'bo', 'MarkerSize', 60)   % Plot O at 1
                        spot1 = 1;                          % Spot 1 is now full
                        compRow1(1) = 1;                    % Computer has marked the first spot in Row 1
                        compColumn1(1) = 1;                 % Computer has marked the first spot in Column 1
                        compDiagFromLeft(1) = 1;            % Computer has marked the first spot in the Left Diagonal
                        turn = turn + 1;                    % It is now the next turn
                        
                        
                    elseif compInput == 2 && spot2 == 0     % If computer inputs 2 and spot 2 is empty
                        delete(spotLabel2Text)              % Delete label "2" from board
                        plot(2,6,'bo', 'MarkerSize', 60)    % Plot O at 2
                        spot2 = 1;                          % Spot 2 is now full
                        compRow2(1) = 1;                    % Computer has marked the first spot in Row 2
                        compColumn1(2) = 1;                 % Computer has marked the second spot in Column 2
                        turn = turn + 1;                    % It is now the next turn
                        
                        
                    elseif compInput == 3 && spot3 == 0     % If computer inputs 3 and spot 3 is empty
                        delete(spotLabel3Text)              % Delete label "3" from board
                        plot(2,2,'bo', 'MarkerSize', 60)    % Plot O at 3
                        spot3 = 1;                          % Spot 3 is now full
                        compRow3(1) = 1;                    % Computer has marked the first spot in Row 3
                        compColumn1(3) = 1;                 % Computer has marked the third spot in Column 3
                        compDiagFromRight(1) = 1;           % Computer has marked the first spot in the Right Diagonal
                        turn = turn + 1;                    % It is now the next turn
                        
                        
                    elseif compInput == 4 && spot4 ==0      % If the computer inputs 4 and spot 4 is empty
                        delete(spotLabel4Text)              % Delete label "4" from board
                        plot(6,10,'bo', 'MarkerSize', 60)   % Plot O at 4
                        spot4 = 1;                          % Spot 4 is now full
                        compRow1(2) = 1;                    % Computer has marked the second spot in Row 1
                        compColumn2(1) = 1;                 % Computer has marked the first spot in Column 1
                        turn = turn + 1;                    % It is now the next turn
                        
                    elseif compInput == 5 && spot5 == 0     % If the computer inputs 5 and spot 5 is empty
                        delete(spotLabel5Text)              % Delete label "5" from board
                        plot(6,6,'bo', 'MarkerSize', 60)    % Plot O at 5
                        spot5 = 1;                          % Spot 5 is now full
                        compRow2(2) = 1;                    % Computer has marked the second spot in Row 2
                        compColumn2(2) = 1;                 % Computer has marked the second spot in Column 2
                        compDiagFromLeft(2) = 1;            % Computer has marked the second spot in the Left Diagonal
                        compDiagFromRight(2) = 1;           % Computer has marked the second spot in the Right Diagonal
                        turn = turn + 1;                    % It is now the next turn
                        
                    elseif compInput == 6 && spot6 == 0     % If the computer inputs 6 and spot 6 is empty
                        delete(spotLabel6Text)              % Delete label "6" from board
                        plot(6,2,'bo', 'MarkerSize', 60)    % Plot O at 6
                        spot6 = 1;                          % Spot 6 is now full
                        compRow3(2) = 1;                    % Computer has marked the second spot in Row 3
                        compColumn2(3) = 1;                 % Computer has marked the third spot in Column 2
                        turn = turn + 1;                    % It is now the next turn
                        
                    elseif compInput == 7 && spot7 == 0     % If the computer inputs 7 and spot 7 is empty
                        delete(spotLabel7Text)              % Delete label "7" from board
                        plot(10,10,'bo', 'MarkerSize', 60)  % Plot O at 7
                        spot7 = 1;                          % Spot 7 is now full
                        compRow1(3) = 1;                    % Computer has marked the third spot in Row 1
                        compColumn3(1) = 1;                 % Computer has marked the first spot in Column 3
                        compDiagFromRight(3) = 1;           % Computer has marked the third spot in the Right Diagonal
                        turn = turn + 1;                    % It is now the next turn
                        
                    elseif compInput == 8 && spot8 == 0     % If the computer inputs 8 and spot 8 is empty
                        delete(spotLabel8Text)              % Delete label "8" from board
                        plot(10,6,'bo', 'MarkerSize', 60)   % Plot O at 8
                        spot8 = 1;                          % Spot 8 is now full
                        compRow2(3) = 1;                    % Computer has marked the third spot in Row 2
                        compColumn3(2) = 1;                 % Computer has marked the second spot in Column 3
                        turn = turn + 1;                    % It is now the next turn
                        
                    elseif compInput == 9 && spot9 == 0     % If the computer inputs 9 and spot 9 is empty
                        delete(spotLabel9Text)              % Delete label "9" from board
                        plot(10,2,'bo', 'MarkerSize', 60)   % Plot O at 9
                        spot9 = 1;                          % Spot 9 is now full
                        compRow3(3) = 1;                    % Computer has marked the third spot in Row 3
                        compColumn3(3) = 1;                 % Computer has marked the third spot in Column 3
                        compDiagFromLeft(3) = 1;            % Computer has marked the third spot in the Left Diagonal
                        turn = turn + 1;                    % It is now the next turn
                        
                    else
                    end
                else
                    break           % If someone has won, end loop
                end
            end
            
            while turn == 5     %   While it is the fifth turn
                if userWins == '?'      % If user ahs not won, lost, or ties
                    userInput = input('What spot do you want to pick? (ex: 1,2,3, ... )   ');  % Asking user to input a number
                    
                    
                    if userInput == 1                           % If user inputs 1
                        if spot1 == 0                           % If spot 1 is empty
                            delete(spotLabel1Text)              % Delete the label "1" on board
                            plot(2,10,'rX', 'MarkerSize', 60)   % Plot X at 1
                            spot1 = 1;                          % Spot 1 is now full
                            userRow1(1) = 1;                     % User has marked the first spot in Row 1
                            userColumn1(1) = 1;                 % User has marked the first spot in Column 1
                            userDiagFromLeft(1) = 1;            % User has marked the first spot in Left Diagonal
                            turn = turn + 1;                    % It is the next turn
                        else
                            disp('Please input a number that has not been taken (format ex: 1,2,3, ...)   '); % Telling user to input number that has not been taken
                        end
                        
                        
                    elseif userInput == 2                       % If user inputs 2
                        if spot2 == 0                           % If spot 2 is empty
                            delete(spotLabel2Text)              % Delete the label "2" on board
                            plot(2,6,'rX', 'MarkerSize', 60)    % Plot X at 2
                            spot2 = 1;                          % Spot 2 is now full
                            userRow2(1) = 1;                     % User has marked the first spot in Row 2
                            userColumn1(2) = 1;                 % User has marked the second spot in Column 1
                            turn = turn + 1;                    % It is the next turn
                        else
                            disp('Please input a number that has not been taken (format ex: 1,2,3, ...)   '); % Telling user to input number that has not been taken
                        end
                        
                    elseif userInput == 3                       % If user inputs 3
                        if spot3 == 0                           % If spot 3 is empty
                            delete(spotLabel3Text)              % Delete the label "3" on board
                            plot(2,2,'rX', 'MarkerSize', 60)    % Plot X at 3
                            spot3 = 1;                          % Spot 3 is now full
                            userRow3(1) = 1;                    % User has marked the first spot in Row 3
                            userColumn1(3) = 1;                 % User has marked the third spot in Column 1
                            userDiagFromRight(1) = 1;           % User has marked the first spot in the Right Diagonal
                            turn = turn + 1;                    % It is the next turn
                        else
                            disp('Please input a number that has not been taken (format ex: 1,2,3, ...)   '); % Telling user to input number that has not been taken
                        end
                        
                    elseif userInput == 4                       % If user inputs 4
                        if spot4 == 0                           % If spot 4 is empty
                            delete(spotLabel4Text)              % Delete the label "4" on board
                            plot(6,10,'rX', 'MarkerSize', 60)   % Plot X at 4
                            spot4 = 1;                          % Spot 4 is now full
                            userRow1(2) = 1;                     % User has marked the second spot in Row 1
                            userColumn2(1) = 1;                 % User has marked the first spot in Column 1
                            turn = turn + 1;                    % It is the next turn
                        else
                            disp('Please input a number that has not been taken (format ex: 1,2,3, ...)   '); % Telling user to input number that has not been taken
                        end
                        
                    elseif userInput == 5                       % If user inputs 5
                        if spot5 == 0                           % If spot 5 is empty
                            delete(spotLabel5Text)              % Delete the label "5" on board
                            plot(6,6,'rX', 'MarkerSize', 60)    % Plot X at 5
                            spot5 = 1;                          % Spot 5 is now full
                            userRow2(2) = 1;                     % User has marked the second spot in Row 2
                            userColumn2(2) = 1;                 % User has marked the second spot in Column 2
                            userDiagFromLeft(2) = 1;            % User has marked the second spot in the Left Diagonal
                            userDiagFromRight(2) = 1;           % User has marked the second spot in the Right Diagonal
                            turn = turn + 1;                    % It is the next turn
                        else
                            disp('Please input a number that has not been taken (format ex: 1,2,3, ...)   '); % Telling user to input number that has not been taken
                        end
                        
                    elseif userInput == 6                       % If user inputs 6
                        if spot6 == 0                           % If spot 6 is empty
                            delete(spotLabel6Text)              % Delete the label "6" on board
                            plot(6,2,'rX', 'MarkerSize', 60)    % Plot X at 6
                            spot6 = 1;                          % Spot 6 is now full
                            userRow3(2) = 1;                    % User has marked the second spot in Row 3
                            userColumn2(3) = 1;                 % User has marked the third spot in Column 2
                            turn = turn + 1;                    % It is the next turn
                        else
                            disp('Please input a number that has not been taken (format ex: 1,2,3, ...)   '); % Telling user to input number that has not been taken
                        end
                        
                    elseif userInput == 7                       % If user inputs 7
                        if spot7 == 0                           % If spot 7 is empty
                            delete(spotLabel7Text)              % Delete the label "7" on board
                            plot(10,10,'rX', 'MarkerSize', 60)  % Plot X at 7
                            spot7 = 1;                          % Spot 7 is now full
                            userRow1(3) = 1;                     % User has marked the thrid spot in Row 3
                            userColumn3(1) = 1;                 % User has marked the first spot in Column 3
                            userDiagFromRight(3) = 1;           % User has marked the third spot in the Right Diagonal
                            turn = turn + 1;                    % It is the next turn
                        else
                            disp('Please input a number that has not been taken (format ex: 1,2,3, ...)   '); % Telling user to input number that has not been taken
                        end
                        
                    elseif userInput == 8                       % If user inputs 8
                        if spot8 == 0                           % If spot 8 is empty
                            delete(spotLabel8Text)              % Delete the label "8" on board
                            plot(10,6,'rX', 'MarkerSize', 60)   % Plot X at 8
                            spot8 = 1;                          % Spot 8 is now full
                            userRow2(3) = 1;                     % User has marked the third spot in Row 2
                            userColumn3(2) = 1;                 % User has marked the second spot in Column 3
                            turn = turn + 1;                    % It is the next turn
                        else
                            disp('Please input a number that has not been taken (format ex: 1,2,3, ...)   '); % Telling user to input number that has not been taken
                        end
                        
                    elseif userInput == 9                       % If user inputs 9
                        if spot9 == 0                           % If spot 9 is empty
                            delete(spotLabel9Text)              % Delete the label "9" on board
                            plot(10,2,'rX', 'MarkerSize', 60)   % Plot X at 9
                            spot9 = 1;                          % Spot 9 is now full
                            userRow3(3) = 1;                    % User has marked the third spot in Row 3
                            userColumn3(3) = 1;                 % User has marked the thrid spot in Column 3
                            userDiagFromLeft(3) = 1;            % User has marked the third spot in the Right Diagonal
                            turn = turn + 1;                    % It is the next turn
                        else
                            disp('Please input a number that has not been taken (format ex: 1,2,3, ...)   '); % Telling user to input number that has not been taken
                        end
                        
                    else userInput = input('Please input a number (ex: 1,2,3, ...)   '); % Reminding user to input a valid number
                    end
                else
                    break           % If someone has won, end loop
                end
                
            end
            
            while turn == 6;    % While it is the sixth turn
                
                if userWins == '?'      % If the user has not won, lost, or tied
                    % Looking to see if the user has won %
                    if userRow1 == [1 1 1];
                        break
                    elseif userRow2 == [1 1 1];
                        break
                    elseif userRow3 == [1 1 1];
                        break
                    elseif userColumn1 == [1 1 1]'
                        break
                    elseif userColumn2 == [1 1 1]'
                        break
                    elseif userColumn3 == [1 1 1]'
                        break
                    elseif userDiagFromLeft == [1 1 1]
                        break
                    elseif userDiagFromRight == [1 1 1]
                        break
                    else
                        
                    end
                end
                
                
                if userWins == '?' % If the user has not won, lost, or tied
                    
                    compInput = randi([1,9],1);  % Computer randomly selecting a place to mark
                    
                    if compInput == 1 && spot1 == 0         % If computer inputs 1 and spot 1 is empty
                        delete(spotLabel1Text)              % Delete label "1" from board
                        plot(2,10,'bo', 'MarkerSize', 60)   % Plot O at 1
                        spot1 = 1;                          % Spot 1 is now full
                        compRow1(1) = 1;                    % Computer has marked the first spot in Row 1
                        compColumn1(1) = 1;                 % Computer has marked the first spot in Column 1
                        compDiagFromLeft(1) = 1;            % Computer has marked the first spot in the Left Diagonal
                        turn = turn + 1;                    % It is now the next turn
                        
                    elseif compInput == 2 && spot2 == 0     % If computer inputs 2 and spot 2 is empty
                        delete(spotLabel2Text)              % Delete label "2" from board
                        plot(2,6,'bo', 'MarkerSize', 60)    % Plot O at 2
                        spot2 = 1;                          % Spot 2 is now full
                        compRow2(1) = 1;                    % Computer has marked the first spot in Row 2
                        compColumn1(2) = 1;                 % Computer has marked the second spot in Column 2
                        turn = turn + 1;                    % It is now the next turn
                        
                    elseif compInput == 3 && spot3 == 0     % If computer inputs 3 and spot 3 is empty
                        delete(spotLabel3Text)              % Delete label "3" from board
                        plot(2,2,'bo', 'MarkerSize', 60)    % Plot O at 3
                        spot3 = 1;                          % Spot 3 is now full
                        compRow3(1) = 1;                    % Computer has marked the first spot in Row 3
                        compColumn1(3) = 1;                 % Computer has marked the third spot in Column 3
                        compDiagFromRight(1) = 1;           % Computer has marked the first spot in the Right Diagonal
                        turn = turn + 1;                    % It is now the next turn
                        
                    elseif compInput == 4 && spot4 ==0      % If the computer inputs 4 and spot 4 is empty
                        delete(spotLabel4Text)              % Delete label "4" from board
                        plot(6,10,'bo', 'MarkerSize', 60)   % Plot O at 4
                        spot4 = 1;                          % Spot 4 is now full
                        compRow1(2) = 1;                    % Computer has marked the second spot in Row 1
                        compColumn2(1) = 1;                 % Computer has marked the first spot in Column 1
                        turn = turn + 1;                    % It is now the next turn
                        
                    elseif compInput == 5 && spot5 == 0     % If the computer inputs 5 and spot 5 is empty
                        delete(spotLabel5Text)              % Delete label "5" from board
                        plot(6,6,'bo', 'MarkerSize', 60)    % Plot O at 5
                        spot5 = 1;                          % Spot 5 is now full
                        compRow2(2) = 1;                    % Computer has marked the second spot in Row 2
                        compColumn2(2) = 1;                 % Computer has marked the second spot in Column 2
                        compDiagFromLeft(2) = 1;            % Computer has marked the second spot in the Left Diagonal
                        compDiagFromRight(2) = 1;           % Computer has marked the second spot in the Right Diagonal
                        turn = turn + 1;                    % It is now the next turn
                        
                    elseif compInput == 6 && spot6 == 0     % If the computer inputs 6 and spot 6 is empty
                        delete(spotLabel6Text)              % Delete label "6" from board
                        plot(6,2,'bo', 'MarkerSize', 60)    % Plot O at 6
                        spot6 = 1;                          % Spot 6 is now full
                        compRow3(2) = 1;                    % Computer has marked the second spot in Row 3
                        compColumn2(3) = 1;                 % Computer has marked the third spot in Column 2
                        turn = turn + 1;                    % It is now the next turn
                        
                    elseif compInput == 7 && spot7 == 0     % If the computer inputs 7 and spot 7 is empty
                        delete(spotLabel7Text)              % Delete label "7" from board
                        plot(10,10,'bo', 'MarkerSize', 60)  % Plot O at 7
                        spot7 = 1;                          % Spot 7 is now full
                        compRow1(3) = 1;                    % Computer has marked the third spot in Row 1
                        compColumn3(1) = 1;                 % Computer has marked the first spot in Column 3
                        compDiagFromRight(3) = 1;           % Computer has marked the third spot in the Right Diagonal
                        turn = turn + 1;                    % It is now the next turn
                        
                    elseif compInput == 8 && spot8 == 0     % If the computer inputs 8 and spot 8 is empty
                        delete(spotLabel8Text)              % Delete label "8" from board
                        plot(10,6,'bo', 'MarkerSize', 60)   % Plot O at 8
                        spot8 = 1;                          % Spot 8 is now full
                        compRow2(3) = 1;                    % Computer has marked the third spot in Row 2
                        compColumn3(2) = 1;                 % Computer has marked the second spot in Column 3
                        turn = turn + 1;                    % It is now the next turn
                        
                    elseif compInput == 9 && spot9 == 0     % If the computer inputs 9 and spot 9 is empty
                        delete(spotLabel9Text)              % Delete label "9" from board
                        plot(10,2,'bo', 'MarkerSize', 60)   % Plot O at 9
                        spot9 = 1;                          % Spot 9 is now full
                        compRow3(3) = 1;                    % Computer has marked the third spot in Row 3
                        compColumn3(3) = 1;                 % Computer has marked the third spot in Column 3
                        compDiagFromLeft(3) = 1;            % Computer has marked the third spot in the Left Diagonal
                        turn = turn + 1;                    % It is now the next turn
                        
                    else
                    end
                else
                    break       % If someone has won, end loop
                end
            end
            
            while turn ==7  % While it is the seventh turn
                
                if userWins == '?'  % If user has not won, lost, or tied
                    
                    % Determining if the computer has won %
                    if compRow1 == [1 1 1];
                        break
                    elseif compRow2 == [1 1 1];
                        break
                    elseif compRow3 == [1 1 1];
                        break
                    elseif compColumn1 == [1 1 1]'
                        break
                    elseif compColumn2 == [1 1 1]'
                        break
                    elseif compColumn3 == [1 1 1]'
                        break
                    elseif compDiagFromLeft == [1 1 1]
                        break
                    elseif compDiagFromRight == [1 1 1]
                        break
                    else
                        
                    end
                end
                
                if userWins == '?' % If user has not won, lost, or tied
                    
                    userInput = input('What spot do you want to pick? (ex: 1,2,3, ... )   '); % Asking user to input number
                    
                    
                    if userInput == 1                           % If user inputs 1
                        if spot1 == 0                           % If spot 1 is empty
                            delete(spotLabel1Text)              % Delete the label "1" on board
                            plot(2,10,'rX', 'MarkerSize', 60)   % Plot X at 1
                            spot1 = 1;                          % Spot 1 is now full
                            userRow1(1) = 1;                     % User has marked the first spot in Row 1
                            userColumn1(1) = 1;                 % User has marked the first spot in Column 1
                            userDiagFromLeft(1) = 1;            % User has marked the first spot in Left Diagonal
                            turn = turn + 1;                    % It is the next turn
                        else
                            disp('Please input a number that has not been taken (format ex: 1,2,3, ...)   '); % Telling user to input number that has not been taken
                        end
                        
                        
                    elseif userInput == 2                       % If user inputs 2
                        if spot2 == 0                           % If spot 2 is empty
                            delete(spotLabel2Text)              % Delete the label "2" on board
                            plot(2,6,'rX', 'MarkerSize', 60)    % Plot X at 2
                            spot2 = 1;                          % Spot 2 is now full
                            userRow2(1) = 1                     % User has marked the first spot in Row 2
                            userColumn1(2) = 1;                 % User has marked the second spot in Column 1
                            turn = turn + 1;                    % It is the next turn
                        else
                            disp('Please input a number that has not been taken (format ex: 1,2,3, ...)   '); % Telling user to input number that has not been taken
                        end
                        
                    elseif userInput == 3                       % If user inputs 3
                        if spot3 == 0                           % If spot 3 is empty
                            delete(spotLabel3Text)              % Delete the label "3" on board
                            plot(2,2,'rX', 'MarkerSize', 60)    % Plot X at 3
                            spot3 = 1;                          % Spot 3 is now full
                            userRow3(1) = 1;                    % User has marked the first spot in Row 3
                            userColumn1(3) = 1;                 % User has marked the third spot in Column 1
                            userDiagFromRight(1) = 1;           % User has marked the first spot in the Right Diagonal
                            turn = turn + 1;                    % It is the next turn
                        else
                            disp('Please input a number that has not been taken (format ex: 1,2,3, ...)   '); % Telling user to input number that has not been taken
                        end
                        
                    elseif userInput == 4                       % If user inputs 4
                        if spot4 == 0                           % If spot 4 is empty
                            delete(spotLabel4Text)              % Delete the label "4" on board
                            plot(6,10,'rX', 'MarkerSize', 60)   % Plot X at 4
                            spot4 = 1;                          % Spot 4 is now full
                            userRow1(2) = 1;                     % User has marked the second spot in Row 1
                            userColumn2(1) = 1;                 % User has marked the first spot in Column 1
                            turn = turn + 1;                    % It is the next turn
                        else
                            disp('Please input a number that has not been taken (format ex: 1,2,3, ...)   '); % Telling user to input number that has not been taken
                        end
                        
                    elseif userInput == 5                       % If user inputs 5
                        if spot5 == 0                           % If spot 5 is empty
                            delete(spotLabel5Text)              % Delete the label "5" on board
                            plot(6,6,'rX', 'MarkerSize', 60)    % Plot X at 5
                            spot5 = 1;                          % Spot 5 is now full
                            userRow2(2) = 1;                     % User has marked the second spot in Row 2
                            userColumn2(2) = 1;                 % User has marked the second spot in Column 2
                            userDiagFromLeft(2) = 1;            % User has marked the second spot in the Left Diagonal
                            userDiagFromRight(2) = 1;           % User has marked the second spot in the Right Diagonal
                            turn = turn + 1;                    % It is the next turn
                        else
                            disp('Please input a number that has not been taken (format ex: 1,2,3, ...)   '); % Telling user to input number that has not been taken
                        end
                        
                    elseif userInput == 6                       % If user inputs 6
                        if spot6 == 0                           % If spot 6 is empty
                            delete(spotLabel6Text)              % Delete the label "6" on board
                            plot(6,2,'rX', 'MarkerSize', 60)    % Plot X at 6
                            spot6 = 1;                          % Spot 6 is now full
                            userRow3(2) = 1;                    % User has marked the second spot in Row 3
                            userColumn2(3) = 1;                 % User has marked the third spot in Column 2
                            turn = turn + 1;                    % It is the next turn
                        else
                            disp('Please input a number that has not been taken (format ex: 1,2,3, ...)   '); % Telling user to input number that has not been taken
                        end
                        
                    elseif userInput == 7                       % If user inputs 7
                        if spot7 == 0                           % If spot 7 is empty
                            delete(spotLabel7Text)              % Delete the label "7" on board
                            plot(10,10,'rX', 'MarkerSize', 60)  % Plot X at 7
                            spot7 = 1;                          % Spot 7 is now full
                            userRow1(3) = 1;                     % User has marked the thrid spot in Row 3
                            userColumn3(1) = 1;                 % User has marked the first spot in Column 3
                            userDiagFromRight(3) = 1;           % User has marked the third spot in the Right Diagonal
                            turn = turn + 1;                    % It is the next turn
                        else
                            disp('Please input a number that has not been taken (format ex: 1,2,3, ...)   '); % Telling user to input number that has not been taken
                        end
                        
                    elseif userInput == 8                       % If user inputs 8
                        if spot8 == 0                           % If spot 8 is empty
                            delete(spotLabel8Text)              % Delete the label "8" on board
                            plot(10,6,'rX', 'MarkerSize', 60)   % Plot X at 8
                            spot8 = 1;                          % Spot 8 is now full
                            userRow2(3) = 1;                     % User has marked the third spot in Row 2
                            userColumn3(2) = 1;                 % User has marked the second spot in Column 3
                            turn = turn + 1;                    % It is the next turn
                        else
                            disp('Please input a number that has not been taken (format ex: 1,2,3, ...)   '); % Telling user to input number that has not been taken
                        end
                        
                    elseif userInput == 9                       % If user inputs 9
                        if spot9 == 0                           % If spot 9 is empty
                            delete(spotLabel9Text)              % Delete the label "9" on board
                            plot(10,2,'rX', 'MarkerSize', 60)   % Plot X at 9
                            spot9 = 1;                          % Spot 9 is now full
                            userRow3(3) = 1;                    % User has marked the third spot in Row 3
                            userColumn3(3) = 1;                 % User has marked the thrid spot in Column 3
                            userDiagFromLeft(3) = 1;            % User has marked the third spot in the Right Diagonal
                            turn = turn + 1;                    % It is the next turn
                        else
                            disp('Please input a number that has not been taken (format ex: 1,2,3, ...)   '); % Telling user to input number that has not been taken
                        end
                        
                    else userInput = input('Please pick a spot that has not been taken   ');
                    end
                else
                    break       % If someone has won, end loop
                end
                
            end
            
            while turn == 8     % While it is the eighth turn
                
                if userWins == '?'      % If user has not won, lost, or tied
                    % Determining if the user has won %
                    if userRow1 == [1 1 1];
                        break
                    elseif userRow2 == [1 1 1];
                        break
                    elseif userRow3 == [1 1 1];
                        break
                    elseif userColumn1 == [1 1 1]'
                        break
                    elseif userColumn2 == [1 1 1]'
                        break
                    elseif userColumn3 == [1 1 1]'
                        break
                    elseif userDiagFromLeft == [1 1 1]
                        break
                    elseif userDiagFromRight == [1 1 1]
                        break
                    else
                        
                    end
                end
                
                if userWins == '?'      % If the user has not won, lost, or tied
                    
                    compInput = randi([1,9],1);         % Computer randomly deciding what spot to mark
                    
                    if compInput == 1 && spot1 == 0         % If computer inputs 1 and spot 1 is empty
                        delete(spotLabel1Text)              % Delete label "1" from board
                        plot(2,10,'bo', 'MarkerSize', 60)   % Plot O at 1
                        spot1 = 1;                          % Spot 1 is now full
                        compRow1(1) = 1;                    % Computer has marked the first spot in Row 1
                        compColumn1(1) = 1;                 % Computer has marked the first spot in Column 1
                        compDiagFromLeft(1) = 1;            % Computer has marked the first spot in the Left Diagonal
                        turn = turn + 1;                    % It is now the next turn
                        
                    elseif compInput == 2 && spot2 == 0     % If computer inputs 2 and spot 2 is empty
                        delete(spotLabel2Text)              % Delete label "2" from board
                        plot(2,6,'bo', 'MarkerSize', 60)    % Plot O at 2
                        spot2 = 1;                          % Spot 2 is now full
                        compRow2(1) = 1;                    % Computer has marked the first spot in Row 2
                        compColumn1(2) = 1;                 % Computer has marked the second spot in Column 2
                        turn = turn + 1;                    % It is now the next turn
                        
                    elseif compInput == 3 && spot3 == 0     % If computer inputs 3 and spot 3 is empty
                        delete(spotLabel3Text)              % Delete label "3" from board
                        plot(2,2,'bo', 'MarkerSize', 60)    % Plot O at 3
                        spot3 = 1;                          % Spot 3 is now full
                        compRow3(1) = 1;                    % Computer has marked the first spot in Row 3
                        compColumn1(3) = 1;                 % Computer has marked the third spot in Column 3
                        compDiagFromRight(1) = 1;           % Computer has marked the first spot in the Right Diagonal
                        turn = turn + 1;                    % It is now the next turn
                        
                    elseif compInput == 4 && spot4 ==0      % If the computer inputs 4 and spot 4 is empty
                        delete(spotLabel4Text)              % Delete label "4" from board
                        plot(6,10,'bo', 'MarkerSize', 60)   % Plot O at 4
                        spot4 = 1;                          % Spot 4 is now full
                        compRow1(2) = 1;                    % Computer has marked the second spot in Row 1
                        compColumn2(1) = 1;                 % Computer has marked the first spot in Column 1
                        turn = turn + 1;                    % It is now the next turn
                        
                    elseif compInput == 5 && spot5 == 0     % If the computer inputs 5 and spot 5 is empty
                        delete(spotLabel5Text)              % Delete label "5" from board
                        plot(6,6,'bo', 'MarkerSize', 60)    % Plot O at 5
                        spot5 = 1;                          % Spot 5 is now full
                        compRow2(2) = 1;                    % Computer has marked the second spot in Row 2
                        compColumn2(2) = 1;                 % Computer has marked the second spot in Column 2
                        compDiagFromLeft(2) = 1;            % Computer has marked the second spot in the Left Diagonal
                        compDiagFromRight(2) = 1;           % Computer has marked the second spot in the Right Diagonal
                        turn = turn + 1;                    % It is now the next turn
                        
                    elseif compInput == 6 && spot6 == 0     % If the computer inputs 6 and spot 6 is empty
                        delete(spotLabel6Text)              % Delete label "6" from board
                        plot(6,2,'bo', 'MarkerSize', 60)    % Plot O at 6
                        spot6 = 1;                          % Spot 6 is now full
                        compRow3(2) = 1;                    % Computer has marked the second spot in Row 3
                        compColumn2(3) = 1;                 % Computer has marked the third spot in Column 2
                        turn = turn + 1;                    % It is now the next turn
                        
                    elseif compInput == 7 && spot7 == 0     % If the computer inputs 7 and spot 7 is empty
                        delete(spotLabel7Text)              % Delete label "7" from board
                        plot(10,10,'bo', 'MarkerSize', 60)  % Plot O at 7
                        spot7 = 1;                          % Spot 7 is now full
                        compRow1(3) = 1;                    % Computer has marked the third spot in Row 1
                        compColumn3(1) = 1;                 % Computer has marked the first spot in Column 3
                        compDiagFromRight(3) = 1;           % Computer has marked the third spot in the Right Diagonal
                        turn = turn + 1;                    % It is now the next turn
                        
                    elseif compInput == 8 && spot8 == 0     % If the computer inputs 8 and spot 8 is empty
                        delete(spotLabel8Text)              % Delete label "8" from board
                        plot(10,6,'bo', 'MarkerSize', 60)   % Plot O at 8
                        spot8 = 1;                          % Spot 8 is now full
                        compRow2(3) = 1;                    % Computer has marked the third spot in Row 2
                        compColumn3(2) = 1;                 % Computer has marked the second spot in Column 3
                        turn = turn + 1;                    % It is now the next turn
                        
                    elseif compInput == 9 && spot9 == 0     % If the computer inputs 9 and spot 9 is empty
                        delete(spotLabel9Text)              % Delete label "9" from board
                        plot(10,2,'bo', 'MarkerSize', 60)   % Plot O at 9
                        spot9 = 1;                          % Spot 9 is now full
                        compRow3(3) = 1;                    % Computer has marked the third spot in Row 3
                        compColumn3(3) = 1;                 % Computer has marked the third spot in Column 3
                        compDiagFromLeft(3) = 1;            % Computer has marked the third spot in the Left Diagonal
                        turn = turn + 1;                    % It is now the next turn
                        
                    else
                    end
                else
                    break           % If someone has won, end loop
                end
            end
            
            while turn == 9  % While it is the ninth turn
                if userWins == '?'      % If user has not won, lost, or tied
                    % Determining if the computer has won %
                    if compRow1 == [1 1 1];
                        break
                    elseif compRow2 == [1 1 1];
                        break
                    elseif compRow3 == [1 1 1];
                        break
                    elseif compColumn1 == [1 1 1]'
                        break
                    elseif compColumn2 == [1 1 1]'
                        break
                    elseif compColumn3 == [1 1 1]'
                        break
                    elseif compDiagFromLeft == [1 1 1]
                        break
                    elseif compDiagFromRight == [1 1 1]
                        break
                    else
                        
                    end
                end
                
                if userWins == '?'      % If user has not won, lost, or tied
                    
                    userInput = input('What spot do you want to pick? (ex: 1,2,3, ...)  '); % Asking user to input a number
                    
                    
                    if userInput == 1                           % If user inputs 1
                        if spot1 == 0                           % If spot 1 is empty
                            delete(spotLabel1Text)              % Delete the label "1" on board
                            plot(2,10,'rX', 'MarkerSize', 60)   % Plot X at 1
                            spot1 = 1;                          % Spot 1 is now full
                            userRow1(1) = 1;                     % User has marked the first spot in Row 1
                            userColumn1(1) = 1;                 % User has marked the first spot in Column 1
                            userDiagFromLeft(1) = 1;            % User has marked the first spot in Left Diagonal
                            turn = turn + 1;                    % It is the next turn
                        else
                            disp('Please input a number that has not been taken (format ex: 1,2,3, ...)   '); % Telling user to input number that has not been taken
                        end
                        
                        
                    elseif userInput == 2                       % If user inputs 2
                        if spot2 == 0                           % If spot 2 is empty
                            delete(spotLabel2Text)              % Delete the label "2" on board
                            plot(2,6,'rX', 'MarkerSize', 60)    % Plot X at 2
                            spot2 = 1;                          % Spot 2 is now full
                            userRow2(1) = 1;                    % User has marked the first spot in Row 2
                            userColumn1(2) = 1;                 % User has marked the second spot in Column 1
                            turn = turn + 1;                    % It is the next turn
                        else
                            disp('Please input a number that has not been taken (format ex: 1,2,3, ...)   '); % Telling user to input number that has not been taken
                        end
                        
                    elseif userInput == 3                       % If user inputs 3
                        if spot3 == 0                           % If spot 3 is empty
                            delete(spotLabel3Text)              % Delete the label "3" on board
                            plot(2,2,'rX', 'MarkerSize', 60)    % Plot X at 3
                            spot3 = 1;                          % Spot 3 is now full
                            userRow3(1) = 1;                    % User has marked the first spot in Row 3
                            userColumn1(3) = 1;                 % User has marked the third spot in Column 1
                            userDiagFromRight(1) = 1;           % User has marked the first spot in the Right Diagonal
                            turn = turn + 1;                    % It is the next turn
                        else
                            disp('Please input a number that has not been taken (format ex: 1,2,3, ...)   '); % Telling user to input number that has not been taken
                        end
                        
                    elseif userInput == 4                       % If user inputs 4
                        if spot4 == 0                           % If spot 4 is empty
                            delete(spotLabel4Text)              % Delete the label "4" on board
                            plot(6,10,'rX', 'MarkerSize', 60)   % Plot X at 4
                            spot4 = 1;                          % Spot 4 is now full
                            userRow1(2) = 1;                     % User has marked the second spot in Row 1
                            userColumn2(1) = 1;                 % User has marked the first spot in Column 1
                            turn = turn + 1;                    % It is the next turn
                        else
                            disp('Please input a number that has not been taken (format ex: 1,2,3, ...)   '); % Telling user to input number that has not been taken
                        end
                        
                    elseif userInput == 5                       % If user inputs 5
                        if spot5 == 0                           % If spot 5 is empty
                            delete(spotLabel5Text)              % Delete the label "5" on board
                            plot(6,6,'rX', 'MarkerSize', 60)    % Plot X at 5
                            spot5 = 1;                          % Spot 5 is now full
                            userRow2(2) = 1;                     % User has marked the second spot in Row 2
                            userColumn2(2) = 1;                 % User has marked the second spot in Column 2
                            userDiagFromLeft(2) = 1;            % User has marked the second spot in the Left Diagonal
                            userDiagFromRight(2) = 1;           % User has marked the second spot in the Right Diagonal
                            turn = turn + 1;                    % It is the next turn
                        else
                            disp('Please input a number that has not been taken (format ex: 1,2,3, ...)   '); % Telling user to input number that has not been taken
                        end
                        
                    elseif userInput == 6                       % If user inputs 6
                        if spot6 == 0                           % If spot 6 is empty
                            delete(spotLabel6Text)              % Delete the label "6" on board
                            plot(6,2,'rX', 'MarkerSize', 60)    % Plot X at 6
                            spot6 = 1;                          % Spot 6 is now full
                            userRow3(2) = 1;                    % User has marked the second spot in Row 3
                            userColumn2(3) = 1;                 % User has marked the third spot in Column 2
                            turn = turn + 1;                    % It is the next turn
                        else
                            disp('Please input a number that has not been taken (format ex: 1,2,3, ...)   '); % Telling user to input number that has not been taken
                        end
                        
                    elseif userInput == 7                       % If user inputs 7
                        if spot7 == 0                           % If spot 7 is empty
                            delete(spotLabel7Text)              % Delete the label "7" on board
                            plot(10,10,'rX', 'MarkerSize', 60)  % Plot X at 7
                            spot7 = 1;                          % Spot 7 is now full
                            userRow1(3) = 1;                     % User has marked the thrid spot in Row 3
                            userColumn3(1) = 1;                 % User has marked the first spot in Column 3
                            userDiagFromRight(3) = 1;           % User has marked the third spot in the Right Diagonal
                            turn = turn + 1;                    % It is the next turn
                        else
                            disp('Please input a number that has not been taken (format ex: 1,2,3, ...)   '); % Telling user to input number that has not been taken
                        end
                        
                    elseif userInput == 8                       % If user inputs 8
                        if spot8 == 0                           % If spot 8 is empty
                            delete(spotLabel8Text)              % Delete the label "8" on board
                            plot(10,6,'rX', 'MarkerSize', 60)   % Plot X at 8
                            spot8 = 1;                          % Spot 8 is now full
                            userRow2(3) = 1;                     % User has marked the third spot in Row 2
                            userColumn3(2) = 1;                 % User has marked the second spot in Column 3
                            turn = turn + 1;                    % It is the next turn
                        else
                            disp('Please input a number that has not been taken (format ex: 1,2,3, ...)   '); % Telling user to input number that has not been taken
                        end
                        
                    elseif userInput == 9                       % If user inputs 9
                        if spot9 == 0                           % If spot 9 is empty
                            delete(spotLabel9Text)              % Delete the label "9" on board
                            plot(10,2,'rX', 'MarkerSize', 60)   % Plot X at 9
                            spot9 = 1;                          % Spot 9 is now full
                            userRow3(3) = 1;                    % User has marked the third spot in Row 3
                            userColumn3(3) = 1;                 % User has marked the thrid spot in Column 3
                            userDiagFromLeft(3) = 1;            % User has marked the third spot in the Right Diagonal
                            turn = turn + 1;                    % It is the next turn
                        else
                            disp('Please input a number that has not been taken (format ex: 1,2,3, ...)   '); % Telling user to input number that has not been taken
                        end
                        
                    else userInput = input('Please input a number (ex: 1,2,3, ...)   '); % Reminding user ot input a valid number
                    end
                else
                    break       % If someone has won, end loop
                end
                
            end
            
        end
        
        % Determining if the user won, lost, or if there was a tie %
        if userRow1 == [1 1 1];
            msgbox('You Win!')
            userWins = 'Y';
            clc
            disp('Way to go! Thanks for playing winner!')
            
        elseif userRow2 == [1 1 1];
            msgbox('You Win!')
            userWins = 'Y';
            clc
            disp('Way to go! Thanks for playing winner!')
            
        elseif userRow3 == [1 1 1];
            msgbox('You Win!')
            userWins = 'Y';
            clc
            disp('Way to go! Thanks for playing winner!')
            
        elseif userColumn1 == [1 1 1]'
            msgbox('You Win!')
            userWins = 'Y';
            clc
            disp('Way to go! Thanks for playing winner!')
            
        elseif userColumn2 == [1 1 1]'
            msgbox('You Win!')
            userWins = 'Y';
            clc
            disp('Way to go! Thanks for playing winner!')
            
        elseif userColumn3 == [1 1 1]'
            msgbox('You Win!')
            userWins = 'Y';
            clc
            disp('Way to go! Thanks for playing winner!')
            
        elseif userDiagFromLeft == [1 1 1]
            msgbox('You Win!')
            userWins = 'Y';
            clc
            disp('Way to go! Thanks for playing winner!')
            
        elseif userDiagFromRight == [1 1 1]
            msgbox('You Win!')
            userWins = 'Y';
            clc
            disp('Way to go! Thanks for playing winner!')
            
        elseif compRow1 == [1 1 1];
            msgbox('You Lose!')
            userWins = 'N';
            clc
            disp('Uh oh, you lost! Thanks for playing!')
            break
        elseif compRow2 == [1 1 1];
            msgbox('You Lose!')
            userWins = 'N';
            clc
            disp('Uh oh, you lost! Thanks for playing!')
            break
        elseif compRow3 == [1 1 1];
            msgbox('You Lose!')
            userWins = 'N';
            clc
            disp('Uh oh, you lost! Thanks for playing!')
            break
        elseif compColumn1 == [1 1 1]'
            msgbox('You Lose!')
            userWins = 'N';
            clc
            disp('Uh oh, you lost! Thanks for playing!')
            break
        elseif compColumn2 == [1 1 1]'
            msgbox('You Lose!')
            userWins = 'N';
            clc
            disp('Uh oh, you lost! Thanks for playing!')
            break
        elseif compColumn3 == [1 1 1]'
            msgbox('You Lose!')
            userWins = 'N';
            clc
            disp('Uh oh, you lost! Thanks for playing!')
        elseif compDiagFromLeft == [1 1 1]
            msgbox('You Lose!')
            userWins = 'N';
            clc
            disp('Uh oh, you lost! Thanks for playing!')
            break
        elseif compDiagFromRight == [1 1 1]
            msgbox('You Lose!')
            userWins = 'N';
            clc
            disp('Uh oh, you lost! Thanks for playing!')
            break
            
        else
            if userWins == 'Y'
            elseif userWins == 'N'
            else        % If nobody has won
                msgbox('It''s a draw!')
                clc
                disp('Oh no, a Draw! That could have ended better! Thanks for playing!')
                userWins = 'T';
            end
        end
        
    end
    
    
    % Asking user if they would like to play again %
    
    while replayPrompt == 0             % While user has not answered if they would like to replay
        replayAnswer = upper(input('Would you like to play again?  Y/N ', 's'))
        if replayAnswer == 'Y'          % If user wants to replay
            disp('Great! This time will be better than the last!')
            pause(0.5)
            turn = 1;                   % Resetting turn number
            userWins = '?';             % Resetting win indicator
            replayPrompt = 1;           % Ending loop asking if the user would like to replay
        elseif replayAnswer == 'N'      % If user does not want to replay
            if userWins == 'Y'          % If user won but does not want to play again
                disp('Congrats on winning! I hope you had fun, please play again in the future!')
                replayPrompt = 1;
                pause(1)
                quit                    % Quitting MATLAB
            elseif userWins =='N'       % If user lost and does not want to play again
                disp('I''m sorry you didn''t win. I hope you had fun, please play again in the future!')
                replayPrompt = 1;
                pause(1)
                quit                    % Quitting MATLAB
            else                        % If user did not win or lose and does not want to play again
                disp('You didn''t win or lose! I hope you had fun, please play again in the future!')
                replayPrompt = 1;
                pause(1)
                quit                    % Quitting MATLAB
            end
        else                            % If user input invalid answer
            replayAnswer = input('Please input a Y or N. Would you like to play again?   ', 's') % Reminding user to input a valid answer
            
        end
        
    end
end
