%Cloze numerical answer code generator - produces the code for a
%numerical answer box
%answer - number: correct answer
%error - number: acceptable error
%rightFeedback - string: correct answer feedback
%wrongFeedback - string: wrong answer feedback
%dp - OPTIONAL, number of decimal points to round the expected answer to
%length - Min width of text box in number of characters
%Last Updated: 21/07/2015
%Created By: Avinash Javaji under supervision of Dr. Pilar Garcia Souto

function finalStr = cloze_numerical(answer, error, rightFeedback, wrongFeedback, dp, length)

    
    if nargin == 7
        lengthString = ['~%0%' num2str(10^length - 1) ':0'];
        finalStr = strcat('{1:NUMERICAL:=', sprintf(strcat('%0.', num2str(dp), 'f'), answer), ':', num2str(error), lengthString, '#', rightFeedback, '!~*#', wrongFeedback, '}');
    elseif nargin == 6
        finalStr = strcat('{1:NUMERICAL:=', sprintf(strcat('%0.', num2str(dp), 'f'), answer), ':', num2str(error), '#', rightFeedback, '!~*#', wrongFeedback, '}');
    else
        finalStr = strcat('{1:NUMERICAL:=', num2str(answer), ':', num2str(error), '#', rightFeedback, '!~*#', wrongFeedback, '}');
    end
end