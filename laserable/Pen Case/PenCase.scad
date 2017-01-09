// 14 x 6.5cm


width = 65;
length = 140;
BigRadius = 25;
LittleRadius = 15;
NeedleHoleSize = 1;

//% square([140,65]);


difference(){
    body();
    NarrowSideStitchHoles();
    LongSideStitchHoles();
    CornerStitchHoles();

}



module body()
{
    hull()
    {
        translate([LittleRadius,LittleRadius]) circle(r=LittleRadius);
        translate([LittleRadius,width-LittleRadius]) circle(r=LittleRadius);
        translate([length-BigRadius,BigRadius]) circle(r=BigRadius);
        translate([length-BigRadius,width-BigRadius]) circle(r=BigRadius);
    }
}

module NarrowSideStitchHoles()
{
    centeringfactor = .5;
    for(i=[LittleRadius:2:width-LittleRadius])
    {
        translate([2, i + centeringfactor]) circle(d=NeedleHoleSize, $fn=60);
    }

}



module LongSideStitchHoles()
{
    for(i=[LittleRadius:2:length-BigRadius])
    {
        translate([i, 2]) circle(d=NeedleHoleSize, $fn=60);
        translate([i, width-2]) circle(d=NeedleHoleSize, $fn=60);
    }

}

module CornerStitchHoles()
{
    //create Quarter circle pattern    
        for (i=[180:10:270]) {
            //theta is degrees set by for loop from 0 to 360 (degrees)
            theta=i;
            //this sets the x axis point based on the COS of the theta
            x=0+((LittleRadius-2))*cos(theta);
            //this sets the y axis point based on the sin of the theta
            y=0+((LittleRadius-2))*sin(theta);
            //this creates the circle or other obect at the x,y point
            translate([LittleRadius+x,LittleRadius+y,0])circle(d=NeedleHoleSize,$fn=60);
        }//end for loop for circle creation


   //create Quarter circle pattern    
        for (i=[90:10:180]) {
            //theta is degrees set by for loop from 0 to 360 (degrees)
            theta=i;
            //this sets the x axis point based on the COS of the theta
            x=0+((LittleRadius-2))*cos(theta);
            //this sets the y axis point based on the sin of the theta
            y=0+((LittleRadius-2))*sin(theta);
            //this creates the circle or other obect at the x,y point
            translate([LittleRadius+x,width-LittleRadius+y,0])circle(d=NeedleHoleSize,$fn=60);
        }//end for loop for circle creation
}
