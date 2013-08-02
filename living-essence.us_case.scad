bottlecount = 3;
bottlecapheight = 10;
bottleheight = 21;
bottlewidth  = 15.75;
tolerance = .1;

singlethreadthickness = .45; // this is so we can have a single layer between the bottles
wallthickness = .9; // how thick we want the walls.



difference()
{
	hull(){ bottlecase(bottleheight ); }
	translate([0,0,.01]) bottlespace(bottleheight);
}

difference()
{
	hull(){ bottlecase(bottlecapheight, bottlewidth + (4 * wallthickness) ); }
	translate([0,0,.01]) bottlespace(bottlecapheight, bottlewidth + (4 * wallthickness));
}


module bottlecase(height, offset = 0)
{

	for (i = [1:bottlecount]) {
		translate([i * ( bottlewidth + tolerance + tolerance + singlethreadthickness ), offset, 0 ])
			cylinder(h=height + wallthickness, r=(bottlewidth/2) + wallthickness + tolerance);
	}

}

module bottlespace(height, offset = 0)
{

	for (i = [1:bottlecount]) {
		translate([i * ( bottlewidth + tolerance + tolerance + singlethreadthickness ), offset, wallthickness ])
			cylinder(h=height , r=(bottlewidth/2) + tolerance);
	}

}


