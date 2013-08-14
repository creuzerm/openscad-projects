bottlecount = 5;

bottlecapheight = 13.5;
bottleheight = 13.5;
bottlewidth  = 15.75;
tolerance = .1;

shellheight = 45;

singlethreadthickness = .45; // this is so we can have a single layer between the bottles
wallthickness = .9; // how thick we want the walls.
bottomthickness = -0.1; // how thick we want the floor.


use <Write.scad>


union()
{
	difference()
	{
		bottlecase(bottleheight ); 
		translate([0,0,.01]) bottlespace(bottleheight);
	translate([17,-bottlewidth/2 - (wallthickness - singlethreadthickness + .1) ,bottleheight /3]) rotate([90, 0, 0]) write("living-essence.us",t=singlethreadthickness,h=bottleheight /2.5); 
	
	}
	
	
	difference()
	{
		bottlecase(bottlecapheight, bottlewidth + ( wallthickness) ); 
		translate([0,0,.01]) bottlespace(bottlecapheight, bottlewidth + ( wallthickness));
	}
	
	difference()
	{
		bottlecase(bottlecapheight, 2 * (bottlewidth + ( wallthickness)) ); 
		translate([0,0,.01]) bottlespace(bottlecapheight, 2 * (bottlewidth + ( wallthickness)));
	translate([17 + (bottlewidth * 4), 2 * (bottlewidth + ( wallthickness)) + bottlewidth/2 + (wallthickness - singlethreadthickness + .1) ,bottleheight /3]) rotate([270, 180, 0]) write("living-essence.us",t=singlethreadthickness,h=bottleheight /2.5); 
	
	}
}



/*
difference()
{
	shellcase(shellheight, 2 * (bottlewidth + (4 * wallthickness)));
	 bottlecase(shellheight, 2 * ( bottlewidth + (4 * wallthickness)) ); 
}
*/

module bottlecase(height, offset = 0)
{
	hull(){ 
	for (i = [1:bottlecount]) {
		translate([i * ( bottlewidth + tolerance + tolerance + singlethreadthickness ), offset, 0 ])
			cylinder(h=height + wallthickness, r=(bottlewidth/2) + wallthickness + tolerance);
	}
	}
}

module shellcase(height, offset = 0)
{
	hull() {
	for (i = [1:bottlecount]) {
		translate([i * ( bottlewidth + tolerance + tolerance + singlethreadthickness  ), offset, 0 ])
			cylinder(h=height + wallthickness, r=(bottlewidth/2) + wallthickness + tolerance + singlethreadthickness + tolerance );
	}
	}
}

module bottlespace(height, offset = 0)
{

	for (i = [1:bottlecount]) {
		translate([i * ( bottlewidth + tolerance + tolerance + singlethreadthickness ), offset, bottomthickness ])
			cylinder(h=height + 1 , r=(bottlewidth/2) + tolerance);
	}

}


