m3_nut_od = 6.2;
m3_nut_radius = m3_nut_od/2;
m3_major = 2.8;
m3_radius = m3_major/2 ;
m3_wide_radius = m3_major/2;

num40_drill = 2.4/2;    // for tapping

slide_h = 40;
slide_l = 15+13+5;//29; //15+13+5
slide_w = 27;

psaver_w = 9;
psaver_l = 13;
psaver_o = 1;

front_h = 13; // want to match the height of a linear rail MGN12C

extrusion_w =15.1;
extrusion_slot_w = 3.4;
extrusion_offset = front_h -((slide_l-extrusion_w)/2);
echo (extrusion_offset);
echo (extrusion_offset+slide_l/2);

screw_offset = 15;

$fn=60;








rotate([180,0,0]) //flip this so it can print better
difference()
{
	union()
	{
	MountingBlock();
translate([1.25,0,]) JointFinger(2.5 - .1);
	%translate([-1.25,0,]) JointFinger(2.5 - .1);
	translate([-3.75,0,]) JointFinger(2.5 - .1);
	%translate([3.75,0,]) JointFinger(2.5 - .1);
	translate([6.25,0,]) JointFinger(2.5 - .1);
	%translate([-6.25,0,]) JointFinger(2.5 - .1);
	}

	// pin hole
	translate([0,15,15]) rotate([90,0,90]) cylinder(d=2.9, h=slide_w, center=true);

}






module JointFinger(thickness = 3)
{
	hull()
	{
		translate([0,15,15]) rotate([90,0,90]) cylinder(r=5, h=thickness, center=true);
		translate([0,0,15])rotate([90,0,90]) cylinder(r=5, h=thickness, center=true);
		translate([0,0,-15])rotate([90,0,90]) cylinder(r=5, h=thickness, center=true);
	}
}

module MountingBlock()
{
	difference()
	{
	     cube([slide_w, 10 ,slide_h],center=true);
	
	// bolt hole pattern
	 	 translate([0,-2,-4]) rotate([-90,0,0])
		    for (a = [0: 1]) {
		     rotate([0,0,a*180])
				union(){
		          translate([10, 10, (slide_h-16)/2])  cylinder(r=m3_wide_radius, h=160, center=true);
		          translate([10, -10, (slide_h-16)/2])  cylinder(r=m3_wide_radius, h=160, center=true);
		         
					 
		        }
		    }
	}
}