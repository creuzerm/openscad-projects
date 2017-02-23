width = 93;
length = 171;
corner = 40;

difference()
{
Base();
translate([-5,0]) KodakLens();
translate([24, -2]) rotate(a=[0,0,30]) Loupe();
translate([39, -10]) Microscope();
translate([-18, 36]) Tweezers();
translate([-7, 20])Flashfill();
translate([-13, 140]) Scissors();
translate([5, 65])SeekThermal();
}



module SeekThermal()
{union(){
    square([33,20]);
    translate([20,20]) square([9,8]);
    translate([0,11]) circle(d=22);
    
}}

module Scissors()
{
    hull()
    {
        circle(d=5);
        translate([(85-5)/2,0]) circle(d=10);
        translate([85-5,0]) circle(d=5);
    }
    
}

module Flashfill()
{union(){
    square([39,39]);
    translate([-11,10.5]) square([11,4.5]);
}}


module Base()
{
    hull()
    {
        circle(d=corner);
        translate([width-corner, 0 ]) circle(d=corner);
        translate([0, length-corner ])circle(d=corner);
        translate([width-corner, length-corner ]) circle(d=corner);
    }
}


module KodakLens()
{
    circle(d=28.3);
}

module Loupe()
{ union(){
    hull()
    {
        circle(d=25);
        translate([-5/2, 32-25/2+5/2]) circle(d=5);
    }
    translate([-5.5/2, -(5 + 25/2)]) square([5.5,5.5]);
}}


module Microscope()
{union(){
    square([27, 20]);
    translate([-(38-27)/2,20]) square([38, 18]);
}}

module Tweezers()
{
   square([9.5,100.5]);
}