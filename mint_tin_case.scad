/*
Mint tin dimensions:
Top lid outer (not lip): 2.36" (59.9mm) x 3.75"(95mm)
Tin bottom: 2.3" (58.75mm) x 3.7"(93.9mm)
Inner: 2.24" (56.9mm) x 3.6"(91.5mm)
Height bottom section: 0.83" (21.28mm)
Height top section: "0.36 (9.26mm)
Corner radius .55" (14mm)
*/





bottleheight = 10; // 13.5
bottlewidth  = 15.75;
tolerance = .01;

singlethreadthickness = .45; // this is so we can have a single layer between the bottles
wallthickness = .9; // how thick we want the walls.
bottomthickness = -0.1; // how thick we want the floor.


threeshift = -bottlewidth -2.75;
twoshift = -(bottlewidth +1 )/2;
insidelength = 88.0/7; // 91.5/7;

% translate([-7,-7,0]) cube([56.9, 91.5, bottleheight]);

difference()
{
hull()
{
	cylinder(h=bottleheight , r=(14/2) );
	translate ([56.9 - 14, 0, 0]) cylinder(h=bottleheight , r=(14/2));
	translate ([56.9 - 14, 91.5 - 14, 0]) cylinder(h=bottleheight , r=(14/2) );
	translate ([0, 91.5 -14, 0]) cylinder(h=bottleheight , r=(14/2) );
}

translate ([ threeshift , 0*(insidelength) + 1, 0]) bottlespace(3, bottleheight, 0 );
translate ([twoshift, 1*(insidelength) + 1, 0]) bottlespace(2, bottleheight, 0 );
translate ([threeshift, 2*(insidelength) + 1, 0]) bottlespace(3, bottleheight, 0 );
translate ([twoshift, 3*(insidelength) + 1, 0]) bottlespace(2, bottleheight, 0 );
translate ([threeshift, 4*(insidelength) + 1, 0]) bottlespace(3, bottleheight, 0 );
translate ([twoshift, 5*(insidelength) + 1, 0]) bottlespace(2, bottleheight, 0 );
translate ([threeshift, 6*(insidelength) + 1, 0]) bottlespace(3, bottleheight, 0 );

}



module bottlespace(bottlecount, height, offset = 0)
{

	for (i = [1:bottlecount]) {
		translate([i * ( (56.9 + 3) / 3 ), offset, bottomthickness ])
			cylinder(h=height + 1 , r=(bottlewidth/2) + tolerance);
	}

}