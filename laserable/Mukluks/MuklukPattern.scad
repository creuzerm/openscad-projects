WidestPart = 110; // Widest Part of foot
Length = 285; //Length of Foot

Rise = 30; // effectivly hight of foot around the toes to the mid point.

LengthOfVamp = 85; // Length of top part of the toe of the shoe. Basically from toe to where your foot starts to rise up to your ankle

SeamAllowance = 5;
StitchHoles = 2;
StichGap = 2;



foot();



FinalWidth = WidestPart + Rise*2 + SeamAllowance*2;
VampOffset = LengthOfVamp - WidestPart/2;

module foot()
{
    union()
    {
        Toe();
        
        translate([-FinalWidth/2, 0])  MainSection();
        
        translate([-20, Length-(FinalWidth/2) + VampOffset]) HeelTab();
        
        translate([20.1, Length-(FinalWidth/2) + VampOffset]) Heels();
        translate([-FinalWidth/2 , Length-(FinalWidth/2) + VampOffset]) Heels();

    }
}

module HeelTab()
{
   
   difference()
    {
        square([40, FinalWidth/2 - 20]);
        // Long lines
        for(offset = [0 : StitchHoles + StichGap : (FinalWidth/2 -20) - SeamAllowance - SeamAllowance])
        {
            translate([SeamAllowance, offset + SeamAllowance] )  circle(d=StitchHoles,$fn=60);
            translate([20 - SeamAllowance , offset + SeamAllowance] )  circle(d=StitchHoles,$fn=60);
            translate([20 + SeamAllowance, offset + SeamAllowance] )  circle(d=StitchHoles,$fn=60);
            translate([40 - SeamAllowance, offset + SeamAllowance] )  circle(d=StitchHoles,$fn=60);
        }
        // middle holes
        translate([20/2, FinalWidth/2 -20 -SeamAllowance ])  circle(d=StitchHoles,$fn=60);
        translate([20/2, SeamAllowance ])  circle(d=StitchHoles,$fn=60);
        translate([40 - 20/2, FinalWidth/2  -20  -SeamAllowance ])  circle(d=StitchHoles,$fn=60);
        translate([40 - 20/2, SeamAllowance ])  circle(d=StitchHoles,$fn=60);
    }   
}

module Heels()
{
   
   difference()
    {
        square([FinalWidth/2 - 20.1, 20]);
        // Outer line
        for(offset = [0 : StitchHoles + StichGap : (FinalWidth/2) - 20 - SeamAllowance - SeamAllowance])
        {
            translate([offset + SeamAllowance , 20 - SeamAllowance])  circle(d=StitchHoles,$fn=60);
        }
        // Inner Line
        for(offset = [0 : StitchHoles + StichGap : (FinalWidth/2) - 20 - SeamAllowance - SeamAllowance])
        {
            translate([offset + SeamAllowance , SeamAllowance])  circle(d=StitchHoles,$fn=60);
        }
    translate([SeamAllowance , 20/2])  circle(d=StitchHoles);
    translate([FinalWidth/2 -20 -SeamAllowance , 20/2])  circle(d=StitchHoles,$fn=60);

    }   
}

module Toe()
{
    difference()
    {
    circle(d= FinalWidth);
    
    //create Quarter circle pattern    
        for (i=[180:8:360]) {
            //theta is degrees set by for loop from 0 to 360 (degrees)
            theta=i;
            //this sets the x axis point based on the COS of the theta
            x=0+((FinalWidth/2-SeamAllowance))*cos(theta);
            //this sets the y axis point based on the sin of the theta
            y=0+((FinalWidth/2-SeamAllowance))*sin(theta);
            //this creates the circle or other obect at the x,y point
            translate([x,y,0])circle(d=StitchHoles,$fn=60);
        }//end for loop for circle creation
        
        // Lets lop off half the circle
        translate([ -FinalWidth/2, 0]) square([FinalWidth,FinalWidth]);
    }
}

module MainSection()
{
    difference()
    {
        square([ FinalWidth , Length - FinalWidth/2 + VampOffset]);
        
        for(offset = [0 : StitchHoles + StichGap : (Length - FinalWidth/2) -  SeamAllowance - VampOffset - Rise - StichGap])
        {
            translate([SeamAllowance , offset + VampOffset + VampOffset + Rise + SeamAllowance] )  circle(d=StitchHoles,$fn=60);
            translate([FinalWidth - SeamAllowance , offset + VampOffset + VampOffset + Rise + SeamAllowance] )  circle(d=StitchHoles,$fn=60);   
        }
        
        for(offset = [0 : (StitchHoles + StichGap)*3 : VampOffset + Rise + Rise])
        {
            translate([SeamAllowance , offset ] )  circle(d=StitchHoles,$fn=60);
            translate([FinalWidth - SeamAllowance , offset ] )  circle(d=StitchHoles,$fn=60);   
        }
        
    }
    
}