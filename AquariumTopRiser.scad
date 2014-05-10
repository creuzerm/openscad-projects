

LongWidth = 12 + 7/8;
ShortWidth = 11.25;
Width=.75;

hull()
{
	cylinder(r=.1, h=Width * 25.4 , $fn=60);
	translate([Width * 25.4, Width * 25.4, 0]) cylinder(r=.1, h=Width * 25.4, $fn=60);
	translate([0, (ShortWidth/2) * 25.4, 0]) cylinder(r=.1, h=Width * 25.4, $fn=60);
	translate([Width * 25.4, ((ShortWidth/2) + Width) * 25.4, 0]) cylinder(r=.1, h=Width * 25.4, $fn=60);
}