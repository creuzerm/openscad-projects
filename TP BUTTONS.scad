//  1 inch = 25.4 millimeters
in2mm = 25.4;

translate([0, 5, 0]) union()
{
hull()
{
	cylinder(h = 0.05 * in2mm, r=(0.15*in2mm) * .5, $fs = .1);
	translate([(1.05 - 0.15) * in2mm, 0 , 0]) cylinder(h = 0.05 * in2mm, r=(0.15*in2mm) * .5, $fs = .1);
}

hull()
{
	cylinder(h = 0.05 * in2mm, r=(0.1*in2mm) * .5, $fs = .1);
	translate([(1.05  - 0.15) * in2mm, 0 , 0]) cylinder(h = 0.05 * in2mm, r=(0.1*in2mm) * .5, $fs = .1);

	translate([(.1 - 0.1 )  * in2mm, 0 , (0.05 + 0.15- .1 )* in2mm]) sphere(r=(0.1*in2mm) * .5, $fs = .1);
	translate([(1.05  - 0.15) * in2mm, 0 , (0.05 + 0.15- .1 )* in2mm]) sphere(r=(0.1*in2mm) * .5, $fs = .1);
}

}

union()
{
hull()
{
	cylinder(h = 0.05 * in2mm, r=(0.15*in2mm) * .5, $fs = .1);
	translate([(0.48 - 0.15) * in2mm, 0 , 0]) cylinder(h = 0.05 * in2mm, r=(0.15*in2mm) * .5, $fs = .1);
}

hull()
{
	cylinder(h = 0.05 * in2mm, r=(0.1*in2mm) * .5, $fs = .1);
	translate([(0.48 - 0.15) * in2mm, 0 , 0]) cylinder(h = 0.05 * in2mm, r=(0.1*in2mm) * .5, $fs = .1);

	translate([(.1 - 0.1 )  * in2mm, 0 , (0.1 + 0.15- .1 )* in2mm]) sphere(r=(0.1*in2mm) * .5, $fs = .1);
	translate([(0.48 - 0.15) * in2mm, 0 , (0.1 + 0.15- .1 )* in2mm]) sphere(r=(0.1*in2mm) * .5, $fs = .1);
}

}