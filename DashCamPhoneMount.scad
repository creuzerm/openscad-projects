StandoffHeight = 10;

DashVentHoleWidth = 100;
DashVentHoleSize = 15;
DepthIntoVentHoles = 15;
SparWidth = 10;
SparThickness = 10;

StepBackFromDashHoles = 150;
HeightToSeeOverWipers = 150;

QiChargerWidth = 100;
QiChargerHeight = 80;
QiChargerDepth = 6;

PhoneWidth = 250;
PhoneHeight= 125;
PhoneDepth= 18;

CameraFromEdge = 28;
CameraFromBottom = 75;


mount();
























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