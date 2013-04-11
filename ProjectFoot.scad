/* 

Parametric Project Foot Generator 

Mike Creuzer - thingiverse@creuzer.com 2013-03-31


*/

// Top is against the project
TopWidth = 15;
// Bottom is agains the floor
BottomWidth = 10;
// How tall the foot is
Height = 10;
// Curved edge radius
Smoothing = 3;
// Smothness of the Smoothing - aka the curve faciting.  15 is faceted but fastish, 100 is really smooth and takes days to render.
SubSmoothing = 15;

// Width of bolt head hole - including room for a ratchet socket if needed
BoltHeadWidth = 5;
// Depth of bolt head hole
BoltHeadDepth = 3;
// Bolt hole width/diameter
BoltWidth = 2;


difference()
{
	SquareFoot();
	bolthole();
}





module bolthole()
{
	translate([0,0,Height - (BoltHeadDepth/2)]) cylinder(h = BoltHeadDepth, r= BoltHeadWidth / 2, $fn=100, center = true);
	translate([0,0,Height/2]) cylinder(h = Height, r= BoltWidth / 2, $fn=100, center = true);
}



module SquareFoot()
{

difference()
{
	minkowski()
	{
		hull()
		{
			cube(size = [TopWidth - (2*Smoothing),TopWidth - (2*Smoothing),0.0001], center = true);
			translate([0,0,Height - Smoothing]) cube(size = [BottomWidth - (Smoothing),BottomWidth - (Smoothing),0.0001], center = true);
		}
		sphere(r=Smoothing, $fn=SubSmoothing);
	}
	translate([0,0, - Smoothing])  cube(size = [TopWidth,TopWidth,Smoothing * 2], center = true);
}


// These are just reference marks so I know that I got the shape and size right.
% hull()
{
 cube(size = [TopWidth,TopWidth,0.0001], center = true);
 translate([0,0,Height]) cube(size = [BottomWidth,BottomWidth,0.0001], center = true);
}

}