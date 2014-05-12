//This is based off of http://www.thingiverse.com/thing:289910




m3_nut_od = 6.2;
m3_nut_radius = m3_nut_od/2;
m3_major = 2.8;
m3_radius = m3_major/2 ;
m3_wide_radius = m3_major/2;

num40_drill = 2.4/2;    // for tapping

slide_h = 10;
slide_l = 27;//29; //15+13+5
slide_w = 27;

psaver_w = 9;
psaver_l = 13;
psaver_o = 1;

front_h = 13; // want to match the height of a linear rail MGN12C

extrusion_w =15.1;
extrusion_slot_w = 3.4;
extrusion_offset = 0;

screw_offset = 15;

$fn=60;



FingerWidth = 2.5;
FingerTolerance = .3;





translate([0,0,10.5]) cube([15, 3, 1], true);
%translate([0,0,10.5]) cube([3, 15, 1], true);

intersection()
{

//main block
translate([0,extrusion_offset,slide_h/2])
 difference(){

   cube([slide_w, slide_l,slide_h],center=true);
   
   translate([0,-extrusion_offset,0]) union(){
    difference(){
     cube([extrusion_w, extrusion_w,slide_h+2],center=true);
     for(an = [0: 2]) 
      rotate(an*-90)translate([(extrusion_w-extrusion_slot_w)/2,0,0])cube([extrusion_slot_w,extrusion_slot_w,slide_h],center=true);
    }
    
   }

}


sphere(r=27*.65);
}

