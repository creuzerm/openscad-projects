shortLength = 74;
longLength = 85;
width = 10;
height = 16;
$fn = 60;

mirror()
difference()
{
    Shell();
    for ( i = [0 : longLength/3] )
    {
    translate([i*3+2, width-3, -shortLength/2]) cylinder(d = 1.6, h=shortLength);
    }  
    
    translate([shortLength-width , width/3, -shortLength/2]) cylinder(d = 3, h=shortLength);
    
    %translate([longLength-37,0,height/2+1]) rotate([0,90,0]) cylinder(d = 3.5, h=37);

}


module Shell()
{
    // The Shell
    minkowski()
    {
        hull()
        {
        translate([1,1,1]) cube([shortLength-2,width-2,height-2]);
        difference() // roundedish top
            {
                translate([shortLength,0,height/2]) rotate([90,0,0]) sphere(d=height-2);
                translate([1,-width+1,1]) cube([longLength+height,width,height]);

            }
        translate([1,1,1]) cube([longLength-2,width-2,.1]);
        }
    sphere(h=1);
    }


    //The footprint
    %hull()
    {
    cube([shortLength,width,height]);
    cube([longLength,width,.1]);
    }
}


