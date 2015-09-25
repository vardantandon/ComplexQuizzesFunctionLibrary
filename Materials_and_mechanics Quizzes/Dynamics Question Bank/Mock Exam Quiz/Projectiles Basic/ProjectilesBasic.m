file=fopen('Projectiles-Basic.xml','w'); 
fprintf(file, quiz_start()); %xml initialization code

for i=1:1:100
    
ID=strcat(num2str(i));

IDString=strcat('Projectiles-Basic. Question ID #', ID);

% assigning random variables

       v=randi([30,60]);
       angle=randi([30,60]);

%      calculations
       u=v*sind(angle);
       t=u/9.8;
       s=(u*t)-(0.5*9.8*t.^2);
       u1=v*cosd(angle);
       s1=u1*2*t;
           
numString1 = cloze_numerical((round(s*10)/10), 0.05, 'Good job!', 'Incorrect, try again');
numString2 = cloze_numerical((round(s1*10)/10), 0.05, 'Good job!', 'Incorrect, try again');


questionString = strcat('<p>A tennis ball is projected at an angle $$\\phi$$ of &nbsp', num2str(angle),' degrees from horizontal at an initial velocity of &nbsp',num2str(v),' m/s, as per the image below.</p>',...
    '<p>What is the maximum height (H), that the tennis ball reaches?</p>',...
        numString1,' m',...
    '<p>What is the horizontal range (R) that the tennis ball will travel before hitting the ground?</p>',...
        numString2,' m',...
    '<p>(Give your answer correct to 1.d.p.)</p>',...
    '<p>(Use a value of g of -9.8 m/s<sup>2</sup>)</p>',...
    '<p><img src="http://s4.postimg.org/id74ho6f1/angularprojectilemotion2.jpg" alt="" width="375" height="126" role="presentation" style="vertical-align:middle; margin: 0 .5em;" class="img-responsive"><br></p><p><br></p>',...
    '<p>(Question ID #',num2str(i),').</p>');

generalFeedbackStr = strcat('<p>First let''s look at the $$y$$ component.</p><p> Final velocity, $$v$$, is zero at the maximum height; initial velocity, $$u$$, is $$',num2str(v),'\\cdot sin(',num2str(angle),')$$',...
        '; acceleration, $$a$$, is equal to the constant, $$g$$.</p>',...
        '<p>Rearranging and applying $$v=u+a\\cdot t$$ gives:</p>',...
        '<p>$$t=(v-u)/a=(0-(',num2str(v),'\\cdot sin(',num2str(angle),'))/-9.8)=',num2str(round(t*10)/10),'$$ s.',...
        '<br><p>Next, applying $$s=u.t+\\frac{1}{2}.a.t^2$$ gives:</p>',...
        '<p>$$h=(',num2str(round(u*10)/10),'\\times ',num2str(round(t*10)/10),')+(0.5\\times -9.8\\times ',num2str(round(t*10)/10),'^2)=',num2str(round(s*10)/10),'$$ m.</p>',...
        '<br><p>Next, let''s look at the $$x$$ component.</p><p> Acceleration, $$a$$, is zero; initial velocity, $$u$$, is $$',num2str(v),'\\cdot cos(',num2str(angle),')$$',...
        '; and the time over which the ball travels before it hits the opponent''s racquet is $$2\\cdot t$$.</p>',...
        '<p>Applying $$s=u.t+\\frac{1}{2}.a.t^2$$ gives:</p>',...
        '<p>$$R=(2\\times ',num2str(v),'\\cdot cos(',num2str(angle),')\\cdot ',num2str(round(t*10)/10),')=',num2str(round(s1*10)/10),'$$ m.</p>',....
        '<p>---------------------------------------------------------------------------------------------------------------------</p>',...
     '<p>Image adapted from '' http://tutor4physics.com/projectilemotion.htm''</p>');

    hint1 = strcat('<b>HINT</b><p>Use the <b>SUVAT</b> equations of motion on both the $$x$$ and $$y$$ components of the tennis ball''s motion to solve this question.</p>');...

    %Complete question XML code generation
    xmlCode = question_cloze(i, ...
        IDString, ... 
        questionString, ...
        generalFeedbackStr, ...
        hint1,...
        '',...
        '',...
        '',...
        '');
    
    %Output
    fprintf(file, xmlCode);
    
end
fprintf(file, quiz_end()); %xml closing code
fclose(file);