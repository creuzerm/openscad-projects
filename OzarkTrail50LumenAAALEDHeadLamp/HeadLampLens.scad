File = "HeadLampLens.dxf";
Width = 42;
Height = 19;
Thickness = 1;
MountSize = 2;
DXFWidthOffset = 6.5;

echo(str("Width Scale: ", Width / dxf_dim(file = File, name = "total_width")));
echo(str("Height Scale: ", Height / dxf_dim(file = File, name = "total_height")));


linear_extrude(height = Thickness, center = true, convexity = 10) scale([42/dxf_dim(file = "HeadLampLens.dxf", name = "total_width"),19/dxf_dim(file = "HeadLampLens.dxf", name = "total_height"),0]) import(file = File,  layer = "Layer");


translate([Width/2 + DXFWidthOffset - MountSize,0,MountSize]) sphere(r=MountSize, center=true);
translate([-Width/2 + DXFWidthOffset + MountSize,0,MountSize]) sphere(r=MountSize, center=true);
