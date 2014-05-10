



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


rotate([180,0.0]) union()
{
difference()
{
	// Main body
	cube([Length_mm, Width_mm, Thickness_mm]);
	// empty space to film
	translate([DistanceToExposureField_mm, (Width_mm - ExposureWidth_mm) /2, 0]) cube([ExposureHeight_mm, ExposureWidth_mm, DepthToFilmSurface_mm]);
}

 translate([RetainingTabLocation_mm, 0 , 0]) rotate([0,45,0]) cube([1, Width_mm, 1]);
}