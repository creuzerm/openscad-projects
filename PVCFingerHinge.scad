// 1/2 ID = .609 OD = .84  in

PipeID = .609 / 0.039370; 
PipeOD = .84 / 0.039370;

FingerWidth = 2.5;
FingerTolerance = .25;
FingerThickness = 7;

$fn=60;



difference()
{
union()
{
	fingerJoints();
	translate([0,PipeOD/2 + FingerThickness,0]) cube([PipeID, (PipeOD + PipeID) / 2, FingerThickness*2], center=true);
}
	pipe();
}



module fingerJoints()
{
	translate([0,0,0])
	difference()
	{
		union()
		{
		translate([FingerWidth * .5 ,0,]) ShortJointFinger(FingerWidth - FingerTolerance);
		%translate([-FingerWidth * .5 ,0,]) ShortJointFinger(FingerWidth - FingerTolerance);
		translate([-FingerWidth * 1.5 ,0,]) ShortJointFinger(FingerWidth - FingerTolerance);
		%translate([FingerWidth * 1.5 ,0,]) ShortJointFinger(FingerWidth - FingerTolerance);
		translate([FingerWidth * 2.5 ,0,]) ShortJointFinger(FingerWidth - FingerTolerance);
		%translate([-FingerWidth * 2.5 ,0,]) ShortJointFinger(FingerWidth - FingerTolerance);
	
		}
	
		// pin hole
		translate([0,0,0]) rotate([90,0,90]) cylinder(d=2.9, h=100, center=true);
		translate([0,PipeOD + PipeOD-PipeID + FingerThickness,0]) rotate([90,0,90]) cylinder(d=2.9, h=100, center=true);

		translate([FingerWidth * 3,0,0]) rotate([90,0,90]) cylinder(d=3.9, h=1.5, center=true);
		translate([FingerWidth * 3,PipeOD + PipeOD-PipeID + FingerThickness,0]) rotate([90,0,90]) cylinder(d=3.9, h=1.5, center=true);

		
	
	}
}

module ShortJointFinger(thickness = 3)
{
	hull()
	{
		translate([0,0,0])  rotate([90,0,90]) cylinder(r=FingerThickness, h=thickness, center=true);
		translate([0,PipeOD + PipeOD-PipeID + FingerThickness,0]) rotate([90,0,90]) cylinder(r=FingerThickness, h=thickness, center=true);
	}
}

module pipe()
{
	translate([0,50,0]) rotate([90,0,0]) difference()
	{
		cylinder(d=PipeOD, h=100);
		cylinder(d=PipeID, h=100);
	}
}
