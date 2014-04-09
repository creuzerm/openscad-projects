width = 52;
length = 83.0;
thickness = 1.25;

storageLength = 92.0;
storageThickness = 4;


rotate(a=90, v=[0,1,0]) difference()
{
	minkowski()
	{
		difference()
		{
			union()
			{
			 	cube([width, length+13, 5 + thickness], center=true);
				 translate([0, length/2 + 2, 1]) rotate(a=20, v=[1,0,0]) cube([width/3, 10, 5], center=true);
				 translate([0, -length/2 - 2, 1]) rotate(a=-15, v=[1,0,0]) cube([width/3, 10, 5], center=true);
			}
		 translate([0, (length+13)/2 +5, 1]) cube([width, 10, 10], center=true);
		 translate([0, -(length+13)/2 -5, 1]) cube([width, 10, 10], center=true);
		}
		
		sphere(r=2);
	}
	
	// knock out the space for the sharpener and the mouting holes
	translate([0, 0, 4.5]) cube([width, length, thickness], center=true);
	translate([0, 0, -2]) cylinder (r=2, h = 7, center=true);
	translate([0, 0, 2])  supportedCylinder();

	// Storage Area
	cube([width *2, storageLength, storageThickness], center=true);
}


module supportedCylinder()
{
	difference()
	{
		cylinder (r=5, h = 5, center=true);
		difference()
		{	
			cylinder (r=4.9, h = 5, center=true);
			translate([5, 0, 0])  cube([10, 10, 10], center=true);
		}			
		rotate(a=90, v=[0,1,0]) cube([10, 10, .3], center=true);

	}
}