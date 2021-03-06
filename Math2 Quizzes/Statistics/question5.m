%Last Updated: 17/09/2015
%Created By: Avinash Javaji under supervision of Dr. Pilar Garcia Souto
%UCL Department: Medical Physics and Bioengineering

file=fopen('question5.xml','w'); 
fprintf(file, quiz_start()); %xml initialization code

for i=1:1:100
    
    %Calculations
    B_n = randi([2,10]);
    B_p = randi([1,18]) / 20;
    P_mu = randi([10, 100]) / 10;
    H_n = randi([5,20]);
    H_N = randi([15,25]);
    H_M = randi([2,10]);
    
    B_mean = B_n * B_p;
    B_vari = B_n * B_p * (1 - B_p);
    P_mean = P_mu;
    P_vari = P_mu;
    H_mean = H_n * H_M / H_N;
    H_vari = H_n * H_M * (H_N - H_M) * (H_N - H_n) / ((H_N^2) * (H_N - 1));
    
    %fprintf('N: %d, mean: %d, s: %d, fromVal: %d, toVal: %d', n, mean, s, fromVal, toVal);
    
    %Embedded components string generation
    numStringBMean = cloze_numerical(B_mean, 0.01, 'Good job!', 'Incorrect, try again', 3, 6);
    numStringBVari = cloze_numerical(B_vari, 0.01, 'Good job!', 'Incorrect, try again', 3, 6);
    numStringPMean = cloze_numerical(P_mean, 0.01, 'Good job!', 'Incorrect, try again', 3, 6);
    numStringPVari = cloze_numerical(P_vari, 0.01, 'Good job!', 'Incorrect, try again', 3, 6);
    numStringHMean = cloze_numerical(H_mean, 0.01, 'Good job!', 'Incorrect, try again', 3, 6);
    numStringHVari = cloze_numerical(H_vari, 0.01, 'Good job!', 'Incorrect, try again', 3, 6);
    %numStringTo = cloze_numerical(sprintf('%0.4g', toVal), 0.01, 'Good job!', 'Incorrect, try again');
    
    %Question string joining
    questionString = strcat( ...
        'Calculate the mean and variance of the following distributions:<br><br>', ...
        'a) Binomial distribution with n =&nbsp;', num2str(B_n),' and p =&nbsp;', num2str(B_p),'<br>', ...
        '<table><tr><td>Mean:  </td><td>', numStringBMean, '</td></tr>', ...
        '<tr><td>Variance:&nbsp;&nbsp;&nbsp;</td><td>', numStringBVari, '</td></tr></table><br><br>', ...
        'b) Poisson distribution with &mu; =&nbsp;', num2str(P_mu),'<br>', ...
        '<table><tr><td>Mean:  </td><td>', numStringPMean, '</td></tr>', ...
        '<tr><td>Variance:&nbsp;&nbsp;&nbsp;</td><td>', numStringPVari, '</td></tr></table><br><br>', ...
        'Hypergeometic distribution with n =&nbsp;', num2str(H_n),',  N =&nbsp;', num2str(H_N),', and M =&nbsp;', num2str(H_M),'.<br>', ...
        '<table><tr><td>Mean:&nbsp;&nbsp;&nbsp;</td><td>', numStringHMean, '</td></tr>', ...
        '<tr><td>Variance:&nbsp;&nbsp;&nbsp;</td><td>', numStringHVari, '</td></tr></table><br><br>', ...
        '<p style="font-size: 0px">$$</p>' ... This causes the latex to be non/image, hence much clearer
    );

    feedbackString = strcat( ...
        'a) For a binomial distribution, we have q = 1 - p =&nbsp;', num2str(1-B_p), ...
        '.&nbsp;Hence &mu; = np =&nbsp;', num2str(B_mean), ' and &sigma;<sup>2</sup> = npq =&nbsp;', num2str(B_vari), '.<br><br>', ...
        'b) For a Poisson distribution &sigma;<sup>2</sup> = &mu; =&nbsp;', num2str(P_mean), '.<br><br>', ...
        'c) For a hypergeometric distribution,<br>', ...
        '$$ \\Large \\mu = n\\frac{M}{N}$$ =&nbsp;', num2str(H_mean), '<br>', ...
        '$$ \\Large \\sigma^2 = \\frac{nM(N - M)(N - n)}{N^2(N-1)} = \\frac', ...
        '{', num2str(H_n),' \\times ', num2str(H_M), ' \\times ', num2str(H_N-H_M), ' \\times ', num2str(H_N - H_n), '}', ...
        '{', num2str(H_N), '^2 \\times ', num2str(H_N-1), '}$$ =&nbsp;', sprintf('%0.3f', H_vari), ...
        '<p style="font-size: 0px">$$</p>' ... This causes the latex to be non/image, hence much clearer
    );
    
    %Complete question XML code generation
    xmlCode = question_cloze(i, ...
        'Descrete Stats Q2', ... 
        questionString, ...
        feedbackString, ...
        '', ...
        '', ...
        '', ...
        '');
    
    %Output
    fprintf(file, xmlCode);
    
end
fprintf(file, quiz_end()); %xml closing code
fclose(file);