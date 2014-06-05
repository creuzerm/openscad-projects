handleWidth = 30;
handleLength = 75;
thinBit = 9;
thickBit = 22;
shaftDiameter = 11;
shaftLength = 29;
shaftOffset = 17;

edging = 1;

$fn = 6;

minkowski()
{
difference()
{
	hull()
	{
		translate([handleWidth/2 - 2.5,0,0]) cylinder(d=5, h=22);
		translate([-handleWidth/2 + 2.5,0,0]) cylinder(d=5, h=22);
		translate([0,handleLength - 5,0]) cylinder(d=5, h=22);
	}
	hull()
	{
		translate([-handleWidth, handleLength/2,thinBit + thickBit-thinBit]) rotate([0,90,0]) cylinder(r=thickBit-thinBit, h=handleWidth * 2);
		translate([-handleWidth/2,-handleLength/2,thinBit]) cube([handleWidth,handleLength,thickBit]);
	}
}
sphere(d=edging);
}