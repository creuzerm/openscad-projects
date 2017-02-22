Width = 102;
Height = 76;
FlapCurve = 25;

Seam = 3;
Stitches = 2;

snapHole = 3;

difference()
{
    wallet();
    stitchHoles();
    // Snap Holes
    translate([FlapCurve + Seam + Stitches + Seam , (Height*3) - FlapCurve]) circle(r=snapHole);
    translate([FlapCurve + Seam + Stitches + Seam , Height - FlapCurve - Seam - Seam]) circle(r=snapHole);

}


module wallet()
{
    hull()
    {
        translate([Seam + Stitches + Seam ,Height*2-1]) square([Width - Seam - Seam  ,1]);
        translate([FlapCurve + Seam + Stitches + Seam , (Height*3) - FlapCurve]) circle(r=FlapCurve);
    }
    square([Width + Seam + Stitches + Seam + Stitches,Height*2]);
}

module stitchHoles()
{
    
    for (i = [0 : Seam + Stitches : Height*2 - Seam])
    {
        translate([Seam ,  i + Seam]) circle(d=Stitches);
        translate([Width + Seam + Stitches + Stitches,  i + Seam]) circle(d=Stitches);
    }
    
}