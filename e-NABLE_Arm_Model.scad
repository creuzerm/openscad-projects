

Left1 = 66.47;
Left2 = 64.04;
Left3 = 46.95;
Left4 = 35.14;
Left5 = 35.97;
Left6 = 27.27;
Left7 = 31.80;
Left8 = 40.97;
Left9 = 31.06;
Left10 = 147.5;

//arm
// Set up a set of spheres down the length of the arm and create 'hulls' between them to rough in the arm
hull()
{
translate([0,-Left10,0]) sphere(d = Left1);
translate([0,-(Left10 * 4/5),0]) sphere(d = Left2);
}
hull()
{
translate([0,-(Left10 * 4/5),0]) sphere(d = Left2);
translate([0,-(Left10 / 2),0]) sphere(d = Left3);
}
hull()
{
translate([0,-(Left10 / 2),0]) sphere(d = Left3);
translate([0,-(Left10 * 1/5),0]) sphere(d = Left4);
}
hull()
{
translate([0,-(Left10 * 1/5),0]) sphere(d = Left4);
//% sphere(d = Left5); // The next two lines gives us a better match to the flattening of the arm
translate([Left5/2 - Left6/2,Left6/2,0]) sphere(d = Left6); 
translate([-(Left5/2 - Left9/2),Left9/2,0]) sphere(d = Left9); 
}

//hand

hull()
{
translate([Left8/2 - Left6/2,Left6/2,0]) sphere(d = Left6); // offset the outside edge by half the width of the hand, taking into account the size of this section
translate([0,Left7/2,0]) sphere(d = Left7); // make the center of the hand
}

hull()
{
translate([0,Left7/2,0]) sphere(d = Left7); // make the center of the hand
translate([-(Left8/2 - Left9/2),Left9/2,0]) sphere(d = Left9); // offset the outside edge by half the width of the hand, taking into account the size of this section
}