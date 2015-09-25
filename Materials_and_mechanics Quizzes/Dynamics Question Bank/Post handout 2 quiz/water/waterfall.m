file=fopen('Waterfall.xml','w'); 
fprintf(file, quiz_start()); %xml initialization code

for i=1:1:100
    
ID=strcat(num2str(i));

IDString=strcat('Waterfall. Question ID #', ID);

% assigning random variables

       h=randi([50,150]);
       f=randi([3,9])*1000;
       g=9.8;

%      calculations
       v=sqrt(2*g*h);
       p=f*g*h/1000000;
       
numString1 = cloze_numerical((round(v*10)/10), 0.02*v, 'Good job!', 'Incorrect, try again');        
numString2 = cloze_numerical((round(p*10)/10), 0.02*p, 'Good job!', 'Incorrect, try again');


questionString = strcat('<p>Water flows over a waterfall at ~',num2str(f),' m<sup>3</sup> per second, dropping a distance of&nbsp',num2str(h),' m.</p>',...
        '<p><br></p><p><img src="http://s14.postimg.org/v460lm7wh/waterfall.jpg" alt="" width="432" height="650" role="presentation" style="vertical-align:middle; margin: 0 .5em;" class="img-responsive"><br></p><p><br></p>',...
        '<p>Assume a value of $$g$$ = -9.8m/s<sup>2</sup> for the purposes of this question.',...
        '<br><p><b>1.</b> Assuming that all of the potential energy loss of the water is converted to kinetic energy, with what speed is the water moving just before reaching the bottom of the waterfall?</p>',...
        '<p>',numString1,' m/s',....
        '<p><b>2.</b> This time assuming that all of the potential energy loss of the water is converted to electricity, at what rate could electric power be generated from this waterfall?</p>',...
        '<p>',numString2,' GW',....
        '<p>(Please give your answers correct to 1.d.p.)</p>',...
        '<p>(Question ID #',num2str(i),').</p>');
        

generalFeedbackStr = strcat('<p>The amount of gravitational potential energy, $$GPE$$, that water would lose when dropping from the top to the bottom of the waterfall is:</p>',...
    '<p>$$GPE=m.g.h$$</p>',...
    '<p>Where $$m$$ is the mass of the water dropping, $$g$$ is the gravitational constant as given above, and $$h$$ is the height which the water falls through.</p>',...
    '<p>As all of this energy is converted into kinetic energy, $$KE$$, we can then come up with the following expression:</p>',...
    '<p>$$GPE=m.g.h=KE=\\frac{1}{2}.m.v^2$$</p>',...
    '<p>Where $$v$$ is the speed of the water at the bottom of the waterfall.</p>',...
    '<p>This can be rearranged to:</p>',...
    '<p>$$v=\\sqrt{2.g.h}=',num2str(round(v*10)/10),'$$ m/s</p>',...
    '<br><p>As all of the gravitational potential energy at the top of the waterfall is converted into electrical power, the rate of loss of gravitational energy is equal to the rate of production of electrical energy.</p>',...
    '<p>The mass of water, $$m$$, flowing over the waterfall in one second is equal to:</p>',...
    '<p>$$',num2str(f),'\\times 1000=',num2str(f*1000),'$$ kgs/second</p>',...
    '<p>Therefore the rate of production of electrical energy is equal to:<p>',...
    '<p>$$GPE=m.g.h=',num2str(f*1000),'\\times 9.8\\times ',num2str(h),'=',num2str(round(p*10)/10),' GW$$</p>',...
     '<p>---------------------------------------------------------------------------------------------------------------------</p>',...
     '<p>Image adapted from ''https://upload.wikimedia.org/wikipedia/commons/6/60/Jeongbang_Waterfall.jpg''</p>');

   
    hint1 = strcat('<b>HINT</b><p>First form an expression for the potential energy that the water has at the top of the waterfall, and remember that, with the above assumptions, all of this energy will be converted into kinetic energy, and then electrical energy.</p><p>Remember also that one cubic metre of water has a mass of 1,000 kg.</p>');

    %Complete question XML code generation
    xmlCode = question_cloze(i, ...
        IDString, ... 
        questionString, ...
        generalFeedbackStr, ...
        hint1,...
        '',...
        '',...
        '',...
        '',...
        '');
    
    %Output
    fprintf(file, xmlCode);
    
end
fprintf(file, quiz_end()); %xml closing code
fclose(file);