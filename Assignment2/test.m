%% KINE6203 - Assignment 2
% Tic-Tac-Toe Game
% Written by: Patricia M. Butler
% Date: 10-08-2020

% Description: This code was written to generate a tic-tac-toe game that the user can
% play against an AI.

% Developed on Matlab version R2019b, Update 3, with Windows 10 Version
clc
clear all
close all

%% Welcome Message
% This section is welcoming the user aand inquiring if they would like to
% play a game

i = 0;

while i == 0
    
promptPlay = 'Would you like to play Tic-Tac-Toe? (Y/N)  '
userInput = input(promptPlay,'s')

if userInput == 'Y'
    i = 1
    promptResponse = 'Great! Lets get started!  '

elseif userInput == 'N'
    i =2
    promptResponse = 'Get outta here!' 
    quit
    
else 
    promptResponse = 'Please reply with Y or N  '
    i = 0;
    pause(1.5)
    end
end

pause(1.5)
clc   

%% Establishing Turn Order

k = 0;

userInputOrder = 'Would you prefer to go first or second? Please input 1 or 2   '
playerOrder = input(userInputOrder);

while k == 0
if playerOrder == 1
    userInputOrderResponse = 'You would like to go first? Alright, lets get started!   '
    k = 1;
elseif playerOrder == 2
    userInputOrderResponse = 'You would like to go second? They do say first is the worst and second is the best!  '
    k = 2;
else
    userInputOrderResponse = 'Someone was not reading very carefully. I am going to give you another chance, please do not let me down!   '
    pause(1.5)
    userInputOrder = 'Would you prefer to go first or second? Please input 1 or 2   '
    playerOrder = input(userInputOrder);
    if playerOrder == 1
        userInputOrderResponse = 'You would like to go first? Alright, lets get started!   '
        k=1;
    elseif playerOrder == 2
        userInputOrderResponse = 'You would like to go second? They do say first is the worst and second is the best!  '
        k=2;
    else
        'Okay, I give up, you are just going to go first. '
        k = 1;
    end
end
end

pause(1.5)
clc

%% Generating Game Board

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

slot1 = 'Empty!';
slot2 = 'Empty!';
slot3 = 'Empty!';
slot4 = 'Empty!';
slot5 = 'Empty1';
slot6 = 'Empty!';
slot7 = 'Empty!';
slot8 = 'Empty!';
slot9 = 'Empty!';

slotLabel1Text = text(1.5,10,slotLabel1,'FontSize', 60, 'Color', 'r');
slotLabel2Text = text(1.5,6,slotLabel2,'FontSize', 60, 'Color', 'r');
slotLabel3Text = text(1.5,2,slotLabel3,'FontSize', 60, 'Color', 'r');
slotLabel4Text = text(5.5,10,slotLabel4,'FontSize', 60, 'Color', 'r');
slotLabel5Text = text(5.5,6,slotLabel5,'FontSize', 60, 'Color', 'r');
slotLabel6Text = text(5.5,2,slotLabel6,'FontSize', 60, 'Color', 'r');
slotLabel7Text = text(9.5,10,slotLabel7,'FontSize', 60, 'Color', 'r');
slotLabel8Text = text(9.5,6,slotLabel8,'FontSize', 60, 'Color', 'r');
slotLabel9Text = text(9.5,2,slotLabel9,'FontSize', 60, 'Color', 'r');
%%

if k==2
  n=1;
  for t = (n:9)  
nx=0;
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
else nx = 1;

end
end

ny=0;
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
while n == 1|3|5|7|9
if ComputerInput1 == ([2,10])
    if slot1 == 'Empty!'
    delete(slotLabel1Text)
    plot(computerOutputx,computerOutputy,'bo', 'MarkerSize', 60)
    slot1 = 'Filled';
    n=n+1;
    else n=n;
    end
        
elseif ComputerInput1 == ([2,6])
    if slot2 == 'Empty!'
    delete(slotLabel2Text)
    plot(computerOutputx,computerOutputy,'bo', 'MarkerSize', 60)
    slot2 = 'Filled';
    n=n+1;
    else n=n;
    end
        
elseif ComputerInput1 == ([2,2])
    if slot3 == 'Empty!'
    delete(slotLabel3Text)
    plot(computerOutputx,computerOutputy,'bo', 'MarkerSize', 60)
    slot3 = 'Filled';
    n=n+1;
    else n=n;
    end
    
elseif ComputerInput1 == ([6,10])
    if slot4 == 'Empty!'
    delete(slotLabel4Text)
    plot(computerOutputx,computerOutputy,'bo', 'MarkerSize', 60)
    slot4 = 'Filled';
    n=n+1;
    else n=n;
    end
    
elseif ComputerInput1 == ([6,6])
    if slot5 == 'Empty!'
    delete(slotLabel5Text)
    plot(computerOutputx,computerOutputy,'bo', 'MarkerSize', 60)
    slot5 = 'Filled';
    n=n+1;
    else n=n;
    end
    
elseif ComputerInput1 == ([6,2])
    if slot6 == 'Empty!'
    delete(slotLabel6Text)
    plot(computerOutputx,computerOutputy,'bo', 'MarkerSize', 60)
    slot6 = 'Filled';
    n=n+1;
    else n=n;
    end
    
elseif ComputerInput1 == ([10,10])
    if slot7 == 'Empty!'
    delete(slotLabel7Text)
    plot(computerOutputx,computerOutputy,'bo', 'MarkerSize', 60)
    slot7 = 'Filled';
    n=n+1;
    else n=n;
    end
    
elseif ComputerInput1 == ([10,6])
    if slot8 == 'Empty!'
    delete(slotLabel8Text)
    plot(computerOutputx,computerOutputy,'bo', 'MarkerSize', 60)
    slot8 = 'Filled';
    n=n+1;
    else n=n;
    end
    
