function [ifTriangle] = triangleTest(array)
% This function takes a single array of three numbers and returns a logical value, 1 or 0,
% to indicate whether the three numbers in the array are representative of a
% valid triangle. An output of 1 indicates that the numbers are
% representative of a valid triangle and an output of 0 indicates that the
% numbers do not represent a valid triangle.

% Determining the largest number in the array
maxLength = max(array);

% Determining if the sum of the two smaller sides are larger than the longer side
if maxLength == array(1)                % If the first value in the array is the largest
    if array(2) + array(3) > array(1)   % If the sum of the two smaller sides is larger than the longest side
        ifTriangle = true;              % It is a valid triangle
    else
        ifTriangle = false;             % It is not a valid triangle
    end
elseif maxLength == array(2)            % If the second value in the array is the largest
    if array(1) + array(3) > array(2)   % If the sum of the two smaller sides is larger than the longest side
        ifTriangle = true;              % It is a valid triangle
    else
        ifTriangle = false;             % It is not a valid triangle
    end
else                                    % If the third value in the array is the largest number
    if array(1) + array(2) > array(3)   % If the sum of the two smaller sides is larger than the longest side
        ifTriangle = true;              % It is a valid triangle
    else
        ifTriangle = false;             % It is not a valid triangle
    end
    
end

