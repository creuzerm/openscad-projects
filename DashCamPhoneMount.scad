StandoffHeight = 10;

DashVentHoleWidth = 2.5 * 25.4;
DashVentHoleSize = 15;
DepthIntoVentHoles = 15;
SparWidth = 10;
SparThickness = 10;

StepBackFromDashHoles = 5 * 25.4;
HeightToSeeOverWipers = 2.5 * 25.4;

QiChargerWidth = 100;
QiChargerHeight = 70;
QiChargerDepth = 6;

PhoneWidth = 5.75 * 25.4;
PhoneHeight= 3.25 * 25.4;
PhoneDepth= 5/8 * 25.4;

CameraFromEdge = 1.5 * 25.4;
CameraFromBottom = 1.5 * 25.4;



// Phone model
% phone();

mount();
Holder();

//rotate([180, 0, 0]){ 
//mount();

// Left Leg
difference()
{
	translate([PhoneWidth/2 + 1 - SparThickness/2, PhoneDepth + QiChargerDepth +3, 0]) 	cylinder(d=SparWidth, h=SparThickness); // Left peg
	// Lets making a mouting hole
	translate([PhoneWidth/2 + 1 - SparThickness/2, PhoneDepth + QiChargerDepth +3, 0]) 	cylinder(d=3, h=PhoneHeight); // hole
	translate([PhoneWidth/2 + 1 - SparThickness/2, PhoneDepth + QiChargerDepth +3, 0]) 	cylinder(d=SparThickness /2 , h=2); // origin peg
}

//right leg
difference()
{
translate([-(PhoneWidth/2 + 1 - SparThickness/2), PhoneDepth + QiChargerDepth +3, 0]) 	cylinder(d=SparWidth, h=SparThickness); // Right peg
// Lets making a mouting hole
	translate([-(PhoneWidth/2 + 1 - SparThickness/2), PhoneDepth + QiChargerDepth +3, 0])	cylinder(d=3, h=PhoneHeight); // hole
	translate([-(PhoneWidth/2 + 1 - SparThickness/2), PhoneDepth + QiChargerDepth +3, 0]) 	cylinder(d=SparThickness /2 , h=2); // origin peg
}

//}




















module Holder()
{
	difference()
	{
	hull()
	{
		// Qi Charger location
		translate([-QiChargerWidth/2, SparWidth/2 , StandoffHeight + SparThickness + HeightToSeeOverWipers - StandoffHeight]) cube([QiChargerWidth+2,QiChargerDepth+1, QiChargerHeight+2 ]);
	
		//Mounting Tab
		translate([0,0,StandoffHeight + SparThickness]) cylinder(d=SparWidth, h=2);
	
		// Top of front cradle
		translate([-PhoneWidth/2 -1, SparWidth/2 , StandoffHeight + (PhoneHeight * .5) + HeightToSeeOverWipers - StandoffHeight])  cube([PhoneWidth +2, PhoneDepth + 2 + QiChargerDepth+1, 1]);
		// bottom of front cradle
		translate([-PhoneWidth/2 -1, SparWidth/2 , StandoffHeight] )  cube([PhoneWidth +2, PhoneDepth + 2 + QiChargerDepth+1, 1]);
	}
	
	phone();
	// knock out Qi Charger location
	translate([-QiChargerWidth/2+1, SparWidth/2+1 , StandoffHeight +SparThickness +1 + HeightToSeeOverWipers - StandoffHeight]) cube([QiChargerWidth,QiChargerDepth, QiChargerHeight ]);
	// Need to angle the top..
	
	// Slot for the front mount
	mount();
	translate([0, 2, 0]) mount();
	translate([2, 1.5, 0]) mount();mount();
	translate([-2, 1.5, 0]) mount();
	
	// Lets making a mouting hole
	cylinder(d=3, h=PhoneHeight); // hole
	translate([0,0,StandoffHeight +SparThickness +5]) cylinder(d=SparThickness /2 , h=PhoneHeight); // origin peg
	
	// Knock out the screen view area
	translate([0, PhoneDepth/2, PhoneHeight / 2 -1])  phone();
	scale([.95, .95, .95]) translate([0, PhoneDepth/2, 5])  phone();

	//rear mounting holes
	translate([PhoneWidth/2 + 1 - SparThickness/2, PhoneDepth + QiChargerDepth +3, 0]) 	cylinder(d=3, h=PhoneHeight); // Left hole
	translate([-(PhoneWidth/2 + 1 - SparThickness/2), PhoneDepth + QiChargerDepth +3, 0])	cylinder(d=3, h=PhoneHeight); // right hole

	// camera hole
	translate([-QiChargerWidth/2+1, 50 , StandoffHeight +SparThickness +1 + HeightToSeeOverWipers - StandoffHeight + CameraFromBottom - 15]) rotate([90,0,0])  cylinder(r=15, h=100);
	translate([QiChargerWidth/2+1, 50 , StandoffHeight +SparThickness +1 + HeightToSeeOverWipers - StandoffHeight + CameraFromBottom - 15]) rotate([90,0,0])  cylinder(r=15, h=100);
	
	// charger hole
	translate([-150, 20 , StandoffHeight +SparThickness +1 + HeightToSeeOverWipers - StandoffHeight + CameraFromBottom - 15]) rotate([90,0,90])  cylinder(r=7, h=300);

	}
}


