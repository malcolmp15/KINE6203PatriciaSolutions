%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Assignment 1: Matlab Scavenger Hunt and HelloWorld
%
% Submitted by: Patricia Butler
%
% Due: October 8, 2020
%
% Instructions: 

% There are two parts to this assignment. Part 1 deals with using the
% Matlab documentation to answer some questions or perform some tasks. Part
% 2 involves you writing your very first Matlab program!!

% Please write all of your responses in the following .mfile.
% If there are comments after the question (as in question 2) please 
% write your answer inside those comments. If there are not comments
% please write your answer with correct matlab syntax. 
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%% Part 1  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 1. Set the url of the matlab documentation to a variable called helpURL

helpURL = "https://www.mathworks.com/help/matlab/";

% 2. What does the command 'clear all' do?
%
% Answer: Clears the workspace of any defined variables and their saved values. 
%


% 3. What function would you use to take the average of the following
% numbers [1 7 21 32 67 32453]? Store your answer in a variable called
% averageAnswer.

numbers = [1 7 21 32 67 32453];
averageAnswer = mean(numbers);

% 4. What command would you type to see a list of all installed toolboxes?

ver

% 5. What command would return a list of all of the available functions in 
% the image processing toolbox? 

%???
matlab.addons.toolbox.installedToolboxes;


% 6. On the line below figure, write a command to draw a graph of 
% x and y. 


x = linspace(-2*pi,2*pi);
y = sin(x);

figure
  plot(x,y)      %<- command goes here
  title("Problem 6: Graph of x and y"); % Title for graph
        

% 7. Find a function that performs a statistical test you've seen used
% in a journal article (there are many possible answers to this). 

%
% Answer: Paired t-test. The function used is ttest(). This function can
% also be used for a one-sample t-test. To designate it to be used for a
% paired-sample t-test, you need to input two data values as seen below:
%
% ttest(x,y) % Tests null hypothesis that x and y have a mean of 0, are
% normally distributed, and the variance is unknown.
% 
% Example journal article where a paired-test was used: Lower Limb and Trunk Biomechanics After Fatigue in Competitive Female Irish Dancers
% https://www.ncbi.nlm.nih.gov/pmc/articles/PMC5517119/?tool=pmcentrez&report=abstract
%

% 8. What are the 2 major types of loops that MATLAB supports? What is the
% difference between them?

%
% Answer: The 2 major types of loops that MATLAB supports are "for" and
% "while" loops. The major difference between the two if that the "for"
% statements will run for a defined number of times while the "while" loop
% will continue to run for as long as the specified condition remains true.
% 
% "For" loop Matlab page:   https://www.mathworks.com/help/matlab/ref/for.html
% "While" loop Matlab page: https://www.mathworks.com/help/matlab/ref/while.html
% 


% 9. What does NaN stand for? Give an example of when you would get NaN as
% an answer. 

%
% Answer: Nan stands for "Not a Number". One example of where you would get Nan as an answer is if you tried to solve for 0/0. 
% 


% 10. The following code snippet executes but contains an error (we don't
% get a useful answer). See if you can use the documentation to fix the 
% error to get the sum of the numbers in A. Do not change or remove 
% any of the values in A.

A = [1 2 3 2 1 NaN 1 2 3 NaN];
S = nansum(A);      % Calculating the sum while ignoring NaNs


% 11. I used to love playing the game minesweeper. Is there a way that I
% could play a similar game on Matlab? Write the command that would launch
% the game if so. 


xpbombs  % Command for playing minesweeper


% 12. Create a variable myage and store your age on the day the hurricane is 
% supposed to impact our area in it. Subtract two from the value of the
% variable. Add one to the value of the variable. 

myage = 23;
myage - 2 + 1

% 13. Use the built-in function namelengthmax to find out the maximum number of
% characters that you can have in an identifier name under your version of
% MATLAB. Store the value in a variable called myMaxNameLength

myMaxNameLength = namelengthmax;

% 14. Create two variables to store a weight in pounds and ounces. Use who and whos
% to see the variables. Clear one of them and then use who and whos again.

weight_pounds = 3; 
weight_ounces = 3;

who         % Displays variables used in this script
whos        % Displays the names, sizes, bytes, class, and attributes of each variable used in this script

clear weight_pounds

who         % Displays variables used in this script
whos        % Displays the names, sizes, bytes, class, and attributes of each variable used in this script

% 15. Store a number with a decimal place in a double variable (the default). Convert the
% variable to the type int32 and store the result in a new variable (hint: this is known
% as casting in computer programming).

double_variable = 100.1;
int32_variable = int32(double_variable);

% 16. Create a variable called pounds to store a weight in pounds. Convert this to 
% kilograms and assign the result to a variable kilos.

pounds = 3;                  % Weight in pounds
kilos  = pounds * 0.453592;  % Weight in kilograms

% 18. Create a variable fTemp to store a temperature in degrees Fahrenheit (F). 
% Convert this to degrees Celsius (C) and store the result in a variable cTemp.

