



// dimensions from http://home.earthlink.net/~eahoo/page8/filmhold.html
DepthToFilmSurface_in = 0.197;
RetainingTabLocation_in = 5.562;
Thickness_in = 0.520;
Length_in = 6.296;
Width_in = 4.765;
DistanceToExposureField_in = 0.650;
ExposureHeight_in = 5.002;
ExposureWidth_in = 3.882;

// convert inches to millimeters
DepthToFilmSurface_mm = DepthToFilmSurface_in * 25.4;
RetainingTabLocation_mm = RetainingTabLocation_in * 25.4;
Thickness_mm = Thickness_in * 25.4;
Length_mm = Length_in * 25.4;
Width_mm = Width_in * 25.4;
DistanceToExposureField_mm = DistanceToExposureField_in * 25.4;
ExposureHeight_mm = ExposureHeight_in * 25.4;
ExposureWidth_mm = ExposureWidth_in * 25.4;



difference()
{
	BaseFrame();
	// lens hole
	translate([Length_mm/2, -(Width_mm/2), -50 ]) cylinder(d=6, h=100);
	// camera body
	translate([(Length_mm/2) + 120 -.25,-(Width_mm/2) -34 - 1.5,-10]) rotate([0,0,90]) scale([25.4, 25.4, 25.4]) import("Samsung_GSIII.STL");
	// knock out the mic jack
	translate([Length_mm/2 -17, -(Width_mm/2) - 15, -10]) cube([20,10,10]);
	// knock out the raised camera
	translate([Length_mm/2 -6.5, -(Width_mm/2) - 22, -10.5]) cube([13,44,10]);

}

module BaseFrame()
{
	rotate([180,0.0]) union()
	{
	difference()
	{
		// Main body
		cube([Length_mm, Width_mm, Thickness_mm]);
		// empty space to film
		% translate([DistanceToExposureField_mm, (Width_mm - ExposureWidth_mm) /2, 0]) cube([ExposureHeight_mm, ExposureWidth_mm, DepthToFilmSurface_mm]);
	}
	
	 translate([RetainingTabLocation_mm, 0 , 0]) rotate([0,45,0]) cube([1, Width_mm, 1]);
	}
}