
ThinThickness = 1;
ThickThickness = 3;
Length = 150;
Width = 50;
Handle = 20;
$fn = 60;


difference()
{
	union()
	{
		hull()
		{
			cylinder(r=1, h=ThinThickness);
			translate([Length, 0, 0] ) cylinder(r=1, h=ThinThickness);
			translate([Width/2, Width, 0] ) cylinder(r=1, h=ThickThickness);
			translate([Length - Width/2, Width, 0] ) cylinder(r=1, h=ThickThickness);
		}
		translate([Length/2, Width, 0] ) cylinder(r=Handle, h=ThickThickness);
	}
	translate([Length/2, Width, 0] ) cylinder(d=Handle, h=ThickThickness);
}