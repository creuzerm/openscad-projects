handleWidth = 30;
handleLength = 75;
thinBit = 9;
thickBit = 22;
shaftDiameter = 11;
shaftLength = 29;
shaftOffset = 17;
scewDiameter = 2;

edging = 1;

$fn = 15;
rotate([0,90,0])
union()
{
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
		// cut out for making the handle shape
		hull()
		{
			translate([-handleWidth, handleLength/2,thinBit + thickBit-thinBit]) rotate([0,90,0]) cylinder(r=thickBit-thinBit, h=handleWidth * 2);
			translate([-handleWidth/2,-handleLength/2,thinBit]) cube([handleWidth,handleLength,thickBit]);
		}
	}
	// round the edges
	sphere(d=edging); 
}
// The shaft	
translate([0,shaftOffset + 2.5 - shaftDiameter/2,-shaftLength]) 
{
	difference()
	{
		cylinder(d=shaftDiameter, h=shaftLength);
		cylinder(d=scewDiameter, h=shaftLength/2);
	}
}

}