fTemp = 32;                  % Degrees in Fahrenheit
cTemp = (fTemp-32) * 5/9;    % Degrees in Celsius

% 19. Using the colon operator, create the following row vectors:
% 2 3 4 5 6 7 
% 1.1000 1.3000 1.5000 1.7000 
% 8 6 4 2
% Store your results with variable names vecA, vecB and vecC respectively.



vecA = [2:7];                    % Row vector going from 2 to 7 in increments of 1
vecB = [1.1000:0.2000:1.7000];   % Row vector going from 1.1000 to 1.7000 in increments of 0.2000
vecC = [8:-2:2];                 % Row vector going from 8 to 2 in increments of -2


% 20. Give the MATLAB expression that would create a vector 
% (in a variable called vec) of 50 elements that range, equally spaced, 
% from 0 to 2pi:

vec = linspace(0,2*pi,50);   % Creating a vector from 0 to 2pi spanning 50 elements

% 21. Using the colon operator and the transpose operator, 
% create a column vector that has the values -1 to 1 in steps of 0.5.

row_vector = [-1:0.5:1];        % Row vector from -1 to 1 in increments of 0.5
column_vector = row_vector.';    % Transposing row vector to become a column vector

% 22. Create a variable called rows that is a random integer in the inclusive range 
% from 1 to 5. Create a variable called cols that is a random integer in the 
% inclusive range from 1 to 5. Create a matrix called result of all zeros with the 
% dimensions given by the values of rows and cols. 

rows = randi(5,1);
cols = randi(5,1);
result = zeros(rows,cols);

% 23. Create a vector of five random integers, each in the inclusive range 
% from -10 to 10. Perform each of the following and store your results in 
% appropriately named variables. (you should have a seperate line of code for each):
% - subtract 3 from each element n
% - count how many are positive
% - get the absolute value of each element
% - find the maximum.


random_integer_vector = [randi([-10,10],1), randi([-10,10],1), randi([-10,10],1), randi([-10,10],1), randi([-10,10],1)];
random_integer_vector_minus_3 = random_integer_vector - 3;
random_integer_vector_minus_3_positive = length(find(random_integer_vector_minus_3>0));
random_integer_vector_minus_3_absolute_value = abs(random_integer_vector_minus_3);
random_integer_vector_minus_3_maximum = max(random_integer_vector_minus_3);


% 24. Write some code that will calculate the area of a trapezoid. Create
% variables for base1, base2, and height and assign them values. Store the
% result of your calculation in a variable called trapArea. Comment your
% code so that another user can understand what your code does. 

%%% Solving for the area of a trapezoid %%%

%Defining Variables
base1 = 5;  % Defining value for the upper base of the trapezoid
base2 = 10; % Defining value for the lower base of the trapezoid
height = 7; % Defining value for the height of the trapezoid

% Calculating area of the trapezoid
trapArea = ((base1 + base2)/2) * height;

% 25. In biomechanics, a vector is a set of numbers that indicate 
% both magnitude and direction. Units such as velocity and force are vector 
% quantities. An example of a vector could be <2.34, 4.244, 5.323> meters/second. 
% This vector describes the velocity of an object at a certain point in 
% three-dimensional space, <x,y,z>. In solving problems related to vectors, 
% it is handy to know the unit vector of a certain measurement. 
% A unit vector is a vector that has a certain direction, but a magnitude of 1.
% The equation for a unit vector in three-dimensional space is:

% u = <x,y,z>/sqrt(x^2 + y^2 + z^2)

% Write some code that prompts the user for x, y, and z values, and then 
% calculates the unit vector and stores the value in a variable called
% unitVector. 

x = input('Problem 25: Please input a value for x to solve for the unit vector  ')   % Prompts user to define value of x
y = input('Problem 25: Please input a value for y to solve for the unit vector  ')   % Prompts user to define value of y
z = input('Problem 25: Please input a value for z to solve for the unit vector  ')   % Prompts user to define value of z

unitVector = ([x,y,z])/sqrt( (x^2) + (y^2) + (z^2) );  % Calculating and Saving the unitVector for the x,y,and z values

%%%%%%%%%%%%%%%%%%%%%%%%%%  Part 2: Hello World %%%%%%%%%%%%%%%%%%%%%%%%%%

% Write some code that will print the string 'Hello World' to the screen. 
% There are several ways that you could do this. For an extra challenge, 
% make your program able to take text input from the user and output 
% whatever they input. (For ease of running and executing your solution,
% you should comment all the lines of code from Part 1. Just make sure you
% remove the comments before you submit.) 

%%% Enter the code for your program below this line


 prompt = 'Please type in Hello World   ' % This prompts the user to input text
 user_input = input(prompt, 's');         % This takes what the user input and does not treat it as an expression
 user_input                               % This prints whatever the user input in response to the prompt


%%%%% When you have completed everything, type the following two commands
%%%%% (without comments) into your command window. 

%%% load handel
%%% sound(y, Fs)