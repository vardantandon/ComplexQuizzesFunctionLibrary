%Last Updated: 10/07/2015
%Authored By: Avinash Javaji under supervision of Dr. Pilar Garcia Souto
%UCL Department: Medical Physics and Bioengineering

file=fopen('question1.xml','w'); 
fprintf(file, quiz_start()); %xml initialization code

for i=1:1:10
    
    %Calculations
    period_1 = randi([1, 2]);
    period_2 = randi([10, 15]);
    amp_1 = 0.5;
    amp_2 = 2;
    
    t = 0:0.01:2*period_2;
    y = amp_1 * sin(t * 2 * pi/period_1) + amp_2 * sin(t * 2 * pi/period_2);
    
    %Plot generation
    
    plotVar = plot(t, y);
    hold on
    
    plot([0,2*period_2],[0,0],'Color','black','linewidth',1);
    
    axis([0 2*period_2 -(amp_1+amp_2) (amp_1+amp_2)]);
    set(gca,'FontSize',20);
    set(findall(gcf,'type','text'),'FontSize',30,'fontWeight','bold');    
    axis on
    
    grid(gca,'minor') 
    set(gca,'MinorGridLineStyle','-')
    grid on
    
    clear title xlabel ylabel;
    
    xlabel_string='t(seconds)';
    ylabel_string='s(t)';
    xlabel(xlabel_string);
    ylabel(ylabel_string);

%     text((w/2) - 0.8,-0.4,xlabel,'fontsize',22,'fontweight','bold');
%     text(-1.25,(h/2),ylabel,'fontsize',18,'fontweight','bold');

    hold off;
    
    %Plot string generation
    plotString = generateImageString(plotVar, 'image.jpg');
    
    %Embedded components string generation
    
    numString_higher = cloze_numerical(1/period_1, 0.01, 'Good job!', 'Incorrect');
    numString_lower = cloze_numerical(1/period_2, 0.01, 'Good job!', 'Incorrect');
        
    %Question string joining
    questionString = strcat('A graphical representation of the Fourier transform of the signal s(t) below will exhibit two peaks. Estimate the positions of these peaks on the frequency axis. <br>', ...
        '<br><img src="@@PLUGINFILE@@/image.jpg" style="width:400px; height:auto;"><br><br>Give your answer to 2 d.p.<br>', ...
        'Higher Frequency:&nbsp;', numString_higher, ...
        '<br>Lower Frequency:&nbsp;', numString_lower);
    
    %Complete question XML code generation
    xmlCode = question_cloze(i, ...
        'Fourier transform of Signal', ... 
        questionString, ...
        'Fourier transform of Signal', ...
        plotString);
    
    %Output
    fprintf(file, xmlCode);
    
end
fprintf(file, quiz_end()); %xml closing code
fclose(file);