


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


//main block
translate([0,extrusion_offset,slide_h/2])
 difference(){
		union()
{
     cube([slide_w, slide_l,slide_h],center=true);
     translate([0,-8,0]) cube([slide_w, slide_l,slide_h],center=true);
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

   // Screws 
   translate([0,-2,-4]) rotate([-90,0,0])
    for (a = [0: 1]) {
     rotate([0,0,a*180])
		union(){
          translate([10, 10, (slide_h-16)/2])  cylinder(r=m3_wide_radius, h=160, center=true);
          translate([10, -10, (slide_h-16)/2])  cylinder(r=m3_wide_radius, h=160, center=true);
			 
        }
    }

  // save from plastic
 translate([0,10,0]) 
  difference(){
     cube([psaver_l,psaver_w,slide_h+2],center=true);
     cube_negative_fillet([psaver_l,psaver_w,slide_h+2], radius=-1, vertical=[2,2,2,2], top=[0,0,0,0], bottom=[0,0,0,0], 
        top_angle=[90,90,90,90], top_flip=[0,0,0,0], $fn=20);
   }



translate([0,-18,0]) 
  difference(){
     cube([psaver_l,psaver_w,slide_h+2],center=true);
     cube_negative_fillet([psaver_l,psaver_w,slide_h+2], radius=-1, vertical=[2,2,2,2], top=[0,0,0,0], bottom=[0,0,0,0], 
        top_angle=[90,90,90,90], top_flip=[0,0,0,0], $fn=20);
   }
}