elseif ComputerInput1 == ([10,2])
    if slot9 == 'Empty!'
    delete(slotLabel9Text)
    plot(computerOutputx,computerOutputy,'bo', 'MarkerSize', 60)
    slot9 = 'Filled';
    n=n+1;
    else n=n;
    end
    
end
end

% Player Turn %
if n == 2|4|6|8
disp('Your Turn!')
    userInput1 = input('What is the number of the box you wish to select?   ');
    if userInput1 == 1
        delete(slotLabel1Text)
        plot(2,10,'rX', 'MarkerSize', 60)
        slot1 = 'Filled';
        n=n+1;
        
    elseif userInput1 == 'One'
        delete(slotLabel1Text)
        plot(2,10,'rX', 'MarkerSize', 60)
        slot1 = 'Filled';
        n=n+1;
        
    elseif userInput1 == 'one'
        delete(slotLabel1Text)
        plot(2,10,'rX', 'MarkerSize', 60)
        slot1 = 'Filled';
        n=n+1;
        
     elseif userInput1 == 2
        delete(slotLabel2Text)
        plot(2,6,'rX', 'MarkerSize', 60)
        slot2 = 'Filled';
        n=n+1;
        
    elseif userInput1 == 'Two'
        delete(slotLabel2Text)
        plot(2,6,'rX', 'MarkerSize', 60)
        slot2 = 'Filled';
        n=n+1;
        
    elseif userInput1 == 'two'
        delete(slotLabel2Text)
        plot(2,6,'rX', 'MarkerSize', 60)
        slot2 = 'Filled';
        n=n+1;
        
    elseif userInput1 == 3
        delete(slotLabel3Text)
        plot(2,2,'rX', 'MarkerSize', 60)
        slot3 = 'Filled';
        n=n+1;
        
    elseif userInput1 == 'Three'
        delete(slotLabel3Text)
        plot(2,2,'rX', 'MarkerSize', 60)
        slot3 = 'Filled';
        n=n+1;
        
    elseif userInput1 == 'three'
        delete(slotLabel3Text)
        plot(2,2,'rX', 'MarkerSize', 60)
        slot3 = 'Filled';
        n=n+1;
        
    elseif userInput1 == 4
        delete(slotLabel4Text)
        plot(6,10,'rX', 'MarkerSize', 60)
        slot4 = 'Filled';
        n=n+1;
        
    elseif userInput1 == 'Four'
        delete(slotLabel4Text)
        plot(6,10,'rX', 'MarkerSize', 60)
        slot4 = 'Filled';
        n=n+1;
        
    elseif userInput1 == 'four'
        delete(slotLabel4Text)
        plot(6,10,'rX', 'MarkerSize', 60)
        slot4 = 'Filled';
        n=n+1;
        
    elseif userInput1 == 5
        delete(slotLabel5Text)
        plot(6,6,'rX', 'MarkerSize', 60)
        slot5 = 'Filled';
        n=n+1;
        
    elseif userInput1 == 'Five'
        delete(slotLabel5Text)
        plot(6,6,'rX', 'MarkerSize', 60)
        slot5 = 'Filled';
        n=n+1;
    elseif userInput1 == 'five'
        delete(slotLabel5Text)
        plot(6,6,'rX', 'MarkerSize', 60)
        slot5 = 'Filled';
        n=n+1;
        
    elseif userInput1 == 6
        delete(slotLabel6Text)
        plot(6,2,'rX', 'MarkerSize', 60)
        slot6 = 'Filled';
        n=n+1;
        
    elseif userInput1 == 'Six'
        delete(slotLabel6Text)
        plot(6,2,'rX', 'MarkerSize', 60)
        slot6 = 'Filled';
        n=n+1;
        
    elseif userInput1 == 'six'
        delete(slotLabel6Text)
        plot(6,2,'rX', 'MarkerSize', 60)
        slot6 = 'Filled';
        n=n+1;
        
    elseif userInput1 == 7
        delete(slotLabel7Text)
        plot(10,10,'r*', 'MarkerSize', 60)
        slot7 = 'Filled';
        n=n+1;
        
    elseif userInput1 == 'Seven'
        delete(slotLabel7Text)
        plot(10,10,'rX', 'MarkerSize', 60)
        slot7 = 'Filled';
        n=n+1;
        
    elseif userInput1 == 'seven'
        delete(slotLabel7Text)
        plot(10,10,'rX', 'MarkerSize', 60)
        slot7 = 'Filled';
        n=n+1;
        
    elseif userInput1 == 8
        delete(slotLabel8Text)
        plot(10,6,'rX', 'MarkerSize', 60)
        slot8 = 'Filled';
        n=n+1;
        
    elseif userInput1 == 'Eight'
        delete(slotLabel8Text)
        plot(10,6,'rX', 'MarkerSize', 60)
        slot8 = 'Filled';
        n=n+1;
        
    elseif userInput1 == 'eight'
        delete(slotLabel8Text)
        plot(10,6,'rX', 'MarkerSize', 60)
        slot8 = 'Filled';
        n=n+1;
        
    elseif userInput1 == 9
        delete(slotLabel9Text)
        plot(10,2,'rX', 'MarkerSize', 60)
        slot9 = 'Filled';
        n=n+1;
        
    elseif userInput1 == 'Nine'
        delete(slotLabel9Text)
        plot(10,2,'rX', 'MarkerSize', 60)
        slot9 = 'Filled';
        n=n+1;
        
    elseif userInput1 == 'nine'
        delete(slotLabel9Text)
        plot(10,2,'rX', 'MarkerSize', 60)
        slot9 = 'Filled';
        n=n+1;
    
    end
end
  end
end
