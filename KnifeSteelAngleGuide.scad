RodDiameter = 10;


difference()
{
	minkowski()
	{
		hull()
		{
			difference()
			{
				union()
				{
					rotate(a=20, v=[1,0,0]) translate ([0,RodDiameter/2,0]) cube([RodDiameter*1.5,RodDiameter/2,RodDiameter], center=true);
					rotate(a=-20, v=[1,0,0]) translate ([0,-RodDiameter/2,0]) cube([RodDiameter*1.5,RodDiameter/2,RodDiameter], center=true);
				}
				translate([0,0,-RodDiameter*1.25]) cube(RodDiameter*2, RodDiameter*2, RodDiameter*2, center=true);
			}
	
		}
	 sphere(r=2);
	}
cylinder (r=RodDiameter/2, h = 100, center=true);
}