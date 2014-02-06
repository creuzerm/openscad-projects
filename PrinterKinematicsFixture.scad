// Kinematic Calibration print-in-place calibration fixture
// Usfeul for measuring the motion of the bed using a portable CMM

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
	translate([OuterClearence, OuterClearence, 0]) corner(); // Is it necessary to do this translation? Of course not, it just makes more sense when reading the code.
	
	translate([ BedX - OuterClearence, OuterClearence, 0]) rotate([0,0,90]) corner();
	
	translate([ BedX - OuterClearence, + BedY - OuterClearence, 0]) rotate([0,0,180]) corner();
	
	translate([ OuterClearence, BedY - OuterClearence, 0]) rotate([0,0,270]) corner();
	
	// Connecting Rim to help hold the corners in place
	difference()
	{
		translate([OuterClearence, OuterClearence, 0]) cube([BedX - OuterClearence - OuterClearence, BedY - OuterClearence - OuterClearence, ConnectionHeight]);
	
		translate([OuterClearence + ConnectionThickness, OuterClearence + ConnectionThickness, 0]) cube([BedX - OuterClearence - OuterClearence - ConnectionThickness - ConnectionThickness, BedY - OuterClearence - OuterClearence - ConnectionThickness - ConnectionThickness, ConnectionHeight]);
	}
}


module corner()
{
	union()
	{
		cube([CornerLength, CornerThickness, CornerHeight]);
		cube([CornerThickness, CornerLength, CornerHeight]);
	}
}