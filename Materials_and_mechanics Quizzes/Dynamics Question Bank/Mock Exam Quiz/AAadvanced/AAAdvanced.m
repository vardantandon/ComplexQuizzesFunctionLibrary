file=fopen('AA-Advanced.xml','w'); 
fprintf(file, quiz_start()); %xml initialization code

for i=1:1:100
    
ID=strcat(num2str(i));

IDString=strcat('AA-Advanced. Question ID #', ID);
        
    
    V=randi([10,20]);
    T=randi([5,15]);
    R=randi([20,40]);
    r=R/100;
    A=V/(r*T);
    S=(V*V)/0.49;
    KE=500*V*V;
    E=0.5*V*V;
    U=E/196;

  
numString1 = cloze_numerical((round(A*10)/10), 0.05, 'Good job!', 'Incorrect, try again');
numString2 = cloze_numerical(round(S), 0.5, 'Good job!', 'Incorrect, try again');
numString3 = cloze_numerical(E, 1, 'Good job!', 'Incorrect, try again');
numString4 = cloze_numerical(round(U*100)/100, 0.005, 'Good job!', 'Incorrect, try again');


questionString = strcat('<p>A 1,000 kg car accelerates from rest to a linear velocity, $$V$$, of&nbsp',num2str(V),' m/s over a time, $$t$$, of&nbsp',num2str(T),' s. Its wheels have a radius, $$r$$, of&nbsp',num2str(R),' cm.',...
    '<p><br></p><img src="http://s8.postimg.org/mcqvd2s2t/car.jpg" alt="" width="677" height="621" role="presentation" style="vertical-align:middle; margin: 0 .5em;" class="img-responsive"><br></p>',...
    '<p><b>1. </b>What is the average angular acceleration, $$\\alpha$$ of the wheels?</p>',...
    '<p>(Give your answer correct to 1.d.p.)</p>',...
    '<p>$$\\alpha$$=&nbsp',numString1,' rad/s<sup>2</sup></p>',...
    '<br><p><b>2. </b>The car now enters a curve at a constant speed of&nbsp',num2str(V),' m/s. What is the radius of the curve if the acceleration felt by the passengers is $$0.05g$$?</p><p>($$g$$ is the acceleration due to gravity, and has a value of 9.8 m/s<sup>2</sup>)</p>',...
    '<p>(Give your answer correct to the nearest whole number)</p>',...
    '<p>Radius=&nbsp',numString2,' m</p>',...
    '<br><p><b>3. </b>The car now leaves this curve and applies its brakes until it stops. Calculate the work done by the brakes.</p>',...
    '<p>(Give your answer correct to 3.s.f.)</p>',...
    '<p>Work Done=&nbsp',numString3,' kJ</p>',...
    '<br><p><b>4. </b>If the brakes locked on, instantly stopping the wheels instead of steadily slowing them, then the wheels would no longer spin and the car would skid. Assuming a skid in a straight line, what would the coefficient of friction, $$\\mu$$ between the tyres and the road be if the car skidded to a stop over a distance of 20 m on a flat road?</p>',...
    '<p>(Give your answer correct to 2.d.p.)</p>',...
    '<p>$$\\mu$$=&nbsp',numString4,...
    '<p>(Question ID #',num2str(i),').</p>');

generalFeedbackStr = strcat('<p><b>1. </b>Using the principles that:</p><p>Angular acceleration, $$\\alpha =\\frac{\\Delta \\omega }{\\Delta t}$$,</p><p>and</p>',...
       '<p>Linear velocity, $$V=r.\\omega$$,</p><p>gives:</p><p>Angular acceleration, $$\\alpha=\\frac{V }{r.\\Delta t}=',...
       '\\frac{',num2str(V),' }{',num2str(r),'\\times ',num2str(T),'}=',num2str(round(A*10)/10),'$$ rad/s<sup>2</sup>.</p>',...
       '<p><br></p><p><b>2. </b>Recall that radial acceleration, $$a_r=\\frac{V^2}{r}$$, therefore:</p>',...
       '<p>$$r=\\frac{V^2}{a_r}=\\frac{',num2str(V),'^2 }{0.05\\times 9.8 }=',num2str(round(S)),'$$ m.</p>',...
       '<p>The image below may aid your understanding of this concept.</p>',...
       '<p><img src="http://s12.postimg.org/fdmv8nh3x/image.gif" alt="" width="336" height="217" role="presentation" style="vertical-align:middle; margin: 0 .5em;" class="img-responsive"><br></p>',...
       '<p><br></p><p><b>3. </b>The work done by friction between the tyres and the road to stop the car is equal to the kinetic energy of the car before the brakes are applied, which is equal to:</p>',...
       '<p>$$KE=\\frac{1}{2}.m.v^2=\\frac{1}{2}\\times 1000\\times ',num2str(V),'^2=',num2str(KE),'$$ J.</p>',...
       '<p><br></p><p><b>4. </b>This work done is equal to the frictional force between the tyres and the road mulitpled by the distance over which it is applied, $$(W=F.d)$$, where the frictional force is equal to the coefficient of friction multiplied by the weight of the vehicle, $$(F=\\mu.m.g)$$.</p>',...
       '<p>Therefore:</p><p>$$',num2str(KE),'=\\mu\\times 1000\\times g\\times 20$$,</p><p>Rearranging gives $$\\mu=\\frac{',num2str(KE),' }{1000\\times g\\times 20 }=',num2str(round(U*100)/100),'$$',...
     '<p>---------------------------------------------------------------------------------------------------------------------</p>',...
     '<p>Image 1 adapted from ''http://cnx.org/resources/2db245455f0c5576ad069588fd2b3e1e''</p>',...
         '<p>Image 2 adapted from ''http://hyperphysics.phy-astr.gsu.edu/hbase/images2/cf.gif''</p>');
   
hint1 = strcat('<b>HINT</b><p>Recall the relationship between angular velocity and linear velocity, and the relationship between angular velocity and angular acceleration.</p>',...
    '<p>Recall the relationship between radial acceleration and linear velocity.</p>',...
    '<p>Remember that work done = change in kinetic energy, and assume that this work is done solely by friction.');

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
