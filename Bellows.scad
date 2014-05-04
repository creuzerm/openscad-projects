




bellowPlate();
translate([0,0,1]) difference() {
	bellowPlate();
	scale([0.9,.9,1.1]) bellowPlate();
}



%cube([200, 200, .1], center = true);

module bellowPlate()
{
	hull()
	{
		translate([45,45,0]) cylinder(r=50, h=1);
		translate([-80,-80,0]) rotate([0,0,45]) cube([10, 10, 1], center = true);
	}
}