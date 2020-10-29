function doubleVecPlot(vector1,vector2)
% This function takes two vectors and plots them onto a figure. 
% This function also adds a title and axis labels to the figure. 


figure % Generating a figure
title('Plotting Two Vectors'); % Creating a figure title
xlabel('Values of X');         % Creating an x-axis label
ylabel('Values of Y');         % Creating a y-axis label
hold on                        % Allowing for multiple plots to be on the figure

plot(vector1)                  % Plotting first input vector
plot(vector2)                  % Plotting second input vector

end

