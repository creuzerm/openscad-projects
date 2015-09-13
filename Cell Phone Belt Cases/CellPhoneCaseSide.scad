Depth = 84;
Width = 18;
Thickness = 10;


difference()
{
 union()
{
cube([Depth - (Width/2),Width,Thickness]);
translate([0, Width/2, 0]) cylinder(r=Width/2, h=Thickness);
}

translate([0, Width/4, Width + (Width/4)]) rotate([0, 90, 0]) cylinder(r=Width, h=Depth);
translate([0, Width/4, Width + (Width/4)]) sphere(r=Width);


	for (i = [1:(Depth)/4]) {
		translate([i * ( 4 ) - (.5 * Width) +1, Width +1 , 2 ])
			rotate([90, 0, 0])
				cylinder(h=Width + Thickness, r=(1) );
	}

}