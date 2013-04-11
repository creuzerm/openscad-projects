


seperation = 18.5; // Distance between the lense and the flash

depth = 100;
height = 40;
width = 40;

wall_thickness = 1;

refractor_diameter = 20;


lightpathangle = cos( (seperation/2) / sqrt(seperation*seperation + (depth - refractor_diameter/2 - wall_thickness)*(depth - refractor_diameter/2 - wall_thickness))); // This should be 6.68 I guess

union()
{
difference()
{
	cube (size=[width, depth, height]);
	translate([wall_thickness,0, wall_thickness]) cube (size=[width/2 -wall_thickness*2, depth-wall_thickness, height-wall_thickness]);
	translate([width/2, depth - wall_thickness - refractor_diameter/2, wall_thickness]) cylinder(r=refractor_diameter/2, h=height - wall_thickness);
	translate([ width/2 + seperation/2, -wall_thickness, wall_thickness]) rotate( a= [ 0, 0, 6.68], v=[0,0,0]) cube (size=[wall_thickness, depth, height]);


}
	translate([width/2, depth - wall_thickness - refractor_diameter/2, wall_thickness]) cylinder(r=refractor_diameter/4, h=wall_thickness * 2);

}


// The barrel
difference()
{
	translate([-width/2, depth - wall_thickness - refractor_diameter/2, wall_thickness]) cylinder(r=refractor_diameter/2, h=height - wall_thickness);
	translate([-width/2, depth - wall_thickness - refractor_diameter/2, wall_thickness]) cylinder(r=refractor_diameter/4, h=wall_thickness * 2);
	translate([-width/2, depth - wall_thickness - refractor_diameter, 4*wall_thickness]) cube (size=[width/2 , width/2 , height-wall_thickness]);

}


