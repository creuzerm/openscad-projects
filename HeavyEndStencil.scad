use <write.scad>
f="stencil.dxf";

difference()
{
cube([150,50,1]);
 translate([30,20,0]) resize([100,12,8]) write("HEAVY END",[0,0,0],20,font=f,space=2,t=2);
}

difference()
{
	translate([0,-55,0]) cube([150,50,1]);
	translate([50,18,0]) union()
	{
		translate([5,-53.5,0]) cube([50,10,1]);
		translate([0,-55,0]) rotate(a=45) cube([30,10,1]);
		translate([0,-55,0]) rotate(a=-45) cube([22.5,10,1]);
	}
}