module phone()
{
	translate([-PhoneWidth/2, SparWidth/2 + QiChargerDepth+1 , StandoffHeight + 2 + HeightToSeeOverWipers - StandoffHeight]) cube([PhoneWidth,PhoneDepth, PhoneHeight ]);
}



// Easier to drop points where we want them and hull them together then to try to do the trig to rotate and size stuff

module mount()
{
difference()
{
	union()
	{
		cylinder(d=SparWidth, h=SparThickness); // origin peg
		
			translate([ DashVentHoleWidth/2 * .9, -StepBackFromDashHoles * .9, 0] ) cylinder(d=SparWidth, h=SparThickness); // left leg
			translate([ -DashVentHoleWidth/2* .9, -StepBackFromDashHoles* .9, 0] ) cylinder(d=SparWidth, h=SparThickness); // right leg
		
		// Left Arm
		difference()
		{
			hull() 
			{
				translate([0,0,StandoffHeight]) cylinder(d=SparWidth, h=SparThickness);
				translate([ DashVentHoleWidth/2, -StepBackFromDashHoles, StandoffHeight] ) cylinder(d=SparWidth, h=SparThickness);
			}
			hull() 
			{
				translate([DashVentHoleWidth/2  * .25, -StepBackFromDashHoles * .25,StandoffHeight]) cylinder(d=SparWidth -2, h=SparThickness);
				translate([ DashVentHoleWidth/2  * .75, -StepBackFromDashHoles * .75, StandoffHeight] ) cylinder(d=SparWidth -2, h=SparThickness);
			}
		}


		//Right Arm
		difference()
		{
			hull() 
			{
				translate([0,0,StandoffHeight]) cylinder(d=SparWidth, h=SparThickness);
				translate([ -DashVentHoleWidth/2, -StepBackFromDashHoles, StandoffHeight] ) cylinder(d=SparWidth, h=SparThickness);
			}
			hull() 
			{
				translate([-DashVentHoleWidth/2  * .25, -StepBackFromDashHoles * .25,StandoffHeight]) cylinder(d=SparWidth -2, h=SparThickness);
				translate([ -DashVentHoleWidth/2  * .75, -StepBackFromDashHoles * .75, StandoffHeight] ) cylinder(d=SparWidth -2, h=SparThickness);
			}
		}
		

		// Dash Pegs
		hull() //left side
		{
			translate([ DashVentHoleWidth/2, -StepBackFromDashHoles, StandoffHeight] ) cylinder(d=SparWidth, h=SparThickness);
			translate([ DashVentHoleWidth/2, -StepBackFromDashHoles, -DepthIntoVentHoles] ) cylinder(d=DashVentHoleSize, h=DepthIntoVentHoles);
		}
		
		hull() // right side
		{
			translate([ -DashVentHoleWidth/2, -StepBackFromDashHoles, StandoffHeight] ) cylinder(d=SparWidth, h=SparThickness);
			translate([ -DashVentHoleWidth/2, -StepBackFromDashHoles, -DepthIntoVentHoles] ) cylinder(d=DashVentHoleSize, h=DepthIntoVentHoles);
		}
	}

	// Lets making a mouting hole
	cylinder(d=3, h=SparThickness*2); // hole
	cylinder(d=SparThickness /2 , h=2); // origin peg

}
}