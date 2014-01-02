CenterHole = 17.5; // Width across the Night Light base
HoleDepth = 12; // Height of the night light base

Thickness = 2; // How thick you want the walls of the printed part

LithographFrameThickness = 3.4; //Thickness of the Lithopane frame. 
FrameHolderLength = 28.5; // Widfth of arms of the support for the frame. The total width of the nightlight may look good

SupportWidth = .35; // Used for a better bridge over the notch for the Lithopane Frame. Simply peel it out of the slot by grabbing it in the ring.


difference()
{
	union()
	{
		hull()
		{
			// base of the bracket
			cube([CenterHole + (Thickness * 2), HoleDepth, (CenterHole + (Thickness * 2))/2 + Thickness]);
			// support arms for lithopane frame
			translate([ -(FrameHolderLength - (CenterHole + (Thickness * 2))) / 2, 0, 0])
				cube([FrameHolderLength, LithographFrameThickness + Thickness, LithographFrameThickness + (Thickness * 2)]);
		}

	// ring
	translate([(CenterHole + (Thickness * 2))/2, HoleDepth, (CenterHole + (Thickness * 2)) /2 + Thickness]) 
		rotate([90,0,0]) 
			cylinder(r=(CenterHole + (Thickness * 2)) / 2, h=HoleDepth);
	}

	// make the hole
	translate([(CenterHole + (Thickness * 2))/2, HoleDepth, (CenterHole + (Thickness * 2)) /2 + Thickness]) 
		rotate([90,0,0]) 
			cylinder(r=(CenterHole ) / 2, h=HoleDepth);

	// slot for the lithopane
	translate([ -(FrameHolderLength - (CenterHole + (Thickness * 2))) / 2, SupportWidth, Thickness])
			cube([FrameHolderLength, LithographFrameThickness , LithographFrameThickness]);
	
	//knock out of the ring
	translate([0,0,CenterHole  ])
		cube([CenterHole + (Thickness * 2), HoleDepth, (CenterHole + (Thickness * 2))/2 + Thickness]);
	
	// clean up the knockout
	translate([(CenterHole + (Thickness * 2))/2, HoleDepth, CenterHole + Thickness]) 
		rotate([90,0,0]) 
			 cylinder(r=(CenterHole ) / 2, h=HoleDepth);

}

