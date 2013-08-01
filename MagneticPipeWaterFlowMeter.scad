vawt();
rotate(60) vawt();

difference(){
	cylinder(h=500,r=210,center=true);
	cylinder(h=500,r=190,center=true);
}






module raindrop(){
union(){
translate([0,5,0,]){
scale(v=[1,2,1]){
rotate(45){
square(size=10,center=true);
}}}
scale(v=[0.95,1,1]){
circle(r=9);}}}


module foil(){

rotate(90) scale(v=[0.5,1,1]){
raindrop();}}

module blade()
{
linear_extrude(height = 500, center = true, convexity = 10, twist = 60)
translate([190, 0, 0]){
scale([2,3,1]){
foil();}}}


module vawt()
for ( i = [0:2] ) {
 rotate( i*360/3, [0, 0, 1])
  translate( [0, 10, 0] ) blade();
}
















