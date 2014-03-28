width = 51.0;
length = 83.0;
thickness = 1.25;


difference()
{
	minkowski()
	{
		difference()
		{
			union()
			{
			 	cube([width, length+13, 5 + thickness], center=true);
				 translate([0, length/2 + 2, 1]) rotate(a=20, v=[1,0,0]) cube([width, 10, 5], center=true);
				 translate([0, -length/2 - 2, 1]) rotate(a=-15, v=[1,0,0]) cube([width, 10, 5], center=true);
			}
		 translate([0, (length+13)/2 +5, 1]) cube([width, 10, 10], center=true);
		 translate([0, -(length+13)/2 -5, 1]) cube([width, 10, 10], center=true);
		}
		
		sphere(r=2);
	}
	
	translate([0, 0, 4.5]) cube([width, length, thickness], center=true);
	translate([0, 0, 2]) cylinder (r=5, h = 5, center=true);
	cylinder (r=2, h = 10, center=true);

}