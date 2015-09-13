Small = 27.5;
Large = 34.5; // 41.5
SegmentLength = 18;
Transition = 10;
Thickness = 3;

difference()
{
	Adapter(Thickness);
	Adapter();
}


module Adapter(offset = 0)
{
	union()
	{
		hull()
		{
			translate([0,0,SegmentLength+Transition/2]) cylinder(d=Small + offset, h=Transition/2);
			translate([0,0,SegmentLength]) cylinder(d=Large + offset, h=.1);
		}
		translate([0,0,SegmentLength+Transition]) cylinder(d=Small + offset, h=SegmentLength);
		cylinder(d=Large + offset, h=SegmentLength);
	}
}