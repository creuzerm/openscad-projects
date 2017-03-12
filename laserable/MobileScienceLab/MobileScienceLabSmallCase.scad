CellWidth = 93;
CellLength = 170;
CellCorner = 40;
Pelican1065Width = 197;
Pelican1065Length = 253;
Pelican1065Corner = 38;





difference()
{
BasePelican1065();
    
    translate([82,-10])  GalaxyNoteEdgeZeroLemonCase();
    
    translate([15,79]) KodakLens();
    translate([61, 123]) rotate(a=[0,0,-45]) Loupe();
    translate([40, 104]) rotate(a=[0,0,90]) Microscope();
    translate([-13, 35]) Tweezers();

    translate([41, 80])SeekThermal();
    translate([52,12]) rotate(a=[0,0,-170]) WeatherFlowWEATHERmeter();
    translate([5, 57]) rotate(a=[0,0,-90]) WeatherFlowWEATHERmeterMicPlug();

// Lets stack these
    translate([-10, 140]) MicroscopeSlide();
    translate([3, 153]) Scissors(Layer,false);

    translate([-11,29]) rotate(a=[0,0,-70]) USBThumbDrive();
    
translate([4,43]) circle(d=10.3);

//Only some layers get this.
translate([25,-12]) mirror([1,0,0]) Caliper();

    //translate([35, 37])Flashfill();


}





















% CellA();




module CellA()
{
difference()
{
BaseCell();
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
}



module GalaxyNoteEdgeZeroLemonCase()
{
    square([87,155]);
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

module WeatherFlowWEATHERmeterMicPlug()
{
    square([6,6], center=true);
    translate([0,6]) square([10,7], center=true);
    translate([0,16]) square([5,20], center=true);
}

module SeekThermal()
{union(){
    square([33,20]);
    translate([16,20]) square([9,8]);
    translate([0,9]) circle(d=22);
    
}}

//Scissors(0, false);
module Scissors(layer, standing)
{
    if(standing == true)
    {
        hull()
        {
            circle(d=5);
            translate([(85-5)/2,0]) circle(d=10);
            translate([85-5,0]) circle(d=5);
        }
    }else
    {
        hull()
        {
            circle(d=25);
            translate([-10,-2]) circle(d=15);
            translate([50,0]) circle(d=25);
            translate([60,-2]) circle(d=15);

        }
    }
    
}

module MicroscopeSlide()
{
    square([76,26]);
}

module Flashfill()
{union(){
    square([39,39]);
    translate([-15,10.5]) square([15,4.5]);
}}


module BasePelican1065()
{
    hull()
    {
        circle(d=Pelican1065Corner);
        translate([Pelican1065Width-Pelican1065Corner, 0 ]) circle(d=Pelican1065Corner);
        translate([0, Pelican1065Length-Pelican1065Corner ])circle(d=Pelican1065Corner);
        translate([Pelican1065Width-Pelican1065Corner, Pelican1065Length-Pelican1065Corner ]) circle(d=Pelican1065Corner);
    }
}

module BaseCell()
{
    hull()
    {
        circle(d=CellCorner);
        translate([CellWidth-CellCorner, 0 ]) circle(d=CellCorner);
        translate([0, CellLength-CellCorner ])circle(d=CellCorner);
        translate([CellWidth-CellCorner, CellLength-CellCorner ]) circle(d=CellCorner);
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

//Caliper();
module Caliper()
{
   square([16,141]); 
   translate([-11,141]) square([34,70]); 
   translate([-40,211-29]) square([74,29]); 
}