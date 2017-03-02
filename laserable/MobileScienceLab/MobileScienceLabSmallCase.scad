width = 93;
length = 170;
corner = 40;

difference()
{
Base();
translate([10,74]) KodakLens();
translate([56, 118]) rotate(a=[0,0,-45]) Loupe();
translate([35, 99]) rotate(a=[0,0,90]) Microscope();
translate([-18, 30]) Tweezers();
translate([30, 32])Flashfill();
translate([-13, 138]) Scissors();
translate([36, 75])SeekThermal();
translate([47,7]) rotate(a=[0,0,-170]) WeatherFlowWEATHERmeter();
translate([-16,24]) rotate(a=[0,0,-70]) USBThumbDrive();
    
   translate([-1,38]) circle(d=10.3);
}


module USBThumbDrive()
{
    square([10.5,37]);
}

module WeatherFlowWEATHERmeter()
{
    hull()
    {
        circle(d=46.5);
        translate([17,0,0]) circle(d=43.5);
        translate([41,0,0]) circle(d=33.5);
        translate([52,0,0]) circle(d=24.4);
    }
}

module SeekThermal()
{union(){
    square([33,20]);
    translate([16,20]) square([9,8]);
    translate([0,9]) circle(d=22);
    
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
    translate([-15,10.5]) square([15,4.5]);
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
        translate([0, 32-(25/2)-2.5]) circle(d=5);
    }
    translate([-5.5/2, -(5 + 25/2)]) square([5.5,5.5]);
}}


module Microscope()
{union(){
    square([27, 20]);
    translate([-(38-27)/2-1,20]) square([38, 18]);
}}

module Tweezers()
{
   square([9.5,100.5]);
}