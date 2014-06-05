SodaBottleOD = 65;
PlateOD = SodaBottleOD * 1.5 + 6 ; //80;

difference()
{
	cylinder(d=PlateOD, h=1);
	//center spindle
	cylinder(d=3, h=10, $fn = 60);
}

translate([SodaBottleOD/4,0,0]) bottleBracket();
translate([-SodaBottleOD/4,0,0]) rotate([0,0,180]) bottleBracket();



module bottleBracket()
{
	difference()
	{
		// outer edge
		hull()
		{
			cylinder(d=SodaBottleOD + 2, h=10);
			cylinder(d=SodaBottleOD + 6, h=1);
		}
		//inner edge
		hull()
		{
			cylinder(d=SodaBottleOD - 6, h=10);
			translate([0,0,10]) cylinder(d=SodaBottleOD - 2, h=1);
		}
		bottle();
		translate([-SodaBottleOD, 0, 0]) cube(SodaBottleOD*2, SodaBottleOD*2, 10);
		

	}
}

module bottle()
{
	difference()
	{
		cylinder(d=SodaBottleOD + .5, h=10);
		cylinder(d=SodaBottleOD - .5, h=10);
	}
}
