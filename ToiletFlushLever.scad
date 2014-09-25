Width = 10;
Length = 220;
thickness = 5;

shaftDiameter = 11;
shaftLength = 10;

scewDiameter = 2 + 1;

edging = 1;

$fn = 15;

difference()
{
	union()
	{
	cube([Width, Length, thickness]);
	translate([Width/2, shaftDiameter/2, thickness]) cylinder(d=shaftDiameter, h=shaftLength);
	}
// screw hole
	translate([Width/2, shaftDiameter/2, 0]) cylinder(d=scewDiameter, h=shaftLength + thickness);


// create a series of holes 
	for ( i = [2 : Length/Width] )
	{
		hull()
		{
				translate([Width/2, i * 20 + Width/2, 0]) cylinder(d=Width -4, h=shaftLength);		
				translate([Width/2, i * 20 + Width + Width/2, 0]) cylinder(d=Width -4, h=shaftLength);
		}

	}
}