//This is based off of http://www.thingiverse.com/thing:289910


include <C:\Users\creuzerm\Documents\OpenSCAD\libraries\MCAD\fillets.scad>;


m3_nut_od = 6.2;
m3_nut_radius = m3_nut_od/2;
m3_major = 2.8;
m3_radius = m3_major/2 ;
m3_wide_radius = m3_major/2;

num40_drill = 2.4/2;    // for tapping

slide_h = 10;
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




translate([0,13,-7.5])
//rotate([30,0,0])// Lay on it's back for better printing and strength
difference()
{
	union()
	{
	translate([FingerWidth * .5 ,0,]) ShortJointFinger(FingerWidth - FingerTolerance);
	%translate([-FingerWidth * .5 ,0,]) ShortJointFinger(FingerWidth - FingerTolerance);
	translate([-FingerWidth * 1.5 ,0,]) ShortJointFinger(FingerWidth - FingerTolerance);
	%translate([FingerWidth * 1.5 ,0,]) ShortJointFinger(FingerWidth - FingerTolerance);
	translate([FingerWidth * 2.5 ,0,]) ShortJointFinger(FingerWidth - FingerTolerance);
	%translate([-FingerWidth * 2.5 ,0,]) ShortJointFinger(FingerWidth - FingerTolerance);
	translate([-FingerWidth * 3.5 ,0,]) ShortJointFinger(FingerWidth - FingerTolerance);
	%translate([FingerWidth * 3.5 ,0,]) ShortJointFinger(FingerWidth - FingerTolerance);
	translate([FingerWidth * 4.5 ,0,]) ShortJointFinger(FingerWidth - FingerTolerance);
	translate([FingerWidth * 4.95 ,0,]) ShortJointFinger(FingerWidth - FingerTolerance);


	}

	// pin hole
	translate([0,10,15 +5 + (2.9 /2)]) rotate([90,0,90]) cylinder(d=2.9, h=slide_w, center=true);


	translate([slide_l/2 - 3.25,10,15 +5 + (2.9 /2)]) rotate([90,0,90]) cylinder(d=2.9*1.75, h=.75, center=true);

}


translate([0,0,10.5]) cube([15, 3, 1], true);

//main block
translate([0,extrusion_offset,slide_h/2])
 difference(){

   difference(){
     cube([slide_w, slide_l,slide_h],center=true);
     cube_negative_fillet([slide_w, slide_l,slide_h], radius=-1, vertical=[0,0,2,2], top=[0,2,2,2], bottom=[0,2,2,2], 
        top_angle=[90,90,90,90], top_flip=[0,0,0,0], $fn=20);
   }

     
   translate([0,-extrusion_offset,0]) union(){
    difference(){
     cube([extrusion_w, extrusion_w,slide_h+2],center=true);
  

     for(an = [0: 2]) 
      rotate(an*-90)translate([(extrusion_w-extrusion_slot_w)/2,0,0])cube([extrusion_slot_w,extrusion_slot_w,slide_h],center=true);
    }


    translate([slide_w/2,0,screw_offset]) rotate([0,90,0]) cylinder(h=slide_w, r=num40_drill, center=true);
    translate([slide_w/2,0,-screw_offset]) rotate([0,90,0]) cylinder(h=slide_w, r=num40_drill, center=true);
    translate([-slide_w/2,0,screw_offset]) rotate([0,90,0]) cylinder(h=slide_w, r=num40_drill, center=true);
    translate([-slide_w/2,0,-screw_offset]) rotate([0,90,0]) cylinder(h=slide_w, r=num40_drill, center=true);
    translate([0,-slide_l/2,screw_offset]) rotate([90,0,0]) cylinder(h=slide_w, r=num40_drill, center=true);
    translate([0,-slide_l/2,-screw_offset]) rotate([90,0,0]) cylinder(h=slide_w, r=num40_drill, center=true);
   }

   

}





module ShortJointFinger(thickness = 3)
{
	hull()
	{
// this first one sets the pivot
		translate([0,10,15 + 5 + (2.9 /2)]) rotate([90,0,90]) cylinder(r=5, h=thickness, center=true);
		translate([0,0,15])rotate([90,0,90]) cylinder(r=5, h=thickness, center=true);
		translate([0,0,12.5])rotate([90,0,90]) cylinder(r=5, h=thickness, center=true);
	}
}

