InsideLength  = 89;
InsideWidth   = 51;
Thickness     = 5;
Wall          = 10;
tolerance     = 1;
RivitHole     = 3.5;
StitchingHole = 1.75;

$fn = 60;


difference()
{
    // outside
    hull () // rounded corners
    {
         // place 4 circles in the corners, with the given diameter
        translate([InsideLength + tolerance + (Wall/2) , Wall/2, 0])
        cylinder(d=Wall, h=Thickness);

        translate([Wall/2, Wall/2, 0])
        cylinder(d=Wall, h=Thickness);

        translate([Wall/2, InsideWidth + Wall + tolerance + tolerance + (Wall/2), 0])
        cylinder(d=Wall, h=Thickness);

        translate([InsideLength + tolerance + (Wall/2), InsideWidth + Wall + tolerance + tolerance + (Wall/2), 0])
        cylinder(d=Wall, h=Thickness); 
    }
    
    //inside
translate([Wall, Wall, 0]) cube([InsideLength + tolerance, InsideWidth + tolerance + tolerance, Thickness]);
    
    //Rivit holes
    translate([InsideLength + tolerance + (Wall/2) , Wall/2, 0]) cylinder(d=RivitHole, h=Thickness);
    translate([Wall/2, Wall/2, 0]) cylinder(d=RivitHole, h=Thickness);
    translate([Wall/2, InsideWidth + Wall + tolerance + tolerance + (Wall/2), 0]) cylinder(d=RivitHole, h=Thickness);
    translate([InsideLength + tolerance + (Wall/2), InsideWidth + Wall + tolerance + tolerance + (Wall/2), 0]) cylinder(d=RivitHole, h=Thickness);
    
    
    // stitching holes
    for ( i = [0 : InsideLength/4 - 2] )
    {
    translate([i*4 + Wall , Wall/2,0]) cylinder(d = StitchingHole, h=Thickness);
    } 
   
   for ( i = [0 : InsideLength/4 - 2] )
    {
    translate([i*4 + Wall , InsideWidth + Wall + tolerance + tolerance + Wall/2,0]) cylinder(d = StitchingHole, h=Thickness);
    }  
    
    for ( i = [0 : InsideWidth/4 + 1] )
    {
    translate([Wall/2 , i*4 + Wall + .5 ,0]) cylinder(d = StitchingHole, h=Thickness);
    }  
}