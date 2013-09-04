slotside = 4.75;
slotwidth = 6;
slotdepth = 15;
centergap = 86;

bracketwidth = 5;
bracketheight = 2;

difference()
{
	cube([centergap * 2, slotside + slotwidth + bracketwidth, slotdepth + bracketheight]);
	translate([centergap/2, 0, bracketheight]) cube([centergap, slotside + slotwidth, slotdepth]);
	translate([0, slotwidth, bracketheight]) cube([centergap * 2, slotside, slotdepth]);
}