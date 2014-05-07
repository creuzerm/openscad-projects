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

FingerWidth = 2.5;
FingerTolerance = .25;





rotate([90,0,0])// Lay on it's back for better printing and strength
difference()
{
	union()
	{
	MountingBlock();
translate([FingerWidth * .5 ,0,]) JointFinger(FingerWidth - FingerTolerance);
	%translate([-FingerWidth * .5 ,0,]) JointFinger(FingerWidth - FingerTolerance);
	translate([-FingerWidth * 1.5 ,0,]) JointFinger(FingerWidth - FingerTolerance);
	%translate([FingerWidth * 1.5 ,0,]) JointFinger(FingerWidth - FingerTolerance);
	translate([FingerWidth * 2.5 ,0,]) JointFinger(FingerWidth - FingerTolerance);
	%translate([-FingerWidth * 2.5 ,0,]) JointFinger(FingerWidth - FingerTolerance);
	translate([-FingerWidth * 3.5 ,0,]) ShortJointFinger(FingerWidth - FingerTolerance);
	%translate([FingerWidth * 3.5 ,0,]) ShortJointFinger(FingerWidth - FingerTolerance);
		translate([FingerWidth * 4.5 ,0,]) ShortJointFinger(FingerWidth - FingerTolerance);


	}

	// pin hole
	translate([0,15,15 +5 + (2.9 /2)]) rotate([90,0,90]) cylinder(d=2.9, h=slide_w, center=true);

}






module JointFinger(thickness = 3)
{
	hull()
	{
// this first one sets the pivot
		translate([0,15,15 + 5 + (2.9 /2)]) rotate([90,0,90]) cylinder(r=5, h=thickness, center=true);
		translate([0,0,15])rotate([90,0,90]) cylinder(r=5, h=thickness, center=true);
		translate([0,0,-15])rotate([90,0,90]) cylinder(r=5, h=thickness, center=true);
	}
}

module ShortJointFinger(thickness = 3)
{
	hull()
	{
// this first one sets the pivot
		translate([0,15,15 + 5 + (2.9 /2)]) rotate([90,0,90]) cylinder(r=5, h=thickness, center=true);
		translate([0,0,15])rotate([90,0,90]) cylinder(r=5, h=thickness, center=true);
		translate([0,0,12.5])rotate([90,0,90]) cylinder(r=5, h=thickness, center=true);
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