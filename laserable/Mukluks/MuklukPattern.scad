WidestPart = 110; // Widest Part of foot
Length = 285; //Length of Foot

Rise = 30; // effectivly hight of foot around the toes to the mid point.

LengthOfVamp = 85; // Length of top part of the toe of the shoe. Basically from toe to where your foot starts to rise up to your ankle

SeamAllowance = 5;






foot();









FinalWidth = WidestPart + Rise*2 + SeamAllowance*2;





module foot()
{
    union()
    {
        circle(d= FinalWidth);
        translate([-FinalWidth/2, 0]) square([ FinalWidth , Length - FinalWidth/2]);
        
        translate([-20, Length-(FinalWidth/2)]) square([40, FinalWidth/2]);
        
        translate([21, Length-(FinalWidth/2)]) square([FinalWidth/2 - 21, 20]);
        translate([-FinalWidth/2 , Length-(FinalWidth/2)]) square([FinalWidth/2 - 21, 20]);

    }
}