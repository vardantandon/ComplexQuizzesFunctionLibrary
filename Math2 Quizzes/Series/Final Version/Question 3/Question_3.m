%Series Question 3 - Error approximation
%Authored By: Vardan Tandon under supervision of Dr. Pilar Garcia Souto
%UCL Department: Medical Physics and Bioengineering

file = fopen('Question_3.xml', 'w');

%xml initialization code
fprintf(file,quiz_start());

for i=1:1:100

%Calculations
a = randi([5 12],1,1)
    
for j = 0:0.1:50
    radAngle = degtorad(j);
    if (ge(abs(round(((sin(radAngle)-radAngle)/sin(radAngle))*100,2)), a-0.05) && le(abs(round(((sin(radAngle)-radAngle)/sin(radAngle))*100,2)),a+0.05))
        break
    end    
end

angleInDegrees = radtodeg(radAngle)
ans = round(angleInDegrees)

%Embedded components string generation
numString = cloze_numerical(ans, 1 , 'Good job!', 'Incorrect, try again');

%Question string joining
questionString = strcat('The Maclaurin expansion for sin($$\\small\\theta$$) provides a "small angle" ',...
    ' approximation: sin($$\\small\\theta$$) $$\\small\\approx$$ $$\\small\\theta$$.<br> What is the smallest positive angle',...
    ' at which this approximation gives and error of&nbsp;',num2str(a),'$$\\small\\%%$$<br>Express your answer', ...
 ' to the nearest degree.<br><br>Answer : <br>', numString);
 
%Feedback string joining
feedbackString = strcat('The error for $$\\small \\theta$$ is given by : <br><br>','=> $$\\small \\frac{| Expected','&nbsp;','Value - Approximate','&nbsp;','Value |}{Expected','&nbsp;','Value}$$ x 100%%<br>',...
                         '=> $$\\small \\frac{sin(\\theta) - \\theta}{sin(\\theta)}$$ x 100%%<br><br>',...
                         'Trying with various numbers, you can approximate the solution &nbsp;',num2str(a),'%% at&nbsp;','$$\\small \\theta$$&nbsp;$$\\small \\approx$$&nbsp;',num2str(radAngle),' radians or',...
                         ' about&nbsp;',num2str(angleInDegrees),' degrees.<br>','Smallest positive angle =&nbsp;',num2str(ans),' degrees.');

%Complete question XML code generation
xmlCode = question_cloze(i, ...
        'Error approximation', ... 
        questionString, ...
        feedbackString, ...
        '');

fprintf(file, xmlCode);

end

%xml closing code
fprintf(file, quiz_end());
fclose(file);
