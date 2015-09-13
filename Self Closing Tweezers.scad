difference()
{
union()
{
    cube([30,2,10]);
    rotate(15) translate([29,-7.8,0]) cube([30,2,10]);
    rotate(-30) translate([45.75,35.6,0]) cube([16,2,5]);
     translate([71,0,0]) rotate(5) cube([30,2,10]);
}


translate([5, 4, 5]) rotate([90,55,0]) cylinder(h=6, d=3);
}