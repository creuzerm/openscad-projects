straw = 7.2;
height = 5;

smoothness = 30;


for (z = [1: 10]) // two iterations, z = -1, z = 1
{
    translate([z * 10, 0, 0])
    cap();
}

translate([straw, -.49, 0]) cube([90, 0.98, .3]);  

module cap()
{
	union() {
		cylinder(h = .3, r=straw / 2 + .5, $fn=smoothness);
		cylinder(h = height * .75, r=straw / 2, $fn=smoothness);
		translate ([0, 0 , height * .75]) cylinder(h = height * .25, r1=straw / 2, r2=straw / 2 - .5, $fn=smoothness);
	}
}