bottlecount = 4;
bottlecapheight = 14;
bottleheight = 14;
bottlewidth  = 15.75;
tolerance = .1;

shellheight = 45;

singlethreadthickness = .45; // this is so we can have a single layer between the bottles
wallthickness = .9; // how thick we want the walls.



difference()
{
	bottlecase(bottleheight ); 
	translate([0,0,.01]) bottlespace(bottleheight);
}

difference()
{
	bottlecase(bottlecapheight, bottlewidth + (4 * wallthickness) ); 
	translate([0,0,.01]) bottlespace(bottlecapheight, bottlewidth + (4 * wallthickness));
}


difference()
{
	shellcase(shellheight, 2 * (bottlewidth + (4 * wallthickness)));
	 bottlecase(shellheight, 2 * ( bottlewidth + (4 * wallthickness)) ); 
}


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
		translate([i * ( bottlewidth + tolerance + tolerance + singlethreadthickness ), offset, wallthickness ])
			cylinder(h=height , r=(bottlewidth/2) + tolerance);
	}

}


