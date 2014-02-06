// Kinematic Calibration print-in-place calibration fixture
// Useful for measuring the motion of the bed using a portable CMM such as a ROMER arm.
// Spreadsheet to process measurements found at https://docs.google.com/spreadsheet/ccc?key=0Asb6Jfk9hsyhdHVHcmZvMFFjYUI0WHFuZVdjbXZZX2c&usp=sharing 

BedX = 200;
BedY = 200;
OuterClearence = 6; // space left outside each side for skirts, brims, etc.

CornerHeight = 10;
CornerLength = 10;
CornerThickness = 1;


ConnectionHeight = .5; // set to 0 to remove
ConnectionThickness = 1;


%cube([BedX, BedY, 0.1]); // preview print bed area

union()
{
	translate([OuterClearence, OuterClearence, 0]) corner(); //Front Left. Is it necessary to do this translation? Of course not, it just makes more sense when reading the code.
	
	translate([ BedX - OuterClearence, OuterClearence, 0]) rotate([0,0,90]) corner(); // Front Right
	
	translate([ BedX - OuterClearence, + BedY - OuterClearence, 0]) rotate([0,0,180]) corner(); // back right
	
	translate([ OuterClearence, BedY - OuterClearence, 0]) rotate([0,0,270]) corner(); // back left
	
	// Connecting Rim to help hold the corners in place
	difference()
	{
		translate([OuterClearence, OuterClearence, 0]) cube([BedX - OuterClearence - OuterClearence, BedY - OuterClearence - OuterClearence, ConnectionHeight]); // Lay down a thin film
	
		translate([OuterClearence + ConnectionThickness, OuterClearence + ConnectionThickness, 0]) cube([BedX - OuterClearence - OuterClearence - ConnectionThickness - ConnectionThickness, BedY - OuterClearence - OuterClearence - ConnectionThickness - ConnectionThickness, ConnectionHeight]); // remove most of the intior                    --
	}

// Lets do some leanear travel guages
// Front 
translate([ (BedX) * .1, OuterClearence, 0]) rotate([0,0,45]) scale([.5,.5,.5]) corner(); 
translate([ (BedX) * .3, OuterClearence, 0]) rotate([0,0,45]) scale([.5,.5,.5]) corner(); 
translate([ (BedX) * .5, OuterClearence, 0]) rotate([0,0,45])  scale([.5,.5,.5])corner(); 
translate([ (BedX) * .7, OuterClearence, 0]) rotate([0,0,45])  scale([.5,.5,.5]) corner(); 
translate([ (BedX) * .9, OuterClearence, 0]) rotate([0,0,45])  scale([.5,.5,.5]) corner(); 

// Left
translate([ OuterClearence, (BedY)  * .1, 0]) rotate([0,0,315]) scale([.5,.5,.5]) corner(); // back left
translate([ OuterClearence, (BedY)  * .3, 0]) rotate([0,0,315]) scale([.5,.5,.5]) corner(); // back left
translate([ OuterClearence, (BedY)  * .5, 0]) rotate([0,0,315]) scale([.5,.5,.5]) corner(); // back left
translate([ OuterClearence, (BedY)  * .7, 0]) rotate([0,0,315]) scale([.5,.5,.5]) corner(); // back left
translate([ OuterClearence, (BedY)  * .9, 0]) rotate([0,0,315]) scale([.5,.5,.5]) corner(); // back left


}


module corner()
{
	union()
	{
		cube([CornerLength, CornerThickness, CornerHeight]);
		cube([CornerThickness, CornerLength, CornerHeight]);
	}
}