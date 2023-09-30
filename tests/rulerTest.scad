 include<../__.scad>
 

	union(){
		translate([10,10,10])
		cube([10,10,10]);
		
		translate([20,20,20])
		__rxyz() cube([10,10,10]);
		}            