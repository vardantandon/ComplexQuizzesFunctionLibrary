%Last Updated: 07/09/2015
%Created By: Avinash Javaji under supervision of Dr. Pilar Garcia Souto
%UCL Department: Medical Physics and Bioengineering

file=fopen('question1.xml','w'); 
fprintf(file, quiz_start()); %xml initialization code

for i=1:1:100
    
    %Calculations
    n = randi([1001, 1800]);
    mean = randi([5000, 6000]) / 100;
    s = randi([50, 60]) / 10;
    
    intermediateAnswer = 1.96 * s / sqrt(n);
    fromVal = round(mean - intermediateAnswer, 2);
    toVal = round(mean + intermediateAnswer, 2);
    
    %fprintf('N: %d, mean: %d, s: %d, fromVal: %d, toVal: %d', n, mean, s, fromVal, toVal);
    
    %Plot generation - Question
    clf
    hold on
    
    p = normspec([fromVal,toVal],mean,s / sqrt(n),'inside');
    text(fromVal, -0.3, [num2str(fromVal) ' kmph'], 'Fontsize',10,'VerticalAlignment','top', 'HorizontalAlign', 'center');
    text(toVal, -0.3, [num2str(toVal) ' kmph'], 'Fontsize',10,'VerticalAlignment','top', 'HorizontalAlign', 'center');
    text(mean, 1, '95%', 'Fontsize',10,'VerticalAlignment','top', 'HorizontalAlign', 'center');
    
    axis on;
    axis([mean - 2*intermediateAnswer, mean + 2*intermediateAnswer, 0, 4]);
    set(gca, 'Position',[0.12 .16 0.8 0.7], 'YLabel',[], 'XLabel',[]);
    
    hold off;
    plotStringFeedback = generateImageString(gcf, 'imageFeedback');
    
    %Embedded components string generation
    numStringFrom = cloze_numerical(sprintf('%0.4g', fromVal), 0.01, 'Good job!', 'Incorrect, try again');
    numStringTo = cloze_numerical(sprintf('%0.4g', toVal), 0.01, 'Good job!', 'Incorrect, try again');
    
    %Question string joining
    questionString = strcat('A traffic engineer collected&nbsp;', num2str(n), ' samples of vehicle speeds. It is found that the mean speed is&nbsp;', sprintf('%0.4g', mean), ' kmph while the standard deviation is&nbsp;', sprintf('%0.2g', s), ' kmph. Assuming that the speed follow normal distribution, construct the 95%% confidence interval on speed.<br>', ...
        '<br><br>Answer (to 2 d.p.): <br>There is a 95%% chance that the <i>true</i> value of mean speed lies between&nbsp;', numStringFrom, '&nbsp;and&nbsp;', numStringTo, '.');
    
    feedbackString = '<img src="@@PLUGINFILE@@/imageFeedback.png" style="width:100%%; height:auto;"><br><br>The 95%% C.I. can be determined as<br><br>';
    feedbackString = strcat(feedbackString, '$$ \\small x \\pm 1.96 \\frac{\\sigma}{\\sqrt{n}} = ', sprintf('%0.4g', mean), ' \\pm 1.96 \\frac{', sprintf('%0.2g', s), '}{\\sqrt{', num2str(n), '}} = [', sprintf('%0.4g', fromVal), ', ', sprintf('%0.4g', toVal), ']$$');
    feedbackString = strcat(feedbackString, '<br><br>The result indicates that there is a 95%% chance that the <i>true</i> value of mean speed lies within [', sprintf('%0.4g', fromVal), ',&nbsp;', sprintf('%0.4g', toVal), '].');
    
    %Complete question XML code generation
    xmlCode = question_cloze(i, ...
        'Mean Speed range 2', ... 
        questionString, ...
        feedbackString, ...
        '', ...
        '', ...
        '', ...
        plotStringFeedback);
    
    %Output
    fprintf(file, xmlCode);
    
end
fprintf(file, quiz_end()); %xml closing code
fclose(file);