File = "HeadLampLens.dxf";
Width = 42;
Height = 19;
Thickness = .6;
MountSize = 2;
DXFWidthOffset = 6.5;
StrapLength = 55;

echo(str("Width Scale: ", Width / dxf_dim(file = File, name = "total_width")));
echo(str("Height Scale: ", Height / dxf_dim(file = File, name = "total_height")));


linear_extrude(height = Thickness, center = true, convexity = 10) scale([42/dxf_dim(file = "HeadLampLens.dxf", name = "total_width"),19/dxf_dim(file = "HeadLampLens.dxf", name = "total_height"),0]) import(file = File,  layer = "Layer");

// Strap
translate([DXFWidthOffset - StrapLength - Width/2,0,-.3]) cube([StrapLength+StrapLength+Width, 4, .6]);
// Side latch
translate([DXFWidthOffset - StrapLength - Width/2 -3,.18,-.3]) rotate(a=-5) cube([2, 4, .6]);
translate([DXFWidthOffset - StrapLength - Width/2 -1,0,-.3]) cube([1, 2, .6]);
// Side latch
translate([-(DXFWidthOffset - StrapLength - Width) -7.5,0,-.3]) rotate(a=-5) cube([2, 4, .6]);
translate([-(DXFWidthOffset - StrapLength - Width) -8,2,-.3]) cube([1, 2, .6]);


// Mounting Balls
//translate([Width/2 + DXFWidthOffset - MountSize,0,MountSize]) sphere(r=MountSize, center=true);
//translate([-Width/2 + DXFWidthOffset + MountSize,0,MountSize]) sphere(r=MountSize, center=true);
