classdef (ConstructOnLoad) ArrayOperations
    % ArrayOperations is a class based on doing logical operations
    % on 1 x N matrices or arrays.
    % Static Methods:
    % shiftCheck
    % arrayShift
    % arrayXor
    methods(Static = true)
        
        function [summ, xored] = shiftCheck(shiftThis, checkThis, shiftAmount)
            % Inputs:
            % shiftThis = matrix to be shifted
            % checkThis = matrix to have shiftThis checked against
            % shiftAmount = amount shiftThis will be shifted
            % Outputs:
            % summ = sum of array containing XOR'd result of input arrays
            % xored = array containing result of logical xor per element

            if length(shiftThis) == length(checkThis)
                if shiftAmount > 0 % shift left
                    newStrt = 1;
                    newEnd = length(shiftThis) - shiftAmount;
                elseif shiftAmount < 0% shift right
                    newStrt = 1 + abs(shiftAmount); % add 1 because matrix start at 1
                    newEnd = length(shiftThis);
                else
                    newStrt = 1;
                    newEnd = length(shiftThis);
                end

                shft = ArrayOperations.arrayShift(shiftThis, shiftAmount);
                xored = ArrayOperations.arrayXor(shft(newStrt:newEnd), checkThis(newStrt:newEnd));
                summ = sum(xored);
            else
                disp('Matrix length mismatch');
            end
        end
        
        function sArr = arrayShift(array, shft)
            % Inputs:
            % array = array to shift
            % shft = the amount of which to shift array
            % -shft = right shift
            % +shft = left shift
            % Outputs:
            % sArr = shifted array, fills empty spots with 0's

            sArr = zeros(1,length(array));

            if shft > 0 % left shift - works
                for i = 1:length(array)
                    if i > length(array)-shft
                        sArr(i) = 0;
                    else
                        sArr(i) = array(i+shft);
                    end
                end
            elseif shft < 0 % right shift - works
                j = length(array);
                for i = 1:length(array)
                    if j <= abs(shft)
                        sArr(j) = 0;
                    else
                        sArr(j) = array(j-abs(shft));
                    end
                    j = j - 1;
                end
            else
                sArr = array;
            end
        end

        function xored = arrayXor(arr1, arr2)
            % Inputs:
            % arr1 = first array to be evaluated
            % arr2 = second array to be evaluated
            % Outputs:
            % xored = array containing result of logical xor per element

            if length(arr1) == length(arr2)
                for i = 1:length(arr1)
                    if arr1(i) == arr2(i)
                        xored(i) = 0;
                    else
                        xored(i) = 1;
                    end
                end
            else
                xored = 0;
                disp('Array size mismatch');
            end
        end
                
    end
end
