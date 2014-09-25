// Designed by Bella, 4 years old (Daddy helped with the measuring and typing)

Diameter = 103;  // Cup Mouth Diameter
thickness = 6; // Total thickness, top to bottom
WallThickness = .9; // Lid rim thickness. Adds to total diameter
LidThickness = 1; // Thickness of the lid. Does not add to total thickness.

$fn = 60; // Circle Smoothness. 

difference()
{
	cylinder(d=Diameter + (WallThickness*2), h=thickness);
	translate([0,0,LidThickness]) cylinder(d=Diameter, h=thickness);
	translate([0,0,0]) cylinder(d=5, h=thickness); // straw hole

